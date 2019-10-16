class Post < ActiveRecord::Base
    validates :title, length: {minimum: 1}
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

    include ActiveModel::Validations
    validates_with TitleValidator
end
