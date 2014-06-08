RSpec.configure do |config|
	config.before(:suite) do
       DatabaseCleaner.strategy = :transaction
    end
    
    config.before(:each, js: true) do
      DatabaseCleaner[:data_mapper].strategy = :truncation
  	end

    config.before :each do
      DatabaseCleaner.start
    end

    config.after :each do
      DatabaseCleaner.clean
    end
end