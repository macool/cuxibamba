require 'spec_helper'

describe List do
  let(:list) { build :list }

  describe "must have a name" do
    it "is valid with name" do
      list.name = "name"
      expect(
        list.valid?
      ).to be_true
    end

    it "is not valid without name" do
      list.name = nil
      expect(
        list.valid?
      ).to be_false
    end
  end

  describe "name must be unique" do
    let(:name) { "taken name" }
    let!(:existing_list) {
      create :list, name: name
    }

    it "must be valid" do
      list.name = "other name"
      expect(list).to be_valid
    end

    it "must not be valid" do
      list.name = name
      expect(list).to_not be_valid
    end
  end
end
