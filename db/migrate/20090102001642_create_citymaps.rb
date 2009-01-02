class CreateCitymaps < ActiveRecord::Migration
  def self.up
    create_table :citymaps do |t|
      t.string :city
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :citymaps
  end
end
