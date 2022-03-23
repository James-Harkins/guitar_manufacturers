require 'rails_helper'

RSpec.describe 'manufacturers show page', type: :feature do
  it 'can list manufacturer attributes by id' do
    manufacturer_1 = Manufacturer.create!(name: "Fender",
                                         headquarter_city: "Los Angeles",
                                         years_in_business: 76,
                                         custom_shop: true,
                                        )
    manufacturer_2 = Manufacturer.create!(name: "Gibson",
                                         headquarter_city: "Nashville",
                                         years_in_business: 120,
                                         custom_shop: true,
                                        )
    visit "/manufacturers/#{manufacturer_1.id}"
    expect(page).to have_content(manufacturer_1.name)
    expect(page).to have_content(manufacturer_1.headquarter_city)
    expect(page).to have_content(manufacturer_1.years_in_business)
    expect(page).to have_content(manufacturer_1.custom_shop)
    expect(page).not_to have_content(manufacturer_2.name)
  end

  it 'lists the number of guitars associated with the manufacturer' do
    manufacturer_1 = Manufacturer.create!(name: "Fender",
                                         headquarter_city: "Los Angeles",
                                         years_in_business: 76,
                                         custom_shop: true,
                                        )
    manufacturer_2 = Manufacturer.create!(name: "Gibson",
                                         headquarter_city: "Nashville",
                                         years_in_business: 120,
                                         custom_shop: true,
                                        )
    guitar_1 = manufacturer_1.guitars.create!(model: 'Stratocaster',
                                              num_of_frets: 21,
                                              six_string: true
                                             )
    guitar_2 = manufacturer_1.guitars.create!(model: 'Telecaster',
                                              num_of_frets: 21,
                                              six_string: true
                                             )
    guitar_3 = manufacturer_2.guitars.create!(model: 'Les Paul',
                                              num_of_frets: 22,
                                              six_string: true
                                             )

    visit "/manufacturers/#{manufacturer_1.id}"

    expect(page).to have_content("Current model count: #{manufacturer_1.guitars.count}")
  end

  it 'has a redirect link to the guitars index page' do
    manufacturer_1 = Manufacturer.create!(name: "Fender",
                                         headquarter_city: "Los Angeles",
                                         years_in_business: 76,
                                         custom_shop: true,
                                        )
    manufacturer_2 = Manufacturer.create!(name: "Gibson",
                                         headquarter_city: "Nashville",
                                         years_in_business: 120,
                                         custom_shop: true,
                                        )
    guitar_1 = manufacturer_1.guitars.create!(model: 'Stratocaster',
                                              num_of_frets: 21,
                                              six_string: true
                                             )
    guitar_2 = manufacturer_1.guitars.create!(model: 'Telecaster',
                                              num_of_frets: 21,
                                              six_string: true
                                             )
    guitar_3 = manufacturer_2.guitars.create!(model: 'Les Paul',
                                              num_of_frets: 22,
                                              six_string: true
                                             )
                                             
    visit "/manufacturers/#{manufacturer_1.id}"

    expect(page).to have_link("Guitars Index")

    click_link "Guitars Index"

    expect(current_path).to eq("/guitars")
  end
end
