require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it { should have_many :user_plants }
    it { should have_many(:users).through(:user_plants) }
  end
end
