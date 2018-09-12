class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :ip
      t.string :path
      t.string :browser

      t.timestamps
    end
  end
end
