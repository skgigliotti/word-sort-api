class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :spelling
      t.string :language
      t.string :english
      t.integer :times_seen
      t.integer :times_practiced
      t.timestamps
    end
  end
end
