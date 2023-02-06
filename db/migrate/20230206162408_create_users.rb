class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email, index: { unique: true, name: 'unique_emails' }
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
