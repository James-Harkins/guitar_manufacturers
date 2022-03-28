require 'rails_helper'

RSpec.describe Guitar do
  describe '#relationships' do
    it {should belong_to :manufacturer}
  end

  describe '#validations' do
    it { should validate_presence_of :model }
    it { should allow_value("Ball Family Reserve JP7").for(:model) }
    it { should_not allow_value("Ball Family Reserve JP7!").for(:model) }
    it { should validate_presence_of :num_of_frets }
    it { should allow_value(15).for(:num_of_frets) }
    it { should_not allow_value(10).for(:num_of_frets) }
    it { should_not allow_value(500).for(:num_of_frets) }
    it { should allow_value(false).for(:six_string) }
    it { should_not allow_value(nil).for(:six_string) }
  end

  describe '#only_six_strings' do
    it 'only returns guitars where six_string = true' do
      manufacturer_1 = Manufacturer.create!(name: "Fender",
                                           headquarter_city: "Los Angeles",
                                           years_in_business: 76,
                                           custom_shop: true,
                                           created_at: Time.parse("2012-09-01")
                                          )
      manufacturer_2 = Manufacturer.create!(name: "Gibson",
                                           headquarter_city: "Nashville",
                                           years_in_business: 120,
                                           custom_shop: true,
                                           created_at: Time.parse("2015-09-01")
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
      guitar_4 = manufacturer_1.guitars.create!(model: 'Jaguar',
                                                num_of_frets: 21,
                                                six_string: true
                                               )
      guitar_5 = manufacturer_1.guitars.create!(model: 'Strat7',
                                                num_of_frets: 24,
                                                six_string: false
                                               )
      expected = (Guitar.only_six_strings.include?(guitar_5))
      expect(expected).to eq(false)
    end
  end
end
