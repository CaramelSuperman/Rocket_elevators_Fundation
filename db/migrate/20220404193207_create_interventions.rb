class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|

      t.timestamps
    end
  end
end
