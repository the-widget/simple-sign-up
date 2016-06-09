class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_time, :end_time, :workers_required, :event_id
  belongs_to :event
  


end
 