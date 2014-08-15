require 'spec_helper'

describe User do
  describe '#un_guest' do
    let(:user) { User.new(guest: true) }

    it { expect { user.un_guest }.to change { user.guest }.to false }
  end

  describe '.create_guest' do
    it 'should create an user' do
      expect(User.create_guest).to eq User.last
    end

    context 'testing user type' do
      before do
        User.create_guest
      end

      it { expect(User.last.guest).to eq true }
    end
  end
end