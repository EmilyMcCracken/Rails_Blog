class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.string :favbird
      t.text :bio

      t.timestamps null: false
    end
  end
end
