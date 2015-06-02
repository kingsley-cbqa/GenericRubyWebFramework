require_relative 'spec_helper'

RSpec.describe "Parallel testing", :tr_id => '124', :parallel => true do
  
  it "should print hello world" do
    puts "hello world"
  end
  
end