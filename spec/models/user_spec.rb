require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many :user_plants }
    it { should have_many(:plants).through(:user_plants) }
  end
end