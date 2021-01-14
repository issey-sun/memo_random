class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.text       :title,                   null: false
      t.text       :introduce
      t.date       :day
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
