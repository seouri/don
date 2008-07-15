class CreateInvestigators < ActiveRecord::Migration
  def self.up
    create_table :investigators do |t|
      t.string :name
      t.integer :award_total
    end
    add_index :investigators, :name
    add_index :investigators, :award_total
  end

  def self.down
    drop_table :investigators
  end
end
