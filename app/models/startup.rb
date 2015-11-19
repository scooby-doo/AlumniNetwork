# Startup
class Startup < ActiveRecord::Base
  belongs_to :user
  delegate :first_name, :last_name, :user_name, :email, :to => :user, :prefix => :true
  #paginates_per 4
  has_many :startup_fields
  has_many :fields, through: :startup_fields
  has_many :comments
  has_many :upvotes

  acts_as_taggable
  acts_as_taggable_on :fields
end
