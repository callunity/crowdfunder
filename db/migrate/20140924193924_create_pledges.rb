class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.belongs_to :backer
      t.belongs_to :tier
      t.integer :amount

      t.timestamps
    end
  end
end
