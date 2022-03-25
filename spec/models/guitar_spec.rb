require 'rails_helper'

RSpec.describe Guitar do
  it {should belong_to :manufacturer}
  it {should validate_presence_of :model}
end
