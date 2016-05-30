require "rails_helper"

RSpec.describe Image, type: :model do
  subject { build :image }
  describe 'validations' do

  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
  end
end