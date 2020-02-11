class CreateUsertasklists < ActiveRecord::Migration[5.2]
  def change
    create_table :usertasklists do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
