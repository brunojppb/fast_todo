require 'ffaker'

FactoryGirl.define do
  factory :user do
    first_name { FFaker::NameBR.first_name }
    last_name { FFaker::NameBR.last_name }
    email { FFaker::Internet.email }
    password "123456"
    password_confirmation "123456"
    is_active false
  end

end
