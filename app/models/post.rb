class Post < ApplicationRecord
    validates :title, presence: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { within: ["Fiction", "Non-Fiction"] }

    validate :title_is_clickbait

    def title_is_clickbait
        if title == "True Facts"
            errors.add(:title, "Title should include 'Won't Believe', 'Secret', 'Top' or 'Guess!")
        end
    end
end
