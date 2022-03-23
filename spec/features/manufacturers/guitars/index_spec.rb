require 'rails_helper'

RSpec.describe 'manufacturers show_guitars page' do
  it 'can list all guitars for some manufacturer id' do
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

    visit "/manufacturers/#{manufacturer_1.id}/guitars"

    expect(page).to have_content(guitar_1.model)
    expect(page).to have_content(guitar_1.num_of_frets)
    expect(page).to have_content(guitar_1.six_string)
    expect(page).to have_content(guitar_2.model)
    expect(page).to have_content(guitar_2.num_of_frets)
    expect(page).to have_content(guitar_2.six_string)
    expect(page).not_to have_content(guitar_3.model)
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

  it 'has a redirect link to the manufacturers index page' do
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

    expect(page).to have_link("Manufacturers Index")

    click_link "Manufacturers Index"

    expect(current_path).to eq("/manufacturers")
  end
end
