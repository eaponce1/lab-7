class Treatment < ApplicationRecord
  belongs_to :appointment

  # ACTION TEXT
  has_rich_text :clinical_notes

  # VALIDATIONS
  validates :name, :administered_at, :appointment, presence: true
end