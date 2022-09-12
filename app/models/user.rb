class User < ApplicationRecord
  validates_presence_of :firstname, :lastname
  validates :phone, presence: true, numericality: true, length: { minimum: 10, maximum: 15 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  ATTRIBUTES = User.column_names - %w[ updated_at]

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << ATTRIBUTES
      all.each do |car|
        csv << ATTRIBUTES.map { |attr| car.send(attr) }
      end
    end
  end
end
