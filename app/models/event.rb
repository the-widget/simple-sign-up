class Event < ActiveRecord::Base
  has_many :tasks
  belongs_to :user
  validates :title, :presence => :true
  validates :description, :presence => :true
  validates :date, :presence => :true
  validates :start_time, :presence => :true
  validates :end_time, :presence => :true

  def self.task_ids
    collect = []
    self.all.each do |event|
      event.tasks.each do |task|
        collect << task.id 
      end
    end
    collect
  end

end
