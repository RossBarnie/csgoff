require 'spec_helper'

describe User do

  it "is valid with nickname, uid and image" do
    user = User.new(
      nickname: 'Jabba',
      uid: '12345678901234567',
      image: 'http://273cec6fc41a081db16d-ce34005648ffa0485d8d53d98630bca9.r21.cf2.rackcdn.com/ck/samreal/2013/11/06/Elon-Musk-20837159-1-402.jpg.png#.png'
    )
    expect(user).to be_valid
  end

  it "is invalid without a nickname" do
    expect(User.new(nickname: nil)).to have(1).errors_on(:nickname)
  end

  it "is invalid without a uid" do
    expect(User.new(uid: nil)).to have(2).errors_on(:uid)
  end

  it "is invalid with a uid of wrong length" do
    expect(User.new(uid: "123456789")).to have(1).errors_on(:uid)
  end

  it "is invalid without a image" do
    expect(User.new(image: nil)).to have(1).errors_on(:image)
  end

  it "is invalid with a duplicate uid" do
    User.create(nickname: 'Joe', image:'blank', uid: '12345678901234567')
    user = User.new(nickname:'Jack', image: 'blank', uid:'12345678901234567')
    expect(user).to have(1).errors_on(:uid)
  end

end
