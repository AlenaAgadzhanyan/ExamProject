class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.integer :movie_id, null: false
      t.string :user_name, null: false
      t.integer :rating, null: false
      t.text :review_text, null: false
      t.datetime :review_date, null: false

      t.timestamps
    end

    add_index :reviews, :movie_id
  end
end
