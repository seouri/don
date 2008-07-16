class CreateGrants < ActiveRecord::Migration
  def self.up
    create_table :grants do |t|
      t.integer :organization_id
      t.integer :investigator_id
      t.integer :year
      t.string :grant_number
      t.string :project_title
      t.integer :award
    end
    add_index :grants, :organization_id
    add_index :grants, :investigator_id
    add_index :grants, :year
    add_index :grants, :grant_number
    add_index :grants, :project_title
    add_index :grants, :award
    add_index :grants, [:year, :award]
  end

  def self.down
    drop_table :grants
  end
end
