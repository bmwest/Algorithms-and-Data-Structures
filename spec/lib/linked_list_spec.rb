require 'spec_helper'

RSpec.describe LinkedList do
  let!(:list) { LinkedList.new() }
  let!(:node) { Node.new("zero") }
  let!(:node2) { Node.new("one") }
  let!(:node3) { Node.new("two") }
  let!(:node4) { Node.new("three") }
  let!(:node5) { Node.new("four") }

  describe "size" do
    it "should return '0' when the list is empty" do
      expect(list.size).to eq(0)
    end
  end

  describe "insert_one_at_zero" do
    it "should allow to insert a node into the LinkedList" do
      expect(list.insert(0, node))
    end
  end

  describe "get_inserted_at_zero" do
    it "should allow to get a node inserted at zero" do
      list.insert(0, node)
      expect(list.get(0).data).to eq("zero")
      expect(list.size).to eq(1)
    end

    it "should set the value of the list's head" do
      list.insert(0, node)
      expect(list.get(0).data).to eq("zero")
    end
  end

  describe "insert a node at 0 and 1" do
    it "should insert a node at a given index" do
      list.insert(0, node)
      list.insert(1, node2)
      expect(list.get(0).data).to eq("zero")
      expect(list.get(1).data).to eq("one")
      expect(list.size).to eq(2)
    end
  end

  describe "insert a node at 0 and 0" do
    it "should insert a node at a given index" do
      list.insert(0, node)
      list.insert(0, node2)
      expect(list.get(0).data).to eq("one")
      expect(list.get(1).data).to eq("zero")
      expect(list.size).to eq(2)
    end
  end

  describe "insert a node at indices 1-5" do
    it "should insert a node at a given index" do
      list.insert(0, node)
      list.insert(1, node2)
      list.insert(2, node3)
      list.insert(3, node4)
      list.insert(4, node5)
      expect(list.get(0).data).to eq("zero")
      expect(list.get(1).data).to eq("one")
      expect(list.get(2).data).to eq("two")
      expect(list.get(3).data).to eq("three")
      expect(list.get(4).data).to eq("four")
      expect(list.size).to eq(5)
    end

    it "should reassign a given index and adjust the previous node's link" do
      list.insert(0, node)
      list.insert(1, node2)
      list.insert(2, node3)
      list.insert(3, node4)
      list.insert(2, node5)
      expect(list.get(0).data).to eq("zero")
      expect(list.get(1).data).to eq("one")
      expect(list.get(2).data).to eq("four")
      expect(list.get(3).data).to eq("two")
      expect(list.get(4).data).to eq("three")
      expect(list.size).to eq(5)
    end
  end

end