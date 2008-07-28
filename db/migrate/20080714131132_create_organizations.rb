class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string :name, :limit => 40, :null => false
      t.string :city, :limit => 25
      t.string :state, :limit => 14
      t.integer :award_total, :limit => 8
      t.integer :grants_count, :limit => 3
      t.string :awarded_years
      t.integer :investigators_count, :limit => 2
    end
    add_index :organizations, :name
    add_index :organizations, :city
    add_index :organizations, :state
    add_index :organizations, :award_total
    add_index :organizations, :grants_count
  end

  def self.down
    drop_table :organizations
  end
end
