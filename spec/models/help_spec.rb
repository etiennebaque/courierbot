require 'rails_helper'

describe Help do
  let (:help) { Help.new }

  describe '#trigger_sms_text' do
    it 'returns the correct text message to require help' do
      expect(help.trigger_sms_text).to eq 'help me'
    end
  end

  describe '#to_be_broadcasted?' do
    it 'checks that help message are not broadcasted' do
      expect(help.to_be_broadcasted?).to be_falsey
    end
  end
end

