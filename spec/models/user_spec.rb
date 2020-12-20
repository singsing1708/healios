# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#FactoryBot" do
    it 'can have factory' do
      user = FactoryBot.create(:user)
      expect(user).to be_a User
      expect(user.id).to be_truthy
    end
  end

  describe "#sign_in" do
    it 'can sign in' do
      user = FactoryBot.create(:user, password: "password1", password_confirmation: "password1")
      expect(user.valid_password?('password1')).to be_truthy
    end
  end

  describe "#sign_up" do
    it 'email need to be unique' do
      FactoryBot.create(:user, email: "example@example.com")
      user = User.new(
        email: 'example@example.com',
        password: '1234Qwer!',
        password_confirmation: '1234Qwer!'
      )
      expect(user.save).to be_falsey
    end
  end


end
