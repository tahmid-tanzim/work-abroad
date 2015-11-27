require 'rails_helper'

RSpec.describe Member, type: :model do

  before(:example) do
    @member = Member.new(national_id: 1234567890, email: 'example@gmail.com', password: 'foobar', password_confirmation: 'foobar')
  end

  it ":national_id and :email should be valid" do
    expect(@member).to be_valid
  end

  it ":national_id and :email should NOT be empty" do
    @member.national_id = ''
    @member.email = ''
    expect(@member).not_to be_valid
  end

  it ":national_id length should be less then equal to 17" do
    @member.national_id = Faker::Number.number(18)
    expect(@member).not_to be_valid
  end

  it ":national_id should be positive integer" do
    @member.national_id = rand(0..6) * -1
    expect(@member).not_to be_valid
  end

  it ":national_id should NOT have String data type" do
    @member.national_id = 'FooBar'
    expect(@member).not_to be_valid
  end

  it ":email length should be less then equal to 255" do
    @member.email = "a" * 244 + "@example.com"
    expect(@member).not_to be_valid
  end

  it ":email should have valid format" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @member.email = valid_address
      expect(@member).to be_valid
    end
  end

  it ":email should NOt have invalid format" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @member.email = invalid_address
      expect(@member).not_to be_valid
    end
  end

  it ":email should be unique" do
    duplicate_member = @member.dup
    duplicate_member.email = @member.email.upcase
    @member.save
    expect(duplicate_member).not_to be_valid
  end

  it ":email should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @member.email = mixed_case_email
    @member.save
    expect(@member.reload.email).to eq(mixed_case_email.downcase)
  end

  it ":password should be present (nonblank)" do
    @member.password = @member.password_confirmation = " " * 6
    expect(@member).not_to be_valid
  end

  it ":password should have a minimum length" do
    @member.password = @member.password_confirmation = "a" * 5
    expect(@member).not_to be_valid
  end
end
