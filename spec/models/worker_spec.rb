require 'rails_helper'

RSpec.describe Worker, type: :model do

  it "has none to begin with" do
    expect(Worker.count).to eq 0
  end

  it "has one after adding one" do
    Worker.create(:national_id => '123456789', :email => 'example@gmail.com')
    expect(Worker.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Worker.count).to eq 0
  end
end
