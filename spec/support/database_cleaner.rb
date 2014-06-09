
RSpec.configure do |config|
	config.before(:suite) do
       DatabaseCleaner[:data_mapper].strategy = :transaction
       DatabaseCleaner[:data_mapper].clean
    end
    
   #  config.before(:each, js: true) do
   #    DatabaseCleaner[:data_mapper].strategy = :truncation
  	# end

    config.before :each do
      DatabaseCleaner.start
    end

    config.after :each do
      DatabaseCleaner.clean
    end
end