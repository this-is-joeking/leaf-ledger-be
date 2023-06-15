require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many :user_plants }
    it { should have_many(:plants).through(:user_plants) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end

  it 'exists with accessible attributes' do
    user = User.create!(name: 'John doe', email: 'john@doe.com')

    expect(user).to be_a User
    expect(user.id).to eq(User.last.id)
    expect(User.last.name).to eq('John doe')
    expect(User.last.email).to eq('john@doe.com')
  end
end
