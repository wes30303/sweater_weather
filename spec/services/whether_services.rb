require 'rails_helper'

describe WhetherService do
  context "class methods" do
    context "#members_by_state" do
      it "returns location in corddinits", :vcr do
        cord = MapsFacade.get_location("denver, co")

        search = WhetherService.get_whether(cord)

        expect(search).to be_a Hash

        expect(search).to have_key(:current)
        expect(search).to have_key(:hourly)
        expect(search).to have_key(:daily)

      end
    end
  end
end
