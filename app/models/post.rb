class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :clickbait
end

def clickbait

    needed = /Won't Believe|Secret|Top 10|Guess/
    !needed.match?(title) ? errors.add(:title, "Need Clickbait") : nil

end
