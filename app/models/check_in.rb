class CheckIn < ApplicationRecord
  # association
  belongs_to :habit

  # validation
  with_options presence: true do
    validates :date
    validates :status
  end
end
