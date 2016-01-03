require 'rails_helper'

RSpec.describe Todo, type: :model do
  before { @todo = FactoryGirl.create :todo }
  subject { @todo }

  describe "Validations" do
    it { should respond_to :title }
    it { should respond_to :body  }
    it { should respond_to :remember }
    it { should respond_to :due_date }

    it { should validate_presence_of :title }

    it { should belong_to :user }

  end
end
