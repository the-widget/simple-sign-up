class Task < ActiveRecord::Base
  belongs_to :event
  has_many :user_tasks
  has_many :users, :through => :user_tasks
  alias_method :participants, :users
  validates :title, :presence => :true
  validates :description, :presence => :true
  validates :start_time, :presence => :true
  validates :end_time, :presence => :true
  validates :workers_required, :presence => :true
  
  def self.total_tasks
    self.all.count
  end

  def positions_available
    self.workers_required - self.users.all.count
  end

  def event_task_styling
    self.users.all.count == self.workers_required ? "class=text-success" : "class=text-danger"
  end

end
