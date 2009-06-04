require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/fixtures/classes'
require File.dirname(__FILE__) + '/shared/iteration'
require File.dirname(__FILE__) + '/shared/each'

describe "Hash#each_pair" do
  ruby_version_is ""..."1.9" do
    it "processes all pairs, yielding two arguments: key and value" do
      all_args = []

      h = new_hash(1 => 2, 3 => 4)
      h2 = h.each_pair { |*args| all_args << args }
      h2.should equal(h)

      all_args.sort.should == [[1, 2], [3, 4]]
    end
  end
  
  ruby_version_is "1.9" do
    it_behaves_like(:hash_each, :each_pair)
  end
  it_behaves_like(:hash_iteration_no_block, :each_pair)
end
