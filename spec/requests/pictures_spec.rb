require 'rails_helper'

RSpec.describe "Pictures", :type => :request do
  describe "Pictures" do
    it "GET /pictures" do
      get pictures_path
      expect(response.status).to be(200)
    end
    
  end
end
