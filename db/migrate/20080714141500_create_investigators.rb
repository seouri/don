class CreateInvestigators < ActiveRecord::Migration
  def self.up
    create_table :investigators do |t|
      t.string :name
      t.integer :award_total
      t.integer :grants_count
      t.string :awarded_years
    end
    add_index :investigators, :name
    add_index :investigators, :award_total
    add_index :investigators, :grants_count
  end

  def self.down
    drop_table :investigators
  end
end
