FactoryGirl.define do
  factory :todo do
    title { FFaker::NameBR.first_name }
    body { FFaker::NameBR.last_name }
    due_date "2015-12-22 00:07:03"
    completed false
    remember false
    user
  end

end
