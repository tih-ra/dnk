class CreateMinibanners < ActiveRecord::Migration
  def self.up
    create_table :minibanners do |t|
      t.column :parent_id,  :integer
      t.column :content_type, :string
      t.column :filename, :string    
      t.column :thumbnail, :string 
      t.column :size, :integer
      t.column :width, :integer
      t.column :height, :integer
      t.column :link, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :minibanners
  end
end
