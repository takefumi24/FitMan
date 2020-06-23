class Food < ApplicationRecord
  validates :name,             presence: true
  validates :quantity,         presence: true
  validates :one_of_nutrition, presence: true, format: {with: /\A[0-9]+\z/ }, inclusion: 0..999

  def self.search(input)
    if input == ""
      Food.all
    else
      Food.where(['name LIKE ?', "%#{input}%"] )
    end
  end

  private
    def one_of_nutrition
      calorie.presence or carbo.presence or fat.presence or protein.presence
    end
end
