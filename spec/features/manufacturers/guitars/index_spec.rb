require 'rails_helper'

RSpec.describe 'manufacturers show_guitars page' do

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
    @guitar_4 = @manufacturer_1.guitars.create!(model: 'Jaguar',
                                               num_of_frets: 21,
                                               six_string: true
                                             )
    @guitar_5 = @manufacturer_1.guitars.create!(model: 'Strat7',
                                               num_of_frets: 24,
                                               six_string: false
                                             )
  end

  it 'can list all guitars for some manufacturer id' do

    visit "/manufacturers/#{@manufacturer_1.id}/guitars"

    expect(page).to have_content(@guitar_1.model)
    expect(page).to have_content(@guitar_1.num_of_frets)
    expect(page).to have_content(@guitar_1.six_string)
    expect(page).to have_content(@guitar_2.model)
    expect(page).to have_content(@guitar_2.num_of_frets)
    expect(page).to have_content(@guitar_2.six_string)
    expect(page).not_to have_content(@guitar_3.model)
  end

  it 'has a redirect link to the guitars index page' do
    visit "/manufacturers/#{@manufacturer_1.id}/guitars"

    expect(page).to have_link("Guitars Index")

    click_link "Guitars Index"

    expect(current_path).to eq("/guitars")
  end

  it 'has a redirect link to the manufacturers index page' do
    visit "/manufacturers/#{@manufacturer_1.id}/guitars"

    expect(page).to have_link("Manufacturers Index")

    click_link "Manufacturers Index"

    expect(current_path).to eq("/manufacturers")
  end

  it 'can sort guitars alphabetically' do
    visit "/manufacturers/#{@manufacturer_1.id}/guitars"

    expect(@guitar_1.model).to appear_before(@guitar_2.model)
    expect(@guitar_2.model).to appear_before(@guitar_4.model)

    click_link "Sort Alphabetically"

    expect(current_path).to eq("/manufacturers/#{@manufacturer_1.id}/guitars")
    expect(@guitar_4.model).to appear_before(@guitar_1.model)
    expect(@guitar_1.model).to appear_before(@guitar_2.model)
  end

  it 'has a link to edit every listed manufacturer' do
    visit "/manufacturers/#{@manufacturer_1.id}/guitars"

    within(:id, "#{@guitar_1.id}") do
      click_link('Update Guitar')
      expect(current_path).to eq("/guitars/#{@guitar_1.id}/edit")
    end

    visit "/manufacturers/#{@manufacturer_1.id}/guitars"

    within(:id, "#{@guitar_4.id}") do
      click_link('Update Guitar')
      expect(current_path).to eq("/guitars/#{@guitar_4.id}/edit")
    end

    visit "/manufacturers/#{@manufacturer_2.id}/guitars"

    within(:id, "#{@guitar_3.id}") do
      click_link('Update Guitar')
      expect(current_path).to eq("/guitars/#{@guitar_3.id}/edit")
    end
  end

  it 'has a form to return only records that meet some user condition' do
    visit "/manufacturers/#{@manufacturer_1.id}/guitars"

    expect(page).to have_button("Only return guitars with more than this many frets")

    fill_in "Minimum frets", with: "22"

    click_button("Only return guitars with more than this many frets")

    expect(current_path).to eq("/manufacturers/#{@manufacturer_1.id}/guitars")

    expect(page).to have_content("#{@guitar_5.model}")
    expect(page).not_to have_content("#{@guitar_1.model}")
    expect(page).not_to have_content("#{@guitar_2.model}")
    expect(page).not_to have_content("#{@guitar_3.model}")
    expect(page).not_to have_content("#{@guitar_4.model}")
  end

  it 'has links to delete each guitar' do
    visit "/manufacturers/#{@manufacturer_1.id}/guitars"

    within(:id, "#{@guitar_1.id}") do
      click_link('Delete Guitar')
      expect(current_path).to eq("/manufacturers/#{@manufacturer_1.id}/guitars")
    end

    expect(page).not_to have_content("#{@guitar_1.name}")
    expect(page).to have_content("#{@guitar_2.name}")
    expect(page).to have_content("#{@guitar_3.name}")
    expect(page).to have_content("#{@guitar_4.name}")
  end
end
