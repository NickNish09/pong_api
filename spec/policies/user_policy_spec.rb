require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  subject { described_class.new(user, other_user) }

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  context 'when the user is an admin' do
    let(:user) { create(:user, :admin) }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:update) }
    it { is_expected.to permit_action(:destroy) }
  end

  context 'when the user is not an admin' do
    it { is_expected.to forbid_action(:index) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_action(:update) }
    it { is_expected.to forbid_action(:destroy) }
  end
end
