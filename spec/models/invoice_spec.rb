require 'rails_helper'

RSpec.describe Invoice, type: :model do
  subject {build(:invoice)}

  describe 'validations' do
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount).is_greater_than(0) }
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:contragent) }
    it { should validate_presence_of(:currency) }
    it { should validate_presence_of(:date) }
  end

end
