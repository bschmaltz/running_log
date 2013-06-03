class Workout < ActiveRecord::Base
  attr_accessible :workout_date, :distance, :effort, :emotion, :name, :review, :weather, :duration
  belongs_to :user

  validates :distance, presence: true 
  validates :duration, presence: true 

  def self.total_miles_on(date, id)
    where("date(workout_date) = ?",date).where("user_id="+id.to_s).sum(:distance)
  end

  def self.total_duration_on(date, id)
    where("date(workout_date) = ?",date).where("user_id="+id.to_s).sum(:duration)
  end
end
