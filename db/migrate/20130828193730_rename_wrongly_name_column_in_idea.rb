class RenameWronglyNameColumnInIdea < ActiveRecord::Migration
  def change
    rename_column :ideas, :descrption, :description
  end
end
