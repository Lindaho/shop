RSpec.configure do |config|
  # Clean/Reset Mongoid DB prior to running each test.
  config.use_transactional_fixtures = false

  config.before :each do
    DatabaseCleaner[:mongoid].strategy = :truncation
    DatabaseCleaner[:mongoid].start
  end

  config.after do
    DatabaseCleaner[:mongoid].clean
  end
end