class Aspirant < ActiveRecord::Base
  belongs_to :subscription
  
before_validation { self.first_name = first_name.camelcase }
before_validation { self.last_name = last_name.camelcase }

	mount_uploader :image, ImageUploader


  	validates :first_name, presence: true
	validates :first_name, length: {minimum:3} ,if: "first_name.present?"
	validates :first_name, length: {maximum:20} ,if: "first_name.present?"

	validates :last_name, presence: true
	validates :last_name, length: {minimum:3} ,if: "last_name.present?"
	validates :last_name, length: {maximum:20} ,if: "last_name.present?"

	validates :position, presence: true
	validates :position, length: {minimum:3} ,if: "position.present?"
	validates :position, length: {maximum:100} ,if: "position.present?"

	validates :statement, presence: true
	validates :statement, length: {minimum:10} ,if: "statement.present?"

	validates :gender, presence: true
	validates :level, presence: true
	validates :image, presence: true



validates_processing_of :image
validate :image_size_validation

private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end

end
