class Job < ApplicationRecord
  validates :employment_type_id, presence: true
  validates :job_description, length: { maximum: 200 }
end
