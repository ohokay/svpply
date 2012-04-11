require 'webmock'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr'
  c.hook_into :webmock
end
