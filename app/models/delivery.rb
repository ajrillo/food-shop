class Delivery < ApplicationRecord
    validates :adress, presence: true
    validates :street, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :ZipCode, presence: true
end
