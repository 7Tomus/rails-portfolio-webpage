class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :image
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
