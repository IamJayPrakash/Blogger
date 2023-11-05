# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { FactoryBot.attributes_for(:user) }

      it 'creates a new user' do
        expect do
          post :create, params: { user: valid_params, id: User.last.id }
          # binding.pry
        end.to change(User, :count).by(1)
      end

      # it 'ends a welcome email to the user' do
      #   expect do
      #     post :create, params: { user: valid_params, id: User.last.id }
      #     # binding.pry
      #   end.to have_enqueued_mail(UserMailer, :user_created)
      # end

      it ' the role based on the plan' do
        post :create, params: { user: valid_params.merge(plan: 'monthly'), id: User.last.id }
        # binding.pry
        expect(User.last.role).to eq('normal_user')
      end
      it ' the role based on the plan' do
        post :create, params: { user: valid_params.merge(plan: 'monthlyprof'), id: User.last.id }
        # binding.pry
        expect(User.last.role).to eq('editor')
      end
      it ' the role based on the plan' do
        post :create, params: { user: valid_params.merge(plan: 'monthlyelite'), id: User.last.id }
        # binding.pry
        expect(User.last.role).to eq('admin')
      end

      # it 'attaches the image to the user' do
      #   post :create, params: { user: valid_params, id: User.last.id }
      #   # binding.pry
      #   expect(User.last.userimage).to be_attached
      # end

      it 'redirects to the root path with a notice' do
        post :create, params: { user: valid_params, id: User.last.id }

        expect(response).to redirect_to(root_path)
        # binding.pry
        expect(flash[:notice]).to eq('User created successfully.')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { FactoryBot.attributes_for(:user, email: nil) }

      it 'does not create a new user' do
        expect do
          # binding.pry
          post :create, params: { user: invalid_params, id: User.last.id }
          # binding.pry
        end.not_to change(User, :count)
      end

      it 'renders the new template' do
        # binding.pry
        post :create, params: { user: invalid_params, id: User.last.id }
        # binding.pry
        expect(response).to render_template('devise/registrations/edit')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid parameters' do
      let(:valid_params) { { name: 'New Name' } }

      it 'updates the user' do
        expect do
          put :update, params: { id: user.id, user: valid_params }
        end.to change { user.reload.name }.to('New Name')
      end

      it 'redirects to the user page' do
        put :update, params: { id: user.id, user: valid_params }
        expect(response).to redirect_to(user)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { email: nil } }

      it 'does not update the user' do
        expect do
          put :update, params: { id: user.id, user: invalid_params }
        end.not_to(change { user.reload.email })
      end

      it 'renders the edit template' do
        put :update, params: { id: user.id, user: invalid_params }
        expect(response).to render_template('devise/registrations/edit')
      end
    end
  end

  describe 'PUT #update_subscription' do
    it 'updates the user subscription' do
    end

    it 'sends an email to the user' do
    end
  end

  describe 'before_action :set_user' do
    it 'lets the @user variable' do
      get :profile, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
  end
end
