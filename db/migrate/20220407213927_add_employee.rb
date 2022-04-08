class AddEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :interventions, :employee, :string
  end
end
