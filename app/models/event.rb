class Event < ActiveRecord::Base
  has_many :tasks
  belongs_to :user
  validates :title, :presence => :true
  validates :description, :presence => :true
  validates :date, :presence => :true
  validates :start_time, :presence => :true
  validates :end_time, :presence => :true

  def task_ids
    self.tasks.map do |task|
      task.id 
    end
  end

  def positions_remaining(task_ids)
    task_ids.map { |id|
    task = Task.find(id);
    task.workers_required - task.users.all.count}.sum
  end

  def participants
    collect = []
    if self.tasks
      self.tasks.each do |task|
        task.users.each do |user|
          collect << user
        end
      end
    end
    collect.uniq
  end

    
end
