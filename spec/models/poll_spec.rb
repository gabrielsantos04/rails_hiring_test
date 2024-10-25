require "rails_helper"

RSpec.describe Poll, type: :model do
  describe "validations" do
    context "when has all attributes" do
      it "should be valid" do
        poll = build(:poll)
        expect(poll).to be_valid
      end
    end

    context "when a attribute is missing" do
      it "should be invalid" do
        poll = build(:poll, number: nil)
        expect(poll).to be_invalid
      end
    end
  end
end
