class Task < ActiveRecord::Base
  belongs_to :event
  has_many :user_tasks
  has_many :users, :through => :user_tasks
  alias_method :participants, :users
end
