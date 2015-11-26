require 'rails_helper'

RSpec.describe Worker, type: :model do

  before(:example) do
    @worker = Worker.new(national_id: 1234567890, email: 'example@gmail.com', password: 'foobar', password_confirmation: 'foobar')
  end

  it ":national_id and :email should be valid" do
    expect(@worker).to be_valid
  end

  it ":national_id and :email should NOT be empty" do
    @worker.national_id = ''
    @worker.email = ''
    expect(@worker).not_to be_valid
  end

  it ":national_id length should be less then equal to 17" do
    @worker.national_id = rand(10 ** 18)
    expect(@worker).not_to be_valid
  end

  it ":national_id should be positive integer" do
    @worker.national_id = rand(0..6) * -1
    expect(@worker).not_to be_valid
  end

  it ":national_id should NOT have String data type" do
    @worker.national_id = 'FooBar'
    expect(@worker).not_to be_valid
  end

  it ":email length should be less then equal to 255" do
    @worker.email = "a" * 244 + "@example.com"
    expect(@worker).not_to be_valid
  end

  it ":email should have valid format" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @worker.email = valid_address
      expect(@worker).to be_valid
    end
  end

  it ":email should NOt have invalid format" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @worker.email = invalid_address
      expect(@worker).not_to be_valid
    end
  end

  it ":email should be unique" do
    duplicate_worker = @worker.dup
    duplicate_worker.email = @worker.email.upcase
    @worker.save
    expect(duplicate_worker).not_to be_valid
  end

  it ":email should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @worker.email = mixed_case_email
    @worker.save
    expect(@worker.reload.email).to eq(mixed_case_email.downcase)
  end

  it ":password should be present (nonblank)" do
    @worker.password = @worker.password_confirmation = " " * 6
    expect(@worker).not_to be_valid
  end

  it ":password should have a minimum length" do
    @worker.password = @worker.password_confirmation = "a" * 5
    expect(@worker).not_to be_valid
  end
end
