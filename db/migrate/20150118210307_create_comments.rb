# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :message, null: false
      t.references :submission, index: true, null: false
      t.references :parent, index: true, null: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :submissions
  end
end
