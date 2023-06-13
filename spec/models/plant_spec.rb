require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it { should belong_to :user}
  end
end
