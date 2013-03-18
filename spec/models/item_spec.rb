require 'spec_helper'

# basic tests
describe Item do

  before do
    @item = FactoryGirl.create('item')
  end
  subject { @item }

  it { should respond_to(:title) }
  it { should respond_to(:description) }

  describe "when title is not present" do
    before { @item.title = " " }
    it { should_not be_valid }
  end
end


#