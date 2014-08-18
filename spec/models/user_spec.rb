require 'spec_helper'

describe User do

  it "is valid with nickname, uid and image" do
    expect(build(:user)).to be_valid
  end

  it "is invalid without a nickname" do
    expect(build(:user, nickname: nil)).to have(1).errors_on(:nickname)
  end

  it "is invalid without a uid" do
    expect(build(:user, uid: nil)).to have(2).errors_on(:uid)
  end

  it "is invalid with a uid of wrong length" do
    expect(build(:user, uid: '123456789')).to have(1).errors_on(:uid)
  end

  it "is invalid without a image" do
    expect(build(:user, image: nil)).to have(1).errors_on(:image)
  end

  it "is invalid with a duplicate uid" do
    create(:user, uid: '12345678901234567')
    user = build(:user, uid:'12345678901234567')
    expect(user).to have(1).errors_on(:uid)
  end

end
