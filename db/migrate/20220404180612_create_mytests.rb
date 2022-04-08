class CreateMytests < ActiveRecord::Migration[5.2]
  def change
    create_table :mytests do |t|

      t.timestamps
    end
  end
end
