require 'rails_helper'

RSpec.describe Guitar do
  it {should belong_to :manufacturer}
end