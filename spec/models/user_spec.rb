require 'spec_helper'


describe User do

  before do
    @user = FactoryGirl.build(:user)
  end
  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should be_valid }

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email address is already taken" do
    before do
      # we are inserting a duplicate BEFORE @user is saved
      duplicate = @user.dup
      duplicate.email = @user.email.upcase
      duplicate.save

    end
    # we are testing that @user is not valid because a duplicate has just been inserted
    it { should_not be_valid }
  end
end

# a user can search friends
# a user can add a friend
# a user can remove a friend
# a user can see his friends
# a user can see is a friend added him back
# a user cannot add himself as a friend

# a user can add an item
# a user can see manage his own items (see, update, delete)
# a user can see the items of his friends

# a user can request an item for lending
# a user can accept or refuse a loan