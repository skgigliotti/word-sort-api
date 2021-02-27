# == Schema Information
#
# Table name: words
#
#  id              :bigint           not null, primary key
#  spelling        :string
#  language        :string
#  english         :string
#  times_seen      :integer
#  times_practiced :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Word < ApplicationRecord
end
