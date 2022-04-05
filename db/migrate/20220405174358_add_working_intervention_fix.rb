class AddWorkingInterventionFix < ActiveRecord::Migration[5.2]
  def change
    add_column :interventions, :author, :string
    add_column :interventions, :customerID, :string
    add_column :interventions, :buildingID, :string 
    add_column :interventions, :batteryID, :string
    add_column :interventions, :columnID, :string
    add_column :interventions, :elevatorID, :string
    add_column :interventions, :start_intervention, :string
    add_column :interventions, :end_intervention, :string
    add_column :interventions, :result, :string
    add_column :interventions, :report, :string
    add_column :interventions, :status, :string
      end
    end
  