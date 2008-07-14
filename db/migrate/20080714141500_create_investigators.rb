class CreateInvestigators < ActiveRecord::Migration
  def self.up
    create_table :investigators do |t|
      t.string :name
    end
    add_index :investigators, :name
  end

  def self.down
    drop_table :investigators
  end
end
