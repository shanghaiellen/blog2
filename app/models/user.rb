class User < ActiveRecord::Base
  before_save :encrypt_password
  has_many :posts
  has_many :comments
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_uniqueness_of :email, allow_blank: true
  validates :email, allow_blank: true, format: { with: /\w+@\w+\.\w+/, message: "is not a valid email address"}
  
  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end