require "rails_helper"

RSpec.describe Session, type: :model do
  subject { build :session }
  describe 'validations' do
    it { is_expected.to validate_uniqueness_of :token }
    it { is_expected.to validate_presence_of :token }
    it { is_expected.to validate_presence_of :user }
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
  end

  describe 'authorize user with credentials' do
    subject(:session) { Session.auth_with_credentials auth_username, auth_password }

    let!(:user) { create :user, username: username, email: email, password: password }
    let(:username) { Faker::Internet.user_name }
    let(:email) { Faker::Internet.email }
    let(:password) { Faker::Internet.password }

    let(:auth_username) { username }
    let(:auth_password) { password }

    context 'with valid credentials' do
      it 'authorize user with valid username and password' do
        expect(session.persisted?).to be_truthy
        is_expected.to be_a Session
        expect(session.user).to eql user
      end
    end

    context 'with invalid username' do
      let(:auth_username) { Faker::Internet.user_name }
      it 'expect to raise exception' do
        expect { session }.to raise_exception(UnauthorizedError)
      end
    end

    context 'with invalid password' do
      let(:auth_password) { Faker::Internet.password }
      it 'expect to raise exception' do
        expect { session }.to raise_exception(UnauthorizedError)
      end
    end
  end

  describe 'authorize user with token' do
    subject(:session) { Session.auth_with_token auth_token }

    let!(:session) { create :session }
    let(:auth_token) { session.token }

    context 'with valid token' do
      it 'authorize user with valid token' do
        expect(session.persisted?).to be_truthy
        is_expected.to be_a Session
        expect(session).to eql session
      end
    end

    context 'with invalid token' do
      let(:auth_token) { SecureRandom.base64 20 }
      it 'expect to raise exception' do
        expect { session }.to raise_exception(UnauthorizedError)
      end
    end
  end
end