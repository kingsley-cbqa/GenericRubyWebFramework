require_relative 'spec_helper'

RSpec.describe "Search Video", :tr_id => '124' do
  
  before :context do
    config_properties_ = YAML::load_file(File.join(File.dirname(__FILE__), 'search_youtube_spec.yml'))
    @config_properties = config_properties_.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
    browser_type = @config_properties[:browser]
    @browser = Watir::Browser.new browser_type.to_sym

    video_search_page = VideoSearch.new @browser 
  end
  
  it "should be successful if video exists", :tc_id => '1266', :functional => true do
    video_search = "GuideSpark"   
    visit VideoSearch do |page|
      video_link = page.get_video_by_title(video_search, video_search)
      expect(video_link).to exist
    end
  end
 
  it "should be unsuccessful if video does not exist", :tc_id => '1267', :functional => true do
     video_search = "GuideSpark"   
     visit VideoSearch do |page|
       video_link = page.get_video_by_title(video_search, "GuideSpark200")
       expect(video_link).to be nil
     end
  end
  
  after :example do |example|
    status = example.exception.nil? ? :Passed : :Failed
    #post_to_test_rail(status, example.metadata[:tr_id], example.metadata[:tc_id])
  end
  
  after :context do
    @config_properties[:subject] = "Automation Result"
    @config_properties[:filename] = File.join(File.dirname(__FILE__), '..', 'report.html')
    Send_Mail.send_email(@config_properties[:email_recipients], @config_properties)
    @browser.close
  end
 
end
