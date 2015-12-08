class Movie < ActiveRecord::Base
has_many :reviews
has_many :reviewers, through: :reviews, source: :user

ratyrate_rateable "overall"

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

  def critic_reviews
    # Rate.all.where(rateable_id: self.id, :rater_id => User.all.where(critic: true))
    self.reviews.where(movie_id: self.id, :user_id => User.all.where(critic: true))
  end

  def user_reviews
    self.reviews.where(movie_id: self.id, :user_id => User.all.where(critic: false))
  end

  def average_rating(array)
    if array.length == 0
      return nil
    else
    x = array
      .map(&:movie_rating)
      .map(&:to_f)
      .reduce(:+)

    average = x / array.length
    average.round(2)
    end
  end
end
