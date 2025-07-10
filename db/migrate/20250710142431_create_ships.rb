class CreateShips < ActiveRecord::Migration[8.0]
  def change
    create_table :ships do |t|
      t.string :name
      t.string :registry
      t.string :shipClass
      t.string :captain
      t.string :launched
      t.string :decommissioned

      t.timestamps
    end
  end
end
