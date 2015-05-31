#Test Case: C1266
#require 'GUIDESPARK/lib/testrailconnection'

require_relative 'spec_helper'
require_relative 'videosearch'
require_relative 'testrailconnection'
require_relative 'videosearch'
require_relative 'HelperMethods'
    
RSpec.describe "Search Video" do
  include HelperMethods
  
  before do
    @browser = Watir::Browser.new :firefox
    @video_search_page = VideoSearch.new @browser
    @tc_id = '1266'
    @tr_id = '124'
    @status = :Failed
    puts @status
  end
  
  it "should be successful if video exists" do
    video_search = "GuideSpark"   
    visit VideoSearch do |page|
      @video_link = page.get_video_by_title(video_search, video_search)
      expect(@video_link).to exist
      @status = :Passed
    end
    
  end
 
  after do
    puts @status
    @browser.close
    post_to_test_rail(@status, @tr_id, @tc_id) 
  end
 
end
