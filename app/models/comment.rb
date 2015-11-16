# Comment
class Comment < ActiveRecord::Base
  belongs_to :startup
  belongs_to :user
  validates :text, presence: true, allow_blank: false
end
