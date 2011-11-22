class CreateSpends < ActiveRecord::Migration
  def self.up
    create_table :spends do |t|
      t.string :ref
      t.string :supplier
      t.decimal :amount, :precision => 9, :scale => 2
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end

  def self.down
    drop_table :spends
  end
end
