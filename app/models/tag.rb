# frozen_string_literal: true

# tag model
class Tag < ApplicationRecord
  belongs_to :announcement
end
