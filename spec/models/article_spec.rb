require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it { should validate_presence_of :headline }
    it { should validate_uniqueness_of :headline }
  end
end