require "rails_helper"

RSpec.describe PollingLocation, type: :model do
  describe "validations" do
    context "when has all attributes" do
      it "should be valid" do
        polling_location = build(:polling_location)
        expect(polling_location).to be_valid
      end
    end

    context "when a attribute is missing" do
      it "should be invalid" do
        polling_location = build(:polling_location, title: nil)
        expect(polling_location).to be_invalid
      end
    end

    context "when postal code is invalid" do
      it "should be invalid" do
        polling_location = build(:polling_location, postal_code: "0000000")
        expect(polling_location).to be_invalid
      end
    end
  end

  describe "#validate_uniqueness" do
    let(:polling_location) { build(:polling_location) }
    let(:result) { [] }

    before do
      allow(PollingLocation)
        .to receive(:where)
              .with(title: polling_location.title,
                    address: polling_location.address,
                    city: polling_location.city,
                    postal_code: polling_location.postal_code).and_return(result)
    end

    context "when polling location is unique" do
      it "should not add error" do
        polling_location.validate_uniqueness
        expect(polling_location.errors[:duplication]).to be_empty
      end
    end

    context "when polling location is not unique" do
      let(:result) { [double] }
      it "should add error" do
        polling_location.validate_uniqueness
        expect(polling_location.errors[:duplication]).to include("- Polling Location must be unique")
      end
    end
  end
end
