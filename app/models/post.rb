class Post < ApplicationRecord
    # Validate that the content column is not empty
    validates :content, {presence: true, length: {maximum: 140}}
end
