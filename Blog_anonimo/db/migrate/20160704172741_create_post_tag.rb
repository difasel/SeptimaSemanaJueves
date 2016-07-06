class CreatePostTag < ActiveRecord::Migration
  def change
    create_table :post_tags do |i|
      i.belongs_to :post, index: true
      i.belongs_to :tag, index: true
      i.timestamp null: false
    end
  end
end
