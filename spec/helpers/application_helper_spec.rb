require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#full_title" do
    it "returns the default title" do
      expect(helper.full_title).to eq("Work Abroad")
    end
    it "returns the assigned page title" do
      expect(helper.full_title("My Title")).to eq("My Title | Work Abroad")
    end
  end
end
