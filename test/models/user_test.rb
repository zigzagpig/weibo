require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user = User.new(name: "douyu",
                     email: "zigzagpig@douyu.com",
                     password: "douyu123",
                     password_confirmation: "douyu123")
  end

  test "验证用户有效性" do
  	assert @user.valid?
  end

  test "name 不能为空" do
  	@user.name = '      '
  	assert_not @user.valid?
  end

  test "email 不能为空" do
  	@user.email = '      '
  	assert_not @user.valid?
  end

  test "name 不能太长" do
  	@user.name = '我' * 51
  	assert_not @user.valid?
  end

  test "email 不能太长" do
  	@user.email = 'i' * 244 + "@example.com"
  	assert_not @user.valid?
  end

  test "email 符合电子邮件的格式" do
    valid_addresses = %w[ user@example.com
    											USER@foo.COM A_US-ER@foo.bar.org
                         	first.last@foo.jp
                         	alice+bob@baz.cn ]
		valid_addresses.each do |valid_address|
			@user.email = valid_address
			assert @user.valid?, "#{valid_address.inspect} 这个Email地址是对的，但却没通过验证"
		end
	end

	test "email 不符合电子邮件的格式" do
    invalid_addresses = %w[	user@example,com
    												user_at_foo.org
    												user.name@example.
                            foo@bar_baz.com
                            foo@bar+baz.com
                            douyu123@happyending....com
                            foo@bar..com ]
		invalid_addresses.each do |invalid_address|
			@user.email = invalid_address
			assert_not @user.valid?, "#{invalid_address.inspect} 这个Email地址是错的，但却通过了验证"
		end
	end

	test "email 不能重复" do
  	duplicate_user = @user.dup
  	duplicate_user.email = @user.email.upcase
  	@user.save
  	assert_not duplicate_user.valid?
	end

  test "密码最小长度不低于6字符" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "电子邮件小写转换" do
    mixed_case_email = "DouYu@Yahoo.com"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

end
