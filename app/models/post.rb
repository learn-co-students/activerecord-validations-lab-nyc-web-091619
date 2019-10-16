class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}


    validate :title_is_clickbaity
 
  def title_is_clickbaity
    baits = ["Won't Believe", "Secret", "Guess"]
    if self.title && !(baits.find {|bait| self.title.include?(bait)} || self.title.match?(/Top \d+/))
      self.errors[:title] << "Title must be clickbait-y!"
    end
  end

end
