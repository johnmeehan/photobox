# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
    title "MyString"
    description "MyText"

    trait :attachment do 
    	file { File.new("#{Rails.root}/spec/fixtures/picture.jpeg") }
    end
  end
end
