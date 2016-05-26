class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.text :content
      t.datetime :meet_time
      t.references :user
      t.timestamps
    end
    add_index :matches, [:user_id, :created_at]
  end
end
