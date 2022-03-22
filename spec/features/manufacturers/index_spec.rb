require 'rails_helper'

RSpec.describe 'manufacturers index page', type: :feature do
  it 'can list all manufacturer names' do
    manufacturer_1 = Manufacturer.create(name: "Fender",
                                         headquarter_city: "Los Angeles",
                                         years_in_business: 76,
                                         custom_shop: true,
                                        )
    manufacturer_2 = Manufacturer.create(name: "Gibson",
                                         headquarter_city: "Nashville",
                                         years_in_business: 120,
                                         custom_shop: true,
                                        )
    visit "/manufacturers"
    expect(page).to have_content(manufacturer_1.name)
    expect(page).to have_content(manufacturer_2.name)
  end
end
