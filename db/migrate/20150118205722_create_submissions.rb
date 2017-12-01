# frozen_string_literal: true

class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.references :community, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :submissions, :communities
  end
end
