class AddTaskRoleToUserTask < ActiveRecord::Migration
  def change
    add_column :user_tasks, :task_role, :string, :default => "worker"
  end
end
