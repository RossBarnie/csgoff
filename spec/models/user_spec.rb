require 'spec_helper'

describe User do

  it "is valid with nickname, uid and image" do
    user = User.new(
      nickname: 'Jabba',
      uid: '12345',
      image: 'http://273cec6fc41a081db16d-ce34005648ffa0485d8d53d98630bca9.r21.cf2.rackcdn.com/ck/samreal/2013/11/06/Elon-Musk-20837159-1-402.jpg.png#.png'
    )
    expect(user).to be_valid
  end

  it "is invalid with nickname" do
    expect(User.new(nickname: nil)).to have(1).errors_on(:nickname)
  end
  
  it "is invalid with uid"
  it "is invalid with image"
  it "is invalid with a duplicate uid"
end
