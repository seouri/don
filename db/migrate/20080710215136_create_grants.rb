class CreateGrants < ActiveRecord::Migration
  def self.up
    create_table :grants do |t|
      t.integer :organization_id
      t.integer :investigator_id
      t.integer :year
      t.integer :grant_number
      t.string :project_title
      t.integer :award

      t.timestamps
    end
  end

  def self.down
    drop_table :grants
  end
end