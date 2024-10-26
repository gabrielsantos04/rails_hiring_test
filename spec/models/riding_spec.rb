require "rails_helper"

RSpec.describe Riding, type: :model do
  describe "validations" do
    context "when has all attributes" do
      it "should be valid" do
        riding = build(:riding)
        expect(riding).to be_valid
      end
    end

    context "when a attribute is missing" do
      it "should be invalid" do
        riding = build(:riding, name: nil)
        expect(riding).to be_invalid
      end
    end
  end
end
