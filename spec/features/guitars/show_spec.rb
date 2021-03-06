require 'rails_helper'

RSpec.describe 'guitars show page' do

  before :each do
    @manufacturer_1 = Manufacturer.create!(name: "Fender",
                                         headquarter_city: "Los Angeles",
                                         years_in_business: 76,
                                         custom_shop: true,
                                        )
    @manufacturer_2 = Manufacturer.create!(name: "Gibson",
                                         headquarter_city: "Nashville",
                                         years_in_business: 120,
                                         custom_shop: true,
                                        )
    @guitar_1 = @manufacturer_1.guitars.create!(model: 'Stratocaster',
                                              num_of_frets: 21,
                                              six_string: true
                                             )
    @guitar_2 = @manufacturer_1.guitars.create!(model: 'Telecaster',
                                              num_of_frets: 21,
                                              six_string: true
                                             )
    @guitar_3 = @manufacturer_2.guitars.create!(model: 'Les Paul',
                                              num_of_frets: 22,
                                              six_string: true
                                             )
  end

  it 'can list guitar attributes by id' do
    visit "/guitars/#{@guitar_2.id}"

    expect(page).to have_content(@guitar_2.model)
    expect(page).to have_content(@guitar_2.num_of_frets)
    expect(page).to have_content(@guitar_2.six_string)
    expect(page).not_to have_content(@guitar_1.model)
    expect(page).not_to have_content(@guitar_3.num_of_frets)
  end

  it 'has a redirect link to the guitars index page' do
    visit "/guitars/#{@guitar_2.id}"

    expect(page).to have_link("Guitars Index")

    click_link "Guitars Index"

    expect(current_path).to eq("/guitars")
  end

  it 'has a redirect link to the manufacturers index page' do
    visit "/guitars/#{@guitar_2.id}"

    expect(page).to have_link("Manufacturers Index")

    click_link "Manufacturers Index"

    expect(current_path).to eq("/manufacturers")
  end

  it 'has a button to delete the guitar' do
    visit "/guitars/#{@guitar_1.id}"
    
    click_on "Delete Guitar"

    expect(current_path).to eq("/guitars")
    expect(page).not_to have_content("#{@guitar_1.model}")
  end
end
