require 'rails_helper'

RSpec.describe 'guitar edit page' do
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

  describe 'update existing guitar' do
    it 'has a link to update the guitar on its show page' do
      visit "/guitars/#{@guitar_2.id}"

      click_link 'Update Guitar'

      expect(current_path).to eq("/guitars/#{@guitar_2.id}/edit")
    end

    it 'can update an existing guitar' do
      visit "/guitars/#{@guitar_2.id}"

      click_link 'Update Guitar'

      fill_in 'Model', with: 'Jaguar'
      fill_in 'Num of frets', with: '21'
      check 'Six string'
      click_on 'Update Guitar'

      expect(current_path).to eq("/guitars/#{@guitar_2.id}")
      expect(page).to have_content('Jaguar')
    end
  end
end
