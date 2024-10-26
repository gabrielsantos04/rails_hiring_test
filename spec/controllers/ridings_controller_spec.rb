require "rails_helper"

RSpec.describe RidingsController, type: :controller do
  let(:riding) { create(:riding) }
  let(:poll) { create(:poll, riding: riding) }
  let(:title) { "title" }
  let(:params) do
    {
      riding: {
        polling_locations_attributes: {
          "0": {
            title: title,
            address: "address",
            city: "city",
            postal_code: "t2r 1c4",
            poll_ids: [poll.id],
            _destroy: false
          }
        }
      },
      id: riding.id,
    }
  end

  describe "PUT #update" do
    context "with valid parameters" do
      it "updates the requested riding" do
        put :update, params: params
        expect(response).to redirect_to(riding_url(riding))
        expect(flash[:notice]).to eq "Riding was successfully updated."
      end
    end

    context "with invalid parameters" do
      let(:title) { nil }

      it "do not update the riding" do
        put :update, params: params, format: :turbo_stream
        expect(response.media_type).to eq Mime[:turbo_stream].to_s
      end
    end
  end
end
