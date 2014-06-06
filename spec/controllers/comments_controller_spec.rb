require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
  let(:picture){ FactoryGirl.create(:picture, :attachment) }
  describe "create a comment with Ajax" do 
    it "increments Comment count", :js => true do 
      expect do
        xhr :post, :create, comment: {content: "Hi", picture_id: picture.id }
      end.to change(Comment, :count).by(1)
    end
  end

  it 'responds with success', :js => true do 
    xhr :post, :create, comment: {content: "Hello", picture_id: picture.id }
    expect(response).to be_success
  end
end
