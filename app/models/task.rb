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

  def self.all_positions_filled
    self.all.collect do |task|
      if task.workers_required == task.users.all.count
        task.id
      end
    end.compact
  end

end
