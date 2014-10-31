require 'spec_helper'
require 'active_record'

class User; end
class Book; end

describe ParentResource do
  subject { @instance }
  before do
    @klass = Class.new do
      include ParentResource
    end
  end
  describe 'class methods' do
    subject { @klass }
    it 'create_parent_resource should received' do
      expect(@klass).to receive(:create_parent_resource).with(:user)
      expect(@klass).to receive(:create_parent_resource).with(:book)

      @klass.parent_resources :user, :book
    end
  end
  describe 'instance methods' do
    let(:user) { User.new }
    before do
      @klass.parent_resources :user, :book
      @instance = @klass.new
      allow(@instance).to receive(:params).and_return(user_id: '1')
    end
    it 'create user instance' do
      expect(User).to receive(:find).with('1').and_return(user)
      expect(@instance.user).to eq user
    end
    it 'not create book instance' do
      expect(Book).not_to receive(:find)
      expect(@instance.book).to be_nil
    end
  end
end
