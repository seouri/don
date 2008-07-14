class CreateInvestigators < ActiveRecord::Migration
  def self.up
    create_table :investigators do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :investigators
  end
end
