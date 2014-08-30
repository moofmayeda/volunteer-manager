require 'rails_helper'

describe Event do
  it { should have_and_belong_to_many :volunteers }
  it { should validate_presence_of :name }

  describe "vol_num" do
    it "returns the number of volunteers signed up" do
      vol1 = Volunteer.create(name: "vol1")
      vol2 = Volunteer.create(name: "vol2")
      vol3 = Volunteer.create(name: "vol3")
      event = Event.create(name: "test event")
      event.volunteers << vol1
      event.volunteers << vol2
      event.volunteers << vol3
      expect(event.vol_num).to eq 3
    end
  end

  describe ".future" do
    it "returns only events in the future" do
      future_event = Event.create(name: "future event", date: "2014-12-12")
      past_event = Event.create(name: "past event", date: "2014-07-12")
      expect(Event.future).to eq [future_event]
    end
  end

  describe ".past" do
    it "returns only events in the past" do
      future_event = Event.create(name: "future event", date: "2014-12-12")
      past_event = Event.create(name: "past event", date: "2014-07-12")
      expect(Event.past).to eq [past_event]
    end
  end
end
