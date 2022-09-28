require 'rails_helper'

describe MapsService do
  context "class methods" do
    context "#members_by_state" do
      it "returns location in corddinits", :vcr do
        search = MapsService.get_location("Denver Co")
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array

        data = search[:results].first
        expect(data[:locations][0][:latLng]).to be_a Hash
        expect(data[:locations][0][:latLng][:lat]).to be_a Float
        expect(data[:locations][0][:latLng][:lng]).to be_a Float
      end
    end
  end
end
