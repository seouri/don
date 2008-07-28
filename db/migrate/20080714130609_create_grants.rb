class CreateGrants < ActiveRecord::Migration
  def self.up
    create_table :grants do |t|
      t.integer :organization_id
      t.integer :investigator_id
      t.integer :activity_id
      t.integer :year, :limit => 2, :null => false
      t.string :grant_number, :limit => 32, :null => false
      t.string :project_title, :limit => 128, :null => false
      t.integer :award, :null => false
    end
    add_index :grants, :organization_id
    add_index :grants, :investigator_id
    add_index :grants, [:organization_id, :year, :award]
    add_index :grants, [:organization_id, :investigator_id]
    add_index :grants, [:organization_id, :activity_id]
    add_index :grants, :activity_id
    add_index :grants, [:year, :award]
  end

  def self.down
    drop_table :grants
  end
end
