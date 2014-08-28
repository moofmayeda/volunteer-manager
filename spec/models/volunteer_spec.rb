require 'rails_helper'

describe Volunteer do
  it { should have_and_belong_to_many :actions }
  it { should validate_presence_of :name }
end
