require 'ffaker'

FactoryGirl.define do
  factory :user do
    first_name { FFaker::NameBR.first_name }
    last_name { FFaker::NameBR.last_name }
    email { FFaker::Internet.email }
    password_digest "123456"
    is_active false
  end

end
