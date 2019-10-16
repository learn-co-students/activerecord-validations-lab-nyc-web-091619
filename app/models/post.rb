class Post < ActiveRecord::Base
  # include ActiveModel::Validations
  # validates_with TitleValidator

  validates :title, presence: true
  validates :content, length: { :minimum => 250 }
  validates :summary, length: { :maximum => 250 }
  validates :category, acceptance: {accept: ["Fiction", "Non-Fiction"]}

  validate :title_must_be_clickbait

  def title_must_be_clickbait
    if title.present?
      if !title.match?(/Won't Believe/) && !title.match?(/Secret/) && !title.match?(/Top /) && !title.match?(/Guess/)
        self.errors.add(:title, "Must be clickbait-y")
      end
    end
  end

end
