class Spree::County < ActiveRecord::Base
  delegate :country, to: :state
  has_many :addresses, dependent: :nullify
  validates :name, presence: true
  belongs_to :state

  Spree::Ability.register_ability(CountyAbility)

  def <=>(other)
    name <=> other.name
  end

  def to_s
    name
  end
end
