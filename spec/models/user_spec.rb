require 'spec_helper'
describe User do
  before do
    @user = User.new(name: "Example User", email: "user@example.com", password_confirmation: "password",password:"password")
  end
  subject {@user}
  describe "when email format is invalid" do
    invalid_addresses =  %w[user@foo,com user_at_foo.org example.user@foo.]
    invalid_addresses.each do |invalid_address|
      before { @user.email = invalid_address }
      it { should_not be_valid }
    end
  end

  describe "when email format is valid" do
    valid_addresses = %w[user@foo.com A_USER@f.b.org frst.lst@foo.jp a+b@baz.cn]
    valid_addresses.each do |valid_address|
      before { @user.email = valid_address }
      it { should be_valid }
    end
  end
  describe "when password is too long" do
    before { @user.password = "a" * 551,@user.password = "a" * 551 }
    it { should_not be_valid }
  end
  describe "when password is too shot" do
    before { @user.password = "a" * 5,@user.password = "a" * 5 }
    it { should_not be_valid }
  end

end

