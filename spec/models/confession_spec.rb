require "spec_helper"

describe Confession do
  let!(:confession) { Confession.create(title: 'Ash', path_name: "First") }
  subject { confession }

  its(:text) { should be_nil }  
  its(:title) { should == 'Ash' }
  its(:love_users) {should == []}

  it "is invalid without title" do
    conf = Confession.new
    conf.should_not be_valid
  end 

  it "change the number of confession" do
    conf = Confession.new(title: 'Ash1', path_name: "First1")
    expect { conf.save }.to change { Confession.count }.by(1)
  end

  it "is invalid with the same path_name " do
    conf = Confession.new(title: 'Ash12', path_name: "First")
    expect { conf.save }.not_to change { Confession.count }
  end

  it 'can find by path_name' do
    conf = Confession.find_by_pathname("First")
    conf.should_not be_nil
  end

  it 'adds to its love list' do
    @user = FactoryGirl.create(:user)
    expect { confession.toggle_love(@user.id) }.to change { confession.love_users.count }.from(0).to(1)
  end
  it 'remove user to its love list' do
    @user = FactoryGirl.create(:user)
    confession.toggle_love(@user.id) 
    expect { confession.toggle_love(@user.id) }.to change { confession.love_users.count }.from(1).to(0)
  end


end