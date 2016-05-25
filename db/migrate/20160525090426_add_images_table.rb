class AddImagesTable < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :user, null: false, index: true
      t.string :image, null: false, default: ''
    end
  end
end
