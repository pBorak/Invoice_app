class Invoice < ApplicationRecord
  belongs_to :user
  validates_presence_of :user, :amount, :company,
                        :contragent, :currency, :date
  validates :amount, numericality: { greater_than: 0 }
  validate :future_date

  private

  def future_date
    errors.add(:date, "can't be in the past") if date.present? && date < Date.today
  end
end
