class UserTask < ActiveRecord::Base
  # add extra attributes
  belongs_to :user 
  belongs_to :task



end
