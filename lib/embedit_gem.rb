require 'rubygems'
require 'httparty'

class EmbeditGem
  include HTTParty
  base_uri 'http://embedit.me/embedit'
  headers 'Content-Type' => 'application/json' 
  
  def initialize(url, options={})
    api_key, frog_key = options[:api_key], options[:frog_key]
    height, width = options[:height], options[:width]
    @data = EmbeditGem.get("/", :query => {
                                          :url => url,
                                          :height => height,
                                          :width => width,
                                          :api_key => api_key,
                                          :frog_key => frog_key
                                        }
                                          )
  end
  
  def html
    @data['html']
  end
  
  def title
    @data['title']
  end
  
  def valid?
    @data['valid']
  end
  
  def format
    @data['format']
  end
  
  def fbml
    @data['fbml']
  end
  
end