class Answer < ActiveRecord::Base
  attr_accessible :question_id, :user_id, :correct
end
