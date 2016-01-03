require 'rails_helper'

RSpec.describe Device, type: :model do
  before { @device = FactoryGirl.create :device }
  subject { @device }

  describe "Validations" do
    it { should respond_to :auth_token }
    it { should respond_to :operation_system }
    it { should respond_to :active }

    it { should validate_presence_of :operation_system }
    it { should validate_uniqueness_of :auth_token }

    it { should belong_to :user }

  end
end
