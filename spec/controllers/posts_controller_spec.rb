require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET #new" do
    it "render new posts page" do
      get :new
      expect(response).to render_template :new
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
