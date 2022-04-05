class AddColumnsToIntervention < ActiveRecord::Migration[5.2]
  def change
    add_column :intervention, :author, :string
    add_column :intervention, :customerID, :string
    add_column :intervention, :buildingID, :string 
    add_column :intervention, :batteryID, :string
    add_column :intervention, :columnID, :string
    add_column :intervention, :elevatorID, :string
    add_column :intervention, :start_intervention, :string
    add_column :intervention, :end_intervention, :string
    add_column :intervention, :result :string
    add_column :intervention, :report, :string
    add_column :intervention, :status, :string
    
    t.string "author"
    t.string "customerID"
    t.string "buildingID"
    t.string "batteryID"
    t.string "columnID"
    t.string "elevatorID"
    t.string "start_intervention"
    t.string "end_intervention"
    t.string "result"
    t.string "report"
    t.string "status"