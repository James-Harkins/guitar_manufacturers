require 'rails_helper'

RSpec.describe 'manufacturers new page', type: :feature do
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

  describe 'create new manufacturer' do
    it 'has a link to create a new manufacturer' do
      visit '/manufacturers'

      click_link 'New Manufacturer'

      expect(current_path).to eq('/manufacturers/new')
    end

    it 'can create a new manufacturer' do
      visit '/manufacturers'

      click_link 'New Manufacturer'

      fill_in 'Name', with: 'Ibanez'
      fill_in 'Headquarter City', with: 'Nagoya'
      fill_in 'Years In Business', with: '65'
      check 'Custom Shop'
      click_on 'Create Manufacturer'

      expect(current_path).to eq('/manufacturers')
      expect(page).to have_content('Ibanez')
    end
  end
end
