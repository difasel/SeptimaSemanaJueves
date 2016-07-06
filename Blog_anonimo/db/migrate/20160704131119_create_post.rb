class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |p|
    p.string :title, null: false, uniqueness: true
    p.string :body, null: false
    
    p.timestamp null: false
    end
  end
end
