class Post < ActiveRecord::Base
  validates :title, presence: true, length: {is: 20}
end
