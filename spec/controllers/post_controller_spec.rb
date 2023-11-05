# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user, role: 'admin') }

  # before(:each) do
  #   sign_in user
  # end

  describe 'GET #index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:post) { create(:post) }

    it 'responds successfully' do
      get :show, params: { id: post.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    let(:user) { FactoryBot.create(:user, role: 'admin') }
    it 'responds successfully' do
      sign_in user
      # binding.pry
      get :new
      # binding.pry
      # expect(response).to be_successful
      expect(response).to redirect_to(post_path(id: Post.last.id))
    end
  end

  describe 'POST #create' do
    let(:user) { FactoryBot.create(:user, role: 'admin') }

    it 'creates a new post' do
      sign_in user
      post_attributes = attributes_for(:post)
      expect do
        post :create, params: { post: post_attributes, id: Post.last.id }
      end.to change(Post, :count).by(1)
      # binding.pry
      # expect(response).to redirect_to(post_path(assigns(:post)))
      # expect(response).to render_template('post_path')
      # expect(response).to redirect_to(post_path(id: Post.last.id))
      # expect(Post.count).to eq(1)
    end
  end

  describe 'GET #edit' do
    let(:user) { FactoryBot.create(:user, role: 'admin') }

    it 'renders the edit template' do
      sign_in user
      post = create(:post)
      get :edit, params: { id: post.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    let(:user) { FactoryBot.create(:user, role: 'admin') }

    it 'updates the requested post with valid attributes' do
      sign_in user
      post = create(:post)
      updated_attributes = { title: 'Updated Title', body: 'Updated Body' }
      # binding.pry
      patch :update, params: { id: post.id, post: updated_attributes }
      post.reload
      # binding.pry
      expect(post.title).to eq('Updated Title')
      expect(post.body).to eq('Updated Body')
    end

    it 'does not update the requested post with invalid attributes' do
      sign_in user
      post = create(:post)
      invalid_attributes = { title: nil }
      patch :update, params: { id: post.id, post: invalid_attributes }
      post.reload
      expect(post.title).not_to be_nil
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { FactoryBot.create(:user, role: 'admin') }

    it 'destroys the requested post' do
      sign_in user
      post = create(:post)
      expect do
        delete :destroy, params: { id: post.id }
      end.to change(Post, :count).by(1)
      expect(response).to redirect_to(posts_path)
    end
  end

  describe 'like and dislike a post' do
    let(:user) { FactoryBot.create(:user, role: 'admin') }

    it 'likes a post when it has not been liked by the user' do
      post = create(:post)
      # user = create(:user)
      sign_in user

      expect do
        create(:like, post: post, user: user)
        post.reload
      end.to change(Like, :count).by(1)

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['likes_count']).to eq(1)
    end

    it 'dislikes a post that has been previously liked by the user' do
      # let(:user) { FactoryBot.create(:user, role: 'admin') }

      post = create(:post)
      # user = create(:user)
      create(:like, post: post, user: user)
      sign_in user

      expect do
        delete :like, params: { id: post.id }
        post.reload
      end.to change(Like, :count).by(0)

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['likes_count']).to eq(0)
    end
  end
end

# require 'rails_helper'

# RSpec.describe PostsController, type: :controller do
#   let(:user) { FactoryBot.create(:user, role: 'admin') }

#   before(:each) do
#     sign_in user
#   end

#   describe 'GET #index' do
#     it 'responds successfully' do
#       get :index
#       expect(response).to be_successful
#     end
#   end

#   describe 'GET #show' do
#     it 'responds successfully' do
#       post = FactoryBot.create(:post)
#       get :show, params: { id: post.id }
#       expect(response).to be_successful
#     end
#   end

#   describe 'GET #new' do
#     it 'responds successfully' do
#       get :new
#       expect(response).to be_successful
#     end
#   end

#   describe 'POST #create' do
#     it 'creates a new post' do
#       post_attributes = attributes_for(:post)
#       post :create, params: { post: post_attributes }
#       expect(response).to redirect_to(post_path(assigns(:post)))
#     end
#   end

#   describe 'GET #edit' do
#     it 'renders the edit template' do
#       post = FactoryBot.create(:post)
#       get :edit, params: { id: post.id }
#       expect(response).to render_template(:edit)
#     end
#   end

#   describe 'PATCH #update' do
#     it 'updates the requested post with valid attributes' do
#       post = FactoryBot.create(:post)
#       updated_attributes = { title: 'Updated Title', body: 'Updated Body' }

#       patch :update, params: { id: post.id, post: updated_attributes }
#       post.reload

#       expect(post.title).to eq('Updated Title')
#       expect(post.body).to eq('Updated Body')
#     end
#   end

#   describe 'DELETE #destroy' do
#     it 'destroys the requested post' do
#       post = FactoryBot.create(:post)

#       delete :destroy, params: { id: post.id }

#       expect(post.destroyed?).to be_truthy
#     end
#   end
# end
