class AddImageToBigbord < ActiveRecord::Migration
  def self.up
    drop_table :bigbords
    create_table :bigbords do |t|
      t.column :parent_id,  :integer
      t.column :content_type, :string
      t.column :filename, :string    
      t.column :thumbnail, :string 
      t.column :size, :integer
      t.column :width, :integer
      t.column :height, :integer
      t.column :title, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :bigbords
  end
end
