require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(user_attributes) }

  context 'email' do
    let(:user_attributes) do
      {
        full_name: 'Alice Silva',
        email: email, 
        password: '123456'
      }
    end

    context 'when email is invalid' do
      let(:email) { 'aaabbbccc' }

      it { is_expected.to be_invalid }
    end

    context 'when email is valid' do
      let(:email) { 'alice@mail.com' }

      it { is_expected.to be_valid }
    end

    context 'when email is duplicated' do
      let(:user_attributes) do
        {
          full_name: 'Alice Silva',
          email: 'alice@mail.com', 
          password: '123456'
        }
      end

      it do
        user = User.create(user_attributes)

        expect { user.dup.save! }.to raise_error(ActiveRecord::RecordNotUnique)
      end
    end

  end
end