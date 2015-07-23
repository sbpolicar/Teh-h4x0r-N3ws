require 'uri'

class Post < ActiveRecord::Base

  validates :link,
  presence: true,
  format: {:with => URI::regexp(%w(http https))}

  validates :title,
  presence: true

  belongs_to :user

  has_many :ratings, class_name: 'Vote'
  has_many :votes, as: :voatable


  def owned_by? user
    user && user.id == self.user.id
  end

end
