require 'rails_helper'

describe Event do
  it { should have_and_belong_to_many :volunteers }
  it { should validate_presence_of :name }
end
