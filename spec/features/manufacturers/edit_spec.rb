require 'rails_helper'

RSpec.describe 'manufacturers edit page', type: :feature do
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

  describe 'update existing manufacturer' do
    it 'has a link to update the manufacturer on its show page' do
      visit "/manufacturers/#{@manufacturer_2.id}"

      click_link 'Update Manufacturer'

      expect(current_path).to eq("/manufacturers/#{@manufacturer_2.id}/edit")
    end

    it 'can create a new manufacturer' do
      visit "/manufacturers/#{@manufacturer_2.id}"

      click_link 'Update Manufacturer'

      fill_in 'Name', with: 'Ibanez'
      fill_in 'Headquarter city', with: 'Nagoya'
      fill_in 'Years in business', with: '65'
      check 'Custom shop'
      click_on 'Update Manufacturer'

      expect(current_path).to eq("/manufacturers/#{@manufacturer_2.id}")
      expect(page).to have_content('Ibanez')
    end
  end
end
