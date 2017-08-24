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

class Message < ApplicationRecord
  belongs_to :sender, foreign_key: :from_id, class_name: "User"
  belongs_to :receiver, foreign_key: :to_id, class_name: "User"
end
