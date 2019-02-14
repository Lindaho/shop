require 'rails_helper'

RSpec.describe Shop, type: :model do
	it { is_expected.to be_embedded_in :user }
end
