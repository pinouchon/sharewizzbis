class Item < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :photo, :title, :user_id
  validates :title, presence: true
  validates :description, presence: true

  validates_inclusion_of :visibility, in: VISIBILITY_VALUES

  # visibility enum
  VISIBILITY_VALUES = [:owner_only, :friends, :everyone]

  def visibility
    VISIBILITY_VALUES[read_attribute(:status)]
  end

end
