class User < ActiveRecord::Base

  # Validations
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :first_name, :last_name, :email,  presence: true,
                                              length: { maximum: 250 }
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_blank: true

  before_save :email_downcase
  has_secure_password

  # Associations

  protected
    def email_downcase
      self.email = self.email.downcase
    end

end
