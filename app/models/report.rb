class Report < ApplicationRecord
    belong_to review, foreign_key: true
end
