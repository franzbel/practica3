class Article < ActiveRecord::Base
  validates :title, :presence => true
  validates :body, :presence => true
 
  belongs_to :user
  has_many :comments
  has_one :history_post
  def long_title
	"#{title} - #{published_at}"
  end
end