class RemoveTitleFromUsertasklist < ActiveRecord::Migration[5.2]
  def change
    remove_column :usertasklists, :title, :string
  end
end
