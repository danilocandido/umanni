require "rails_helper"

RSpec.describe 'Sessions', type: :request do
  let(:user) do
    User.new(
      full_name: 'Danilo Pereira',
      email: 'danilo@mail.com',
      password: '123456',
      role: role
    )
  end

  context 'GET /login' do
    subject { get '/login' }

    it { is_expected.to eq 200 }
  end

  context 'GET /logout' do
    subject { get '/logout' }

    it { is_expected.to redirect_to(login_path) }
  end

  context 'POST /login' do
    subject { post '/login', :params => params }

    let(:params) do
      {
        email: 'danilo@mail.com',
        password: '123456'
      }
    end

    before { user.save! }

    context 'when user is admin' do
      let(:role) { :admin }

      it { is_expected.to redirect_to(root_path) }
    end

    context 'when user is not admin' do
      let(:role) { :no_admin }

      it { is_expected.to redirect_to(user_path(user)) }
    end

    context 'when password or email is invalid' do
      let(:role) { :no_admin }

      let(:params) do
        {
          email: 'abcde@mail.com',
          password: '123456'
        }
      end

      it { is_expected.to redirect_to(login_path) }
    end
  end
end