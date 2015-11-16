# User model
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :startups
  has_many :comments
  has_many :phones
  has_many :work_experiences
  has_many :best_experiences
  has_many :clients
  has_many :helps

  accepts_nested_attributes_for :work_experiences, allow_destroy: true
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :best_experiences, allow_destroy: true
  accepts_nested_attributes_for :clients, allow_destroy: true
  accepts_nested_attributes_for :helps, allow_destroy: true
  acts_as_taggable
  acts_as_taggable_on :fields

  has_many :upvotes
  has_many :startups, through: :upvotes, as: :upvoted_startups

  validates :first_name, presence: true

  # Finds all startups for a user
  def posted_startups
    startups
  end

  # Determines if a user already voted for a startup
  def already_upvoted?(startup)
    User.joins(:upvotes).where(:upvotes => { :startup_id => startup.id}).size > 0
  end
end
