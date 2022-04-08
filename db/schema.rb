# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_07_213927) do

  create_table "adresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "type_of_adress"
    t.string "status"
    t.string "entity"
    t.string "number_and_street"
    t.string "suite_or_appartment"
    t.string "city"
    t.string "postal_code"
    t.string "country"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.string "latitude"
    t.string "longitude"
  end

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "status"
    t.date "date_of_commissioning"
    t.date "date_of_last_inspection"
    t.string "certificate_of_operations"
    t.string "information"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "building_id"
    t.bigint "employee_id"
    t.index ["building_id"], name: "index_batteries_on_building_id"
    t.index ["employee_id"], name: "index_batteries_on_employee_id"
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "Full_Name_of_the_building_administrator"
    t.string "Email_of_the_administrator_of_the_building"
    t.string "Phone_number_of_the_building_administrator"
    t.string "Full_Name_of_the_technical_contact_for_the_building"
    t.string "Technical_contact_email_for_the_building"
    t.string "Technical_contact_phone_for_the_building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.bigint "adress_id"
    t.integer "No_of_floors"
    t.index ["adress_id"], name: "index_buildings_on_adress_id"
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
  end

  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "set_type"
    t.integer "nb_of_floors_served"
    t.string "status"
    t.string "information"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "battery_id"
    t.index ["battery_id"], name: "index_columns_on_battery_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "Customers_Creation_Date"
    t.string "Company_Name"
    t.string "Full_Name_of_the_company_contact"
    t.string "Company_contact_phone"
    t.string "Email_of_the_company_contact"
    t.string "Company_Description"
    t.string "Full_Name_of_servive_Technical_Authority"
    t.string "Technical_Manager_Email_for_Servive"
    t.string "Technical_Manager_Email_for_Service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "adress_id"
    t.index ["adress_id"], name: "index_customers_on_adress_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "detailsbuildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "information_key"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "building_id"
    t.index ["building_id"], name: "index_detailsbuildings_on_building_id"
  end

  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "Serial_number"
    t.string "Model"
    t.string "Type"
    t.string "Status"
    t.string "Date_of_commissioning"
    t.string "Date_of_last_inspection"
    t.string "Certificate_of_inspection"
    t.string "Information"
    t.string "Notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "column_id"
    t.index ["column_id"], name: "index_elevators_on_column_id"
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "interventions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author"
    t.string "customerID"
    t.string "buildingID"
    t.string "batteryID"
    t.string "columnID"
    t.string "elevatorID"
    t.datetime "start_intervention"
    t.datetime "end_intervention"
    t.string "result", default: "Incomplete"
    t.string "report"
    t.string "status", default: "Pending"
    t.string "employee"
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "full_name"
    t.string "cie_name"
    t.string "email"
    t.string "phone"
    t.string "project_name"
    t.string "project_description"
    t.string "department_in_charge"
    t.string "message"
    t.binary "attached_files", limit: 16777215
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "location_of_the_building"
    t.integer "no_of_floors_in_the_building"
    t.string "client_name"
    t.integer "no_of_batteries"
    t.integer "no_of_columns"
    t.integer "no_of_elevators"
    t.string "full_name_of_technical_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "latitude"
    t.string "longitude"
  end

  create_table "mytests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "building_type"
    t.string "product_line"
    t.integer "no_of_apartments"
    t.integer "no_of_floors"
    t.integer "no_of_basements"
    t.integer "no_of_businesses"
    t.integer "no_of_parking_spaces"
    t.integer "no_of_elevator_cages"
    t.integer "max_of_occupants_per_floor"
    t.integer "no_of_hours_of_activities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "no_of_elevators_needed"
    t.integer "unit_price"
    t.integer "total_price_of_elevators"
    t.integer "installation_fees"
    t.integer "final_price"
    t.string "companyName"
    t.string "email"
    t.string "fullName"
    t.string "phone"
    t.string "department"
    t.string "projectName"
    t.string "projectDesc"
    t.string "message"
    t.boolean "processed"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "batteries", "buildings"
  add_foreign_key "buildings", "adresses"
  add_foreign_key "buildings", "customers"
  add_foreign_key "columns", "batteries"
  add_foreign_key "customers", "adresses"
  add_foreign_key "customers", "users"
  add_foreign_key "detailsbuildings", "buildings"
  add_foreign_key "elevators", "columns"
  add_foreign_key "employees", "users"
end
