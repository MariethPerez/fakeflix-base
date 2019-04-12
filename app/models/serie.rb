class Serie < ApplicationRecord
     has_many :rentals , as: :rentable
     has_many :episodes
     def rented
          self.rentals.any?
     end
end

# == Schema Information
#
# Table name: series
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  price       :integer
#  rating      :integer
#  status      :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
