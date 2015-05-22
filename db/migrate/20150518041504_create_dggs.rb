class CreateDggs < ActiveRecord::Migration
  def change
    create_table :dggs do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
