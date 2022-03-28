require 'rails_helper'

RSpec.describe Manufacturer do
  before :each do
    @manufacturer_1 = Manufacturer.create!(name: "Fender",
                                         headquarter_city: "Los Angeles",
                                         years_in_business: 76,
                                         custom_shop: true,
                                         created_at: Time.parse("2012-09-01")
                                        )
    @manufacturer_2 = Manufacturer.create!(name: "Gibson",
                                         headquarter_city: "Nashville",
                                         years_in_business: 120,
                                         custom_shop: true,
                                         created_at: Time.parse("2015-09-01")
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
    @guitar_4 = @manufacturer_1.guitars.create!(model: 'Jaguar',
                                              num_of_frets: 21,
                                              six_string: true
                                             )
    @guitar_5 = @manufacturer_1.guitars.create!(model: 'Strat7',
                                              num_of_frets: 24,
                                              six_string: false
                                             )
  end

  describe '#relationships' do
    it {should have_many :guitars}
  end

  describe '#validations' do
    it { should validate_presence_of :name }
    it { should allow_value("Suhr Guitars").for(:name) }
    it { should_not allow_value("We_make_guitars!").for(:name) }
    it { should validate_presence_of :headquarter_city }
    it { should allow_value("San Bernardino").for(:headquarter_city) }
    it { should_not allow_value("Austin!").for(:headquarter_city) }
    it { should validate_presence_of :years_in_business }
    it { should allow_value(55).for(:years_in_business) }
    it { should_not allow_value(5.5).for(:years_in_business) }
    it { should_not allow_value(-10).for(:years_in_business) }
    it { should allow_value(false).for(:custom_shop) }
    it { should_not allow_value(nil).for(:custom_shop) }
  end

  describe '#order_descending' do
    it 'should order guitars by most_recently created' do
      expect(Manufacturer.order_descending.first).to eq(@manufacturer_2)
    end
  end

  describe '#guitar_count' do
    it 'can count the current number of guitar objects for some manufacturer' do
      expect(@manufacturer_1.guitar_count).to eq(4)
    end
  end

  describe '#alphabetical guitars' do
    it 'can order guitars alphabetically' do
      expect(@manufacturer_1.alphabetical_guitars.first).to eq(@guitar_4)
    end
  end

  describe '#guitars_with_frets_over' do
    it 'can return only guitars with more than a number of frets passed in as an argument' do
      expect(@manufacturer_1.guitars_with_frets_over(22).count).to eq(1)
    end
  end
end
