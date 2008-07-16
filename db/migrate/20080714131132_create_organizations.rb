class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string :name
      t.string :city
      t.string :state
      t.integer :award_total, :limit => 8
      t.integer :grants_count
      t.string :awarded_years
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
