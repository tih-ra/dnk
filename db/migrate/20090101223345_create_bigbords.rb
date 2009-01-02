class CreateBigbords < ActiveRecord::Migration
  def self.up
    create_table :bigbords do |t|
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :bigbords
  end
end
