class SecretCode < ApplicationRecord
  require "securerandom"
  NUM_OF_CODES = %w[1 10 20 50 100]

  belongs_to :user, optional: true

  before_save :save_secret_code

  def save_secret_code
    self.code = generate_secret_hash
  end

  private

  def generate_secret_hash
    SecureRandom.hex(2)
  end
end
