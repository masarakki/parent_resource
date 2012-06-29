require 'spec_helper'
require 'active_record'

class User ; end
class Book ; end

describe ParentResource do
  subject { @instance }
  before do
    @klass = Class.new do
      include ParentResource
    end
  end
  describe :class_methods do
    subject { @klass }
    it "create_parent_resource should received" do
      @klass.should_receive(:create_parent_resource).with(:user)
      @klass.should_receive(:create_parent_resource).with(:book)

      @klass.parent_resources :user, :book
    end
  end
  describe :instance_methods do
    let(:user) { User.new }
    before do
      @klass.parent_resources :user, :book
      @instance = @klass.new
      @instance.stub(:params).and_return(:user_id => "1")
    end
    it "create user instance" do
      User.should_receive(:find).with("1").and_return(user)
      @instance.user.should == user
    end
    it "not create book instance" do
      Book.should_not_receive(:find)
      @instance.book.should be_nil
    end
  end
end
