class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :clickbaity
 
  def clickbaity
    regeeexes = /Won't Believe|Secret|Top 10|Guess/
    if !regeeexes.match? title
      errors.add(:title, "can't be so not clickbait🤷‍")
    end
  end

end
