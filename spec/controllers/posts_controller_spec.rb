require 'rails_helper'

describe PostsController do
  let(:user) { create(:user) }
  describe '#index' do
    context 'not log in' do
      before do
        get :index
      end
      it 'redirects to root_path' do
        expect(response).to redirect_to(root_path)
      end
    end
  end

describe '#create' do
  let(:params) { {user_id: user.id, post: attributes_for(:post) } }

  context 'log in' do
    before do
      login user
    end

      context 'can save' do
        subject {
          post :create,
          params: params
        }
    
        it 'count up message' do
            expect{ subject }.to change(Post, :count).by(1)
          end
        it 'redirects to posts_path' do
          subject
          expect(response).to redirect_to(posts_path)
        end
      end

    context 'can not save' do
      let(:invalid_params) { { user_id: user.id, post: attributes_for(:post, title: nil, content: nil, image: nil) } }
      
        subject {
        post :create,
        params: invalid_params
        }
      
        it 'does not count up' do
        expect{ subject }.not_to change(Post, :count)
        end

        it 'renders index' do
          subject
          expect(response).to render_template :new
        end
      end
    end
  end
end