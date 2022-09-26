require 'rails_helper'

RSpec.describe 'WhetherFacade' do
  it 'returns instances of food with given ingredient', :vcr do
    maps = MapsFacade.get_location('Denver,co')
    whether = WhetherFacade.create_whether(maps)
    expect(whether).to be_a FullWhether
  end

end
