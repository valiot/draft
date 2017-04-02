class Question < ApplicationRecord
  enum q_type: [:stars, :open]
end
