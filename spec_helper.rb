$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..', 'lib'))
  
require 'rubygems'
require 'rspec'
require 'page-object'
require 'page-object/page_factory'
require 'watir-webdriver'

# world file
RSpec.configure do |c|
  c.include(PageObject::PageFactory) # gives access to visit
end
