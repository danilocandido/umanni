require "rails_helper"

RSpec.describe 'Users', type: :request do
  let(:role) { :admin }
  let(:session_params) { { 'user_id' => user.id } }
  let(:user) do
    User.new(
      full_name: 'Danilo Pereira',
      email: 'danilo@mail.com',
      password: '123456',
      role: role
    )
  end

  before do
    user.save!
    post '/login', :params => { email: user.email, password: user.password }
  end

  context 'GET /users' do
    subject { get '/users' }

    it { is_expected.to eq 200 }
  end

  context 'GET /user/:id' do
    subject { get user_path(user) }

    it { is_expected.to eq 200 }
  end

  context 'POST /user' do
    subject { post users_path, :params => params }

    context 'when user params has valid values' do
      let(:params) do
        {
          user: {
            email: 'alice@mail.com',
            full_name: 'Alice Silva',
            role: 'no_admin',
            password: '123456'
          }
        }
      end

      it { is_expected.to redirect_to(root_path) }
    end

    context 'when user paras is invalid' do
      let(:params) do
        {
          user: {
            email: nil,
            full_name: 'Alice Silva',
          }
        }
      end
      
      it { is_expected.to redirect_to('/signup') }
    end
  end
end