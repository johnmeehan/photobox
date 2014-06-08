# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
    title "MyString"
    description "MyText"

    trait :attachment do 
    	# file { File.new('#{Rails.root}/spec/fixtures/coke.jpg', 'image/jpg') }
    	file { File.new("#{Rails.root}/spec/fixtures/coke.jpeg") }
    	# file {fixture_file_upload('spec/fixtures/coke.jpg', "image/jpg")}
    	# file  {File.join(Rails.root, 'spec','fixtures','coke.jpg')}	
    	# file ActionDispatch::Http::UploadedFile.new(:tempfile => File.new("#{Rails.root}/spec/fixtures/coke.jpg"), :filename => "coke.jpg")
    end
  end
end
