# -*- encoding : utf-8 -*-
class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :content

  validates_presence_of :name, message: "Pole <<Twoje imię>> nie może być puste."
  validates_format_of :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i, message: "Podaj poprawny email."
  validates_length_of :content, maximum: 1500, message: "Max 1500 znaków."

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end
