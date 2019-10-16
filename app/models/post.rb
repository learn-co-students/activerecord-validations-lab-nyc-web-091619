class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250, too_short: "Minimum character count is 250, you currently have %{count}" }
    validates :summary, length: { maximum: 250, too_long: "Maximum character count is 250, you currently have %{count}" }
    validates :category, inclusion: { in: %w{Fiction Non-Fiction}}
    validate :title, :is_click_bait?

    CB_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
    ]

    def is_click_bait?
        if CB_PATTERNS.none? { |pat| pat.match title }
          errors.add(:title, "must be clickbait")
        end
    end

end
