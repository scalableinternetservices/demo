class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :title
      t.string :url
      t.references :community, index: true

      t.timestamps null: false
    end
    add_foreign_key :submissions, :communities
  end
end
