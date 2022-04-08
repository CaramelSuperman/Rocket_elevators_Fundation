class SomeFixes < ActiveRecord::Migration[5.2]
  def change
    change_column :interventions, :status, :string, :default => "Pending"
    change_column :interventions, :result, :string, :default => "Incomplete" 
    change_column :interventions, :start_intervention, :datetime
    change_column :interventions, :end_intervention, :datetime
  end
end
