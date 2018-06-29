class CreateJournalViewers < ActiveRecord::Migration[5.0]
  def change
    create_table :journal_viewers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :journal, null: false, foreign_key: true
      t.timestamps null: true
    end
    add_index :journal_viewers, %i[user_id journal_id], unique: true
  end
end
