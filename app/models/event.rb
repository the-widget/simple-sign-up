class Event < ActiveRecord::Base
  has_many :tasks
  belongs_to :user
  alias_method :organizer, :user
  accepts_nested_attributes_for :tasks
  validates :title, :presence => :true
  validates :description, :presence => :true
  validates :date, :presence => :true
  validates :start_time, :presence => :true
  validates :end_time, :presence => :true

  def task_attributes=(task)
    self.tasks = Task.find_or_create_by(title: task.title)
    self.tasks.update(task)
  end

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
