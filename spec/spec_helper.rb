ENV["RAILS_ENV"] = "test"
ENGINE_RAILS_ROOT = File.join(File.dirname(__FILE__), '../')

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../test/dummy/db/migrate", __FILE__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path('../../db/migrate', __FILE__)
require 'vcr'
require 'rspec/rails'

RSpec.configure do |c|
  c.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  c.filter_run :focus
  c.run_all_when_everything_filtered = true

  c.disable_monkey_patching!

  c.warnings = true

  if c.files_to_run.one?
    c.default_formatter = 'doc'
  end

  c.order = :random

  Kernel.srand c.seed
end

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
