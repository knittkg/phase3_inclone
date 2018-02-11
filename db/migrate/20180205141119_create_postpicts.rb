class CreatePostpicts < ActiveRecord::Migration[5.1]
  def change
    create_table :postpicts do |t|
      t.text :image
      t.text :caption

      t.timestamps
    end
  end
end
