class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :location
      t.references :idea, index: true

      t.timestamps
    end
  end
end
