class CreateTiers < ActiveRecord::Migration
  def change
    create_table :tiers do |t|
      t.text :description
      t.integer :amount
      t.belongs_to :project

      t.timestamps
    end
  end
end
