module ActiveRecord
  class Base
    def self.random
      if (c = count) != 0
        find(:first, :offset =>rand(c))
      end
    end
  end
end

class Question < ActiveRecord::Base
  attr_accessible :question, :options, :answer, :image_url

  serialize :options
end
