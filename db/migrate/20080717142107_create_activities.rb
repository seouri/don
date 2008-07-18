class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :code, :limit => 3
      t.string :category
      t.string :title
      t.text :description
      t.integer :award_total, :limit => 8
      t.integer :grants_count
    end
    add_index :activities, :code, :unique => true
    add_index :activities, :category
    add_index :activities, :award_total
    add_index :activities, :grants_count
  end

  def self.down
    drop_table :activities
  end
end
