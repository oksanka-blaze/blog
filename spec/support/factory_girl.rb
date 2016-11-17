# spec/support/factory_girl.rb
RSpec.configure do |config|
  # ... other FactoryGirl configs
  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)

    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end