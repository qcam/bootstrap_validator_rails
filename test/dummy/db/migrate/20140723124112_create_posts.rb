class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
    end
  end
end
