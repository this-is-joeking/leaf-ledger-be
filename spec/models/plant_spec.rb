require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it { should have_many :user_plants }
    it { should have_many(:users).through(:user_plants) }
  end

  describe 'validations' do
    it { should validate_presence_of :common_name }
    it { should validate_presence_of :scientific_name }
  end

  it 'exists with accessible attributes' do
    plant = Plant.create!({
                            scientific_name: 'Capsicum annuum',
                            common_name: 'Jalapeno',
                            sun_exposure: 'Full sun',
                            planting_time: 'Late spring to early summer',
                            planting_method: 'Seedlings or direct sow',
                            watering: 'Regular watering, keep soil moist but not waterlogged',
                            fertilization: 'Fertilize with a balanced fertilizer every 3-4 weeks',
                            pruning: 'Pinch off the first flowers to encourage branching and more fruit production',
                            harvest_timeline: '70-80 days after planting',
                            harvest_method: 'Harvest when the peppers are firm and green, or wait for them to turn red for a spicier taste',
                            pests: 'Aphids, spider mites, and whiteflies can be common pests for jalapenos',
                            homeopathic_remedies: 'Spraying the plants with a mixture of water and dish soap can help control aphids and spider mites. Planting marigolds nearby can also help deter pests.',
                            spacing: '18-24 inches between plants',
                            other_notes: 'Jalapenos prefer well-draining soil, and may benefit from staking or cages as they grow.'
                          })

    expect(plant).to be_a Plant
    expect(Plant.last.scientific_name).to eq('Capsicum annuum')
  end
end
