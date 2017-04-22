require 'spec_helper'

RSpec.describe Node do
  let!(:tst) { Node.new("hello") }

  describe "data" do
    it "returns the value of the Node's data" do
      expect(tst.data).to eq("hello")
    end
  end

  describe "next" do
    it "returns the next node object, nill if tail" do
      expect(tst.next).to eq(nil)
    end
  end
end
