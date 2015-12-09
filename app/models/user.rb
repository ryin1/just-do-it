require 'bcrypt'

class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :email, presence: true
  validates :password_hash, presence: true
  has_many :lists, dependent: :destroy
  # Using mailboxer for messages
  acts_as_messageable

  include BCrypt

  def name_capitalized
    errors.add(:name, 'name is not capitalized') if name.nil? || name != name.capitalize
  end

  def password
    @password ||= Password.new(password_hash) unless password_hash.nil?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def mailboxer_email(object)
    email
  end
end
