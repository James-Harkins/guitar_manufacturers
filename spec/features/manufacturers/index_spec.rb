require 'rails_helper'

RSpec.describe 'manufacturers index page', type: :feature do

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

  it 'can list all manufacturer names' do
    visit "/manufacturers"

    expect(page).to have_content(@manufacturer_1.name)
    expect(page).to have_content(@manufacturer_2.name)
  end

  it 'lists manufacturers sorted by created_at' do
    visit "/manufacturers"

    expect(page).to have_content(@manufacturer_1.created_at)
    expect(page).to have_content(@manufacturer_2.created_at)
  end

  it 'has a redirect link to the guitars index page' do
    visit "/manufacturers"

    expect(page).to have_link("Guitars Index")

    click_link "Guitars Index"

    expect(current_path).to eq("/guitars")
  end

  it 'has a redirect link to the manufacturers index page' do
    visit "/manufacturers"

    expect(page).to have_link("Manufacturers Index")

    click_link "Manufacturers Index"

    expect(current_path).to eq("/manufacturers")
  end

  it 'has a link to edit every listed manufacturer' do
    visit "/manufacturers"

    within(:id, "#{@manufacturer_2.id}") do
      click_link('Update Manufacturer')
      expect(current_path).to eq("/manufacturers/#{@manufacturer_2.id}/edit")
    end

    visit "/manufacturers"

    within(:id, "#{@manufacturer_1.id}") do
      click_link('Update Manufacturer')
      expect(current_path).to eq("/manufacturers/#{@manufacturer_1.id}/edit")
    end
  end

  it 'has links to delete each manufacturer' do
    visit "/manufacturers"

    within(:id, "#{@manufacturer_1.id}") do
      click_link('Delete Manufacturer')
      expect(current_path).to eq("/manufacturers")
    end

    expect(page).not_to have_content("#{@manufacturer_1.name}")
    expect(page).to have_content("#{@manufacturer_2.name}")
  end

  it 'can sort manufacturers by guitar count' do
    guitar_4 = @manufacturer_2.guitars.create!(model: 'Les Paul Junior',
                                              num_of_frets: 22,
                                              six_string: true
                                             )
    guitar_5 = @manufacturer_2.guitars.create!(model: 'ES-335',
                                              num_of_frets: 22,
                                              six_string: true
                                             )

    visit "/manufacturers"

    click_on "Sort Manufacturers by Number of Guitars"

    expect(current_path).to eq("/manufacturers")

    expect(@manufacturer_2.name).to appear_before(@manufacturer_1.name)

    expect("Current Guitar Count: #{@manufacturer_2.guitar_count}").to appear_before("Current Guitar Count: #{@manufacturer_1.guitar_count}")
  end

  it 'has links to the show page for each manufacturer' do
    visit "/manufacturers"

    click_link "#{@manufacturer_2.name}"

    expect(current_path).to eq("/manufacturers/#{@manufacturer_2.id}")
  end
end
