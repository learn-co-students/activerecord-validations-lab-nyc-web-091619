class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Non-Fiction Fiction),
    message: "%{value} is not a valid category" }
    validate :is_clickbait? 

    BUZZWORDS = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
        ] 

    def is_clickbait?
        if BUZZWORDS.none? { |pat| pat.match title }
          errors.add(:title, "must be clickbait")
        end
      end

    # def is_clickbait?
    #     unless self.title.match?(
    #         [
    #         /Won't Believe/i,
    #         /Secret/i,
    #         /Top [0-9]*/i,
    #         /Guess/i
    #         ]) 
    #         errors.add(:title, "must be clickbait")
    #     end
    # end

end
