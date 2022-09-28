require 'rails_helper'

describe MapsService do
  context "class methods" do
    context "#members_by_state" do
      it "returns location in corddinits", :vcr do
        search = MapsService.get_directions("Denver Co", "Texas")
        expect(search).to be_a Hash
        expect(search[:route]).to be_an Hash
        expect(search[:route][:formattedTime]).to be_an String
      end
    end
  end
end
