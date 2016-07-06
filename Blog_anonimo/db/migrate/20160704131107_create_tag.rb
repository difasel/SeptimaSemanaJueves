class CreateTag < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag, null: false, uniqueness: true

      t.timestamp null: false
    end
  end
end



#tag = Tag.new(asdf: asdf)
#
#tag.posts << Post.new(asdf: alksjdf)
#
#PostsTags.new(post: 1, tag: 2)