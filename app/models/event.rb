class Event < ActiveRecord::Base
  has_many :tasks
  belongs_to :user
  validates :title, :presence => :true
  validates :description, :presence => :true
  validates :date, :presence => :true
  validates :start_time, :presence => :true
  validates :end_time, :presence => :true
end
