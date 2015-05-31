#A class with methods for searching and veryfying a video exists in Youtube. (Watir driver is use to interact with browser)
require 'rubygems'

class VideoSearch
  include PageObject
  
  page_url 'https://www.youtube.com'
  
  text_field(:search_field, id: 'masthead-search-term')
  button(:search, id: 'search-btn')
  
  def video_link(video_title)
    browser.link(title: video_title)
  end
  
  def get_video_by_title(video_search, expected_video_title)
    
    self.search_field = video_search
    search
    
    # TODO wait for page to load results successfully
    
    # get link or null
    expected_video_link = video_link(expected_video_title)
    return expected_video_link if expected_video_link.exists?
    
  end
 
	
end
