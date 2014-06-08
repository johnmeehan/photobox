require 'rails_helper'

RSpec.describe PicturesController, :type => :controller do

  let!(:valid_attributes) {
    FactoryGirl.attributes_for(:picture, :attachment )
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:picture, title: '', description: '')
  }

  let!(:picture){
    FactoryGirl.create(:picture, :attachment)
  }
  
  describe "GET index" do
    it "assigns all pictures to @pictures" do
      get :index 
      # expect(assigns(:pictures)).to include(picture)
      expect(assigns(:pictures).count).to be > 0
    end
  end

  describe "GET show" do
    it "assigns the requested picture as @picture" do
      get :show, {:id => picture.to_param}
      expect(assigns(:picture)).to eq(picture)
    end

    it 'retrieves the comments for a picture' do 
      comment = FactoryGirl.build(:comment)
      picture.comments << comment
      picture.save
      get :show, {:id => picture.to_param}
      expect(assigns(:comments)).to eq([comment])
    end
  end

  describe "GET new" do
    it "assigns a new picture as @picture" do
      get :new 
      expect(assigns(:picture)).to be_a(Picture)
    end
  end

  describe "GET edit" do
    it "assigns the requested picture as @picture" do
      get :edit, {:id => picture.to_param}
      expect(assigns(:picture)).to eq(picture)
    end
  end

  describe "POST create" do
    # before :each { post :create, valid_attributes }
    context "with valid params" do
      # it "creates a new Picture" do
      #   expect {
      #     post :create, picture: FactoryGirl.attributes_for(:picture, :attachment)#valid_attributes
      #   }.to change(Picture, :count).by(1)
      # end

      it "assigns a newly created picture as @picture" do
        post :create, picture: valid_attributes
        expect(assigns(:picture)).to be_a(Picture)
      end
    end

    context "with invalid params" do
      it "does not save the new picture" do
        expect { post :create, invalid_attributes }.to_not change(Picture, :count)
      end

      it "re-renders the 'new' template" do
        post :create, {:picture => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before(:each) do
        @picture = FactoryGirl.create(:picture, :attachment )
      end
      let(:new_attributes) {
          FactoryGirl.attributes_for(:picture, title: "New Title", description: "New Description") 
      }

      it "updates the requested picture" do
        put :update, id: @picture.id, picture: FactoryGirl.attributes_for(:picture, title: "New Title", description: "New Description")
        @picture.reload
        expect(assigns[:picture].title).to eq("New Title")
        expect(assigns[:picture].description).to eq("New Description")
      end

      it "assigns the requested picture as @picture" do
        put :update, :id => @picture, picture: new_attributes
        expect(@picture.reload).to eq(@picture)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'edit' template" do
        put :update, id: picture, :picture => invalid_attributes
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @del_picture = FactoryGirl.create(:picture, :attachment)
    end
    it "destroys the requested picture" do
      expect {
        delete :destroy, {:id => @del_picture.to_param}
      }.to change(Picture, :count).by(-1)
    end

    it "redirects to the pictures list" do
      delete :destroy, {:id => @del_picture.to_param}
      expect(response).to redirect_to(pictures_url)
    end
  end

end
