require 'helper'

describe SpatialTree do
  subject { SpatialTree.new :stage }
  let(:tree) { stub('tree') }

  before do
    AABBTree.stubs(:new).returns tree
  end

  describe "#items" do
    it "returns all the items" do
      tree.stubs(:items).returns(key: :value)
      subject.items.should == [:key]
    end
  end


end
