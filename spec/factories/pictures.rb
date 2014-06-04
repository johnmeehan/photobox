# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
    title "MyString"
    description "MyText"

    trait :attachment do 
    	file  {File.join(Rails.root, 'spec','fixtures','coke.jpg')}	
    	# file ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/fixtures/coke.jpg"), :filename => "coke.jpg")
    end
  end
end
