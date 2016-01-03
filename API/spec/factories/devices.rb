FactoryGirl.define do
  factory :device do
    # auth_token SecureRandom.urlsafe_base64(nil, false)
    operation_system "Android"
    user
    active true
  end

end
