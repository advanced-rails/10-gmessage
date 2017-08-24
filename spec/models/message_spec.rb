# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  from_id    :integer          not null
#  to_id      :integer          not null
#  subject    :string           not null
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '.create' do
    it 'creates a Message object' do
      u1 = User.first
      u2 = User.second
      m1 = Message.create(from_id: u1.id, to_id: u2.id, subject: 'S1', body: 'B1')
      expect(m1.id).to_not be_nil
    end
  end

  describe '#sender' do
    it 'gets the sender of a message' do
      m1 = Message.first
      expect(m1.sender.email).to eql('bob@aol.com')
    end
  end

  describe '#receiver' do
    it 'gets the receiver of a message' do
      m1 = Message.first
      expect(m1.receiver.email).to eql('sam@aol.com')
    end
  end
end
