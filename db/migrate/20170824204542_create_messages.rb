class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.bigint :from_id, index: true, null: false
      t.bigint :to_id, index: true, null: false
      t.string :subject, null: false
      t.text :body
      t.boolean :is_fav, default: false
      t.timestamps
    end

    add_foreign_key :messages, :users, column: :from_id, primary_key: :id
    add_foreign_key :messages, :users, column: :to_id, primary_key: :id
  end
end
