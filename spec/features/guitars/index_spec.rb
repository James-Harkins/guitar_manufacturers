require 'rails_helper'

RSpec.describe 'guitars index page' do
  it 'can list all guitars with their attributes' do
    guitar_1 = Guitar.create!(model: 'Stratocaster',
                             num_of_frets: 21,
                             six_string: true
                            )
    guitar_2 = Guitar.create!(model: 'Telecaster',
                             num_of_frets: 21,
                             six_string: true
                            )
    guitar_3 = Guitar.create!(model: 'Les Paul',
                             num_of_frets: 22,
                             six_string: true
                            )
    visit "/guitars"

    expect(page).to have_content(guitar_1.model)
    expect(page).to have_content(guitar_2.num_of_frets)
    expect(page).to have_content(guitar_3.six_string)
  end
end
