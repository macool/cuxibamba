class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :user
      t.string :content
      t.string :id_str
      t.references :list, index: true, foreign_key: true
      t.timestamps
    end
    add_index :tweets, [:list_id, :created_at]
  end
end




