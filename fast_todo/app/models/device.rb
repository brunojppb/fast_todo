class Device < ActiveRecord::Base

  # Validations
  validates :operation_system, :user, presence: true
  validates :auth_token, uniqueness: true
  # Associations
  belongs_to :user

  before_save :generate_auth_token!

  protected
    def generate_auth_token!
      begin
        self.auth_token = SecureRandom.urlsafe_base64(nil, false)
      end while self.class.exists?(auth_token: auth_token)
    end

end
