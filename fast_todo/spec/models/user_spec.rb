require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.create :user }
  subject { @user }

  describe "Validations" do
    it { should respond_to :first_name }
    it { should respond_to :last_name  }
    it { should respond_to :email }
    it { should respond_to :is_active }

    it { should validate_confirmation_of :password }

    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_length_of(:first_name).is_at_most(250) }
    it { should validate_length_of(:first_name).is_at_most(250) }
    it { should validate_length_of(:email).is_at_most(250) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should allow_value('bruno@gmail.com').for(:email) }
    it { should_not allow_value('bruno@.com').for(:email) }

    it { should have_many :devices }

  end

end
