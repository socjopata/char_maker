# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :characters, dependent: :destroy

  after_validation :un_guest, on: :update

  def self.create_guest
    user = User.create(guest: true, email: "#{Digest::SHA1.hexdigest Time.now.to_s}@guest.lol", password: 'password', password_confirmation: 'password')
    user
  end

  def un_guest
    self.guest = false
  end
end
