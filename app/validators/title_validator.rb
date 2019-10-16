class TitleValidator < ActiveModel::Validator

  def validate(record)
    # unless title =~ /\A(["Won't Believe", "Secret", "Top "])
    if !record.title.match?(/Won't Believe/) && !record.title.match?(/Secret/) && !record.title.match?(/Top /) && !record.title.match?(/Guess/)
      record.errors[:title] << "Must be clickbait-y"
    end
  end

end
