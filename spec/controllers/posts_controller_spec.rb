require 'rails_helper'
include Sorcery::TestHelpers::Rails::Controller

RSpec.describe PostsController, type: :controller do

  context "when user NOT logged in" do

    describe "GET #new" do
      it "redirect to index page" do
        get :new
        expect(response).to redirect_to root_path
      end
    end

    describe "GET #show" do
      let(:post) { create :post }

      it "render show post page" do
        get :show, params: { id: post.id }
        expect(response).to render_template :show
      end
    end

    describe "GET #index" do
      let(:posts) { create_list :post, 2 }

      it "render index posts page" do
        get :index
        expect(response).to render_template :index
      end

      it "render index posts page" do
        get :index
        expect(assigns(:posts)).to include(*posts)
      end
    end
  end

  context "when user logged in" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      login_user(user, signin_path)
    end

    it "render new post page" do
      get :new
      expect(response).to render_template :new
    end

    context "with valid attributes" do
      let(:post_valid_params) { FactoryGirl.attributes_for(:post) }

      it "creates new object" do
        expect{
          post :create, params: { post: post_valid_params }
        }.to change(Post, :count).by(1)
      end

      it "rendirects to post path" do
        post :create, params: { post: post_valid_params }
        expect(response).to redirect_to post_path(Post.last)
      end
    end

    context "with not valid attributes" do
      let(:post_invalid_params) { FactoryGirl.attributes_for(:post).merge({title: nil}) }

      it "not save object to db" do
        expect{
          post :create, params: { post: post_invalid_params }
        }.to_not change(Post, :count)
      end

      it "render new view" do
        post :create, params: { post: post_invalid_params }
        expect(response).to redirect_to new_post_path
      end
    end
  end
end
