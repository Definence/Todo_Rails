class Task < ActiveRecord::Base

  belongs_to :user
  
  validates :title, presence: true, length: { minimum: 5, too_short: "Five characters is the minimum allowed" }
  validates :priority, presence: true, numericality: { only_integer: true }
  
  def complete!
    self.completed = true
    save
  end

  def uncomplete!
    self.completed = false
    save
  end

end
 
