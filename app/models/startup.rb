# Startup
class Startup < ActiveRecord::Base
  belongs_to :user
  delegate :first_name, :last_name, :user_name, :email, :to => :user, :prefix => :true
  #paginates_per 4
  has_many :comments, dependent: :destroy
  has_many :upvotes, dependent: :destroy

  acts_as_taggable
  acts_as_taggable_on :fields
end
