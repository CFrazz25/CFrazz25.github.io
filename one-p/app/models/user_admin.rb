require 'bcrypt'

class UserAdmin < ApplicationRecord
  validates_presence_of :email, :hashed_password

  validates_uniqueness_of :email

  validate :check_password

  def check_password
    if @raw_password == ""
      @errors.add(:password, "needs to be 8 characters or more")
    end
  end

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user = UserAdmin.find_by(email: email)
    return user if user && user.password == password
  end
end
