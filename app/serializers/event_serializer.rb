class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date, :start_time, :end_time
  belongs_to :user
  has_many :tasks
end
