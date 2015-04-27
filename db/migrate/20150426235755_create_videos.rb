class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.datetime :published_at
      t.string :video_url
      t.string :image_url

      t.timestamps null: false
    end
  end
end
