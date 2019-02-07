class House < ApplicationRecord
    validates :address, presense: true 
end 