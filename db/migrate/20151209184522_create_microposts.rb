class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.text :content
      t.string :usuario
      t.string :id_twitter
      t.references :list, index: true

      t.timestamps
    end
    add_index :microposts, [:list_id, :created_at]
  end
end
