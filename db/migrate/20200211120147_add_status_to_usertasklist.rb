class AddStatusToUsertasklist < ActiveRecord::Migration[5.2]
  def change
    add_column :usertasklists, :status, :string
  end
end
