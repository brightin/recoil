ENV['RAILS_ENV'] = 'test'
ENGINE_RAILS_ROOT = File.join(File.dirname(__FILE__), '../')

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start do
    minimum_coverage 90
    add_filter '/spec/'
  end
end

require File.expand_path('../dummy/config/environment.rb',  __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path('../../test/dummy/db/migrate', __FILE__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path('../../db/migrate', __FILE__)
require 'vcr'
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |c|
  c.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  c.use_transactional_fixtures = true
  c.filter_run :focus
  c.run_all_when_everything_filtered = true

  c.disable_monkey_patching!

  c.warnings = true

  c.default_formatter = 'doc' if c.files_to_run.one?

  c.order = :random

  Kernel.srand c.seed
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
