class CreateSecretCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :secret_codes do |t|
      t.string :code
      t.references :user
      t.timestamps
    end
  end
end
