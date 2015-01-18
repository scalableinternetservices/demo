class Comment < ActiveRecord::Base
  belongs_to :submission
  belongs_to :parent
end
