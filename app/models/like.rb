class Like < ActiveRecord::Base
  belongs_to :idea, required: true
  belongs_to :user, required: true
end
