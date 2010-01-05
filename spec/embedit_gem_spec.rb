require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "EmbeditGem" do
  
  describe "Good Params" do
    before(:all) do
      mock_request
      @request = EmbeditGem.new('http://www.youtube.com/watch?v=qRuNxHqwazs')
    end
  
    it "should set title" do
      @request.title.should_not be_blank
    end
  
    it "should set format" do
      @request.format.should_not be_blank
    end
  
    it "should set valid to true" do
      @request.valid?.should be_true
    end
    
    it "should set fbml" do
      @request.fbml.should_not be_blank
    end
  end
  
  describe "Bad Params" do
    before(:all) do
      mock_request('valid' => false)
      @request = EmbeditGem.new('http://www.youtube.com/watch?v=qRuNxHqwazs')
    end
  
    it "should set valid to false" do
      @request.valid?.should be_false
    end
  end
  
  private
  
  def mock_request(options={})
    json = {'title' => 'title', 'format' => 'format', 'html' => 'html', 
            'valid' => true, 'fbml' => 'fbml'}.merge!(options)
    EmbeditGem.stub!(:get).and_return(json)
  end
end
