require 'rails_helper'

RSpec.describe 'MapsFacade' do
  it 'returns instances of food with given ingredient', :vcr do
    maps = MapsFacade.get_location('Denver,co')

    expect(maps).to be_a Map
  end

end
