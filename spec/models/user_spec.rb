# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  color                  :string           default("#800080")
#  photo                  :string           default("http://via.placeholder.com/150x150")
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.new' do
    it 'instantiates a User object' do
      u = User.new
      expect(u.is_a?(User)).to be true
      expect(u.attributes.keys.count).to eql(15)
      expect(u.color).to eql('#ffffff')
      expect(u.photo).to eql('http://via.placeholder.com/150x150')
    end
  end
end
