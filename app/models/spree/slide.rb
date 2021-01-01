class Spree::Slide < ActiveRecord::Base
  acts_as_list

  LOCATION_LIST = %w[slider products instagram]

  belongs_to :store
  has_one_attached :image

  scope :published, -> { where(published: true) }
end
