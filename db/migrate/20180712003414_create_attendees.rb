class CreateAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attendees do |t|
      t.belongs_to :friend
      t.belongs_to :party
      t.integer :friend_id, null: false
      t.integer :party_id, null: false
      t.string :item
    end
  end
end
