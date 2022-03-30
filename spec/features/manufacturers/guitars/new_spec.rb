require 'rails_helper'

RSpec.describe 'manufacturer_guitars new page' do
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

  describe 'create new guitar' do
    it 'has a link to create a new guitar' do
      visit "/manufacturers/#{@manufacturer_1.id}/guitars"

      click_link 'Create Guitar'

      expect(current_path).to eq("/manufacturers/#{@manufacturer_1.id}/guitars/new")
    end

    it 'can create a new manufacturer' do
      visit "/manufacturers/#{@manufacturer_1.id}/guitars"

      click_link 'Create Guitar'

      fill_in 'Model', with: 'Jaguar'
      fill_in 'Num of frets', with: '21'
      check 'Six string'
      click_on 'Create Guitar'

      expect(current_path).to eq("/manufacturers/#{@manufacturer_1.id}/guitars")
      expect(page).to have_content('Jaguar')
    end
  end
end
