class TitleValidator < ActiveModel::Validator

    def validate(record)
        unless record.title.match?("Won't Believe")
            record.errors[:title] << "not click baity enough, do better"
        end
    end

end