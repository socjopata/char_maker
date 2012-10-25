# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Wizard do
  before do
    @character =  FactoryGirl.create(:character)
    @character.create_character_background
  end

  context "profession_and_origin" do

    context "get" do

      it "should build statistics for character if they are blank" do

      end

    end

  end

end
