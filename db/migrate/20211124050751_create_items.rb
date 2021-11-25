class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,            presence: true
      t.text       :text,            presence: true
      t.integer    :price,           presence: true
      t.integer    :category_id,     presence: true
      t.integer    :status_id,       presence: true
      t.integer    :postage_id,      presence: true
      t.integer    :prefecture_id,   presence: true
      t.integer    :shipping_day_id,     presence: true
      t.references :user,            presence: true,  foreign_key: true
      t.timestamps
    end
  end
end
