class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_time, :end_time, :workers_required, :event_id, :users
  belongs_to :event
  has_many :user_tasks
  has_many :users, :through => :user_tasks
end
 