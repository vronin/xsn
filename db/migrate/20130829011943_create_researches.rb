class CreateResearches < ActiveRecord::Migration
  def change
    create_table :researches do |t|
      t.text :note

      t.timestamps
    end
  end
end
