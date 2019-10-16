class Post < ActiveRecord::Base
  CATEGORIES = Post.all.map(&:category)
  CATEGORIES << "Fiction"
  CLICKBAIT = ["Won't Believe", "Secret", "Top ", "Guess"]
  validates :title, presence: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 100 }
  validates :category, inclusion: { in: CATEGORIES }
  validate :is_clickbait

  def is_clickbait
    cond = CLICKBAIT.any? do |phrase|
      title.include?(phrase) unless title.nil?
    end

    unless cond
      errors.add(:title, "Not clickbait!")
    end
  end
  
end
