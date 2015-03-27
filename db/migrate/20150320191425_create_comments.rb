class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :potlock, index: true
      t.references :user, index: true
      t.string :comment

      t.timestamps null: false
    end
    add_foreign_key :comments, :potlocks
    add_foreign_key :comments, :users
  end
end
