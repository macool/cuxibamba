class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :user
      t.string :content
      t.string :id_str

      t.timestamps
    end
  end
end


# t=Tweet.new(props)
# if t.save

# else
#   "algo sali"
# end


