class CreateSigns < ActiveRecord::Migration[6.0]
  def change
    create_table :signs do |t|
      t.string :name
      t.string :video_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
