class CreateInvestigators < ActiveRecord::Migration
  def self.up
    create_table :investigators do |t|
      t.string :name, :limit => 64, :null => false
      t.integer :award_total, :null => false
      t.integer :grants_count, :limit => 2, :null => false
      t.string :awarded_years, :null => false
    end
    add_index :investigators, :name
    add_index :investigators, :award_total
    add_index :investigators, :grants_count
  end

  def self.down
    drop_table :investigators
  end
end
