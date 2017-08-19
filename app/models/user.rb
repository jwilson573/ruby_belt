class User < ActiveRecord::Base
  has_many :ideas, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea




  
  has_secure_password
  before_save :downcase_fields
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :alias, presence: true, length: 2..30
  # validates_format_of :name, :alias, with: /\A[-a-z]+\Z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }


  def downcase_fields
    self.name.downcase!
    self.alias.downcase!
    self.email.downcase!
  end
end
