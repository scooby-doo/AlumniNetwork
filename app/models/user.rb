# User model
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :startups, dependent: :destroy
  has_many :comments
  has_many :phones, dependent: :destroy
  has_many :work_experiences, dependent: :destroy
  has_many :best_experiences, dependent: :destroy
  has_many :clients
  has_many :helps, dependent: :destroy

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

  def self.from_omniauth(auth)  
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.name.split(" ")[0]
      user.last_name = auth.info.name.split(" ")[-1]
      user.avatar = process_uri(auth.info.image)
    end
  end

  def self.process_uri(uri)
    avatar_url = URI.parse(uri)
    avatar_url.scheme = 'https'
    avatar_url.to_s
  end
end
