class Question < ActiveRecord::Base
  attr_accessible :question, :options, :answer, :image_url
end
