class CreateLetters < ActiveRecord::Migration[5.0]
  def change
    create_table :letters do |t|

      t.timestamps
    end
  end
end
