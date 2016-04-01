class Caster < ActiveRecord::Base
  belongs_to :subscription

  validates :president, presence: true
	validates :vice_president, presence: true

end
