require "faker"

Map.destroy_all
Employee.destroy_all
Quote.destroy_all
# User.destroy_all
# Battery.destroy_all
# Customer.destroy_all
# Elevator.destroy_all
# Lead.destroy_all
# Building.destroy_all
# Adress.destroy_all

user1 = User.create!({
    email: 'mathieu.houde@codeboxx.biz',
    password: '123456',
    password_confirmation: '123456',
    admin: true
})
user2 = User.create!({
    email: 'patrick.thibault@codeboxx.biz',
    password: '123456',
    password_confirmation: '123456',
    admin: true
})
user3 = User.create!({
    email: 'francis.patry-jessop@codeboxx.biz',
    password: '123456',
    password_confirmation: '123456',
    admin: true
})
user4 = User.create!({
    email: 'abdul.akeeb@codebozz.biz',
    password: '123456',
    password_confirmation: '123456',
    admin: true
})
user5 = User.create!({
    email: 'david.amyot@codeboxx.biz',
    password: '123456',
    password_confirmation: '123456',
    admin: true
})
user6 = User.create!({
    email: 'thomas.carrier@codeboxx.biz',
    password: '123456',
    password_confirmation: '123456',
    admin: true
})
user7 = User.create!({
    email: 'timothy.wever@codeboxx.biz',
    password: '123456',
    password_confirmation: '123456',
    admin: true
})
user8 = User.create!({
    email: 'kiril.kleinerman@codeboxx.biz',
    password: '123456',
    password_confirmation: '123456',
    admin: true
})
user9 = User.create!({
    email: 'emmanuela.derilus@codeboxx.biz',
    password: '123456',
    password_confirmation: '123456',
    admin: true
})
user10 = User.create!({
    email: 'marie-eve.goupil@codeboxx.biz',
    password: '123456',
    password_confirmation: '123456',
    admin: true
})
user11 = User.create!({
    email: 'perry.sawatsky@codeboxx.biz',
    password: '123456',
    password_confirmation: '123456',
    admin: true
})
Employee.create!([{
    user_id: user1.id,
    first_name: "Mathieu",
    last_name: "Houde",
    title: "Captain",
    email: "mathieu.houde@codeboxx.biz"
  },
  {
    user_id: user2.id,
    first_name: "Patrick",
    last_name: "Thibault",
    title: "Engineer",
    email: "patrick.thibault@codeboxx.biz"
  },
  {
    user_id: user3.id,
    first_name: "Francis",
    last_name: "Patry-Jessop",
    title: "Engineer",
    email: "francis.patry-jessop@codeboxx.biz"
  },
  {
    user_id: user4.id,
    first_name: "Abdul",
    last_name: "Akeeb",
    title: "Engineer",
    email: "abdul.akeeb@codebozz.biz"
  },
  {
    user_id: user5.id,
    first_name: "David",
    last_name: "Amyot",
    title: "Engineer",
    email: "david.amyot@codeboxx.biz"
  },
  {
    user_id: user6.id,
    first_name: "Thomas",
    last_name: "Carrier",
    title: "Developer",
    email: "thomas.carrier@codeboxx.biz"
  },
  {
    user_id: user7.id,
    first_name: "Timothy",
    last_name: "Wever",
    title: "Developer",
    email: "timothy.wever@codeboxx.biz"
  },
  {
    user_id: user8.id,
    first_name: "Kiril",
    last_name: "Kleinerman",
    title: "Developer",
    email: "kiril.kleinerman@codeboxx.biz"
  },
  {
    user_id: user9.id,
    first_name: "Emmanuela",
    last_name: "Derilus",
    title: "Developer",
    email: "emmanuela.derilus@codeboxx.biz"
  },
  {
    user_id: user10.id,
    first_name: "Marie-Ève",
    last_name: "Goupil",
    title: "Developer",
    email: "marie-eve.goupil@codeboxx.biz"
  },
  {
    user_id: user11.id,
    first_name: "Perry",
    last_name: "Sawatsky",
    title: "Developer",
    email: "perry.sawatsky@codeboxx.biz"
  }])
 


  20.times do |i|
    
    apartments = rand(10..40)
    floors = rand(5..50)
    basements = rand(1..5)

    averageDoorsPerFloor = apartments / floors
    elevatorShafts = averageDoorsPerFloor / 6
    if elevatorShafts < 1
      elevatorShafts = 1
    end

    columns = 0
    unitPrice = 7565
      
    if floors > 20
      columns = ((floors+basements) / 20).ceil + 1
    else
      columns = 1
    end
  
      
    elevatorCount = (elevatorShafts * columns).ceil
    totalPriceOfElev = elevatorCount * unitPrice
    installFees = totalPriceOfElev * 0.1
    finalPrice = totalPriceOfElev + installFees

    interventions = Intervention.create!({
      author:rand(1..11),
      customerID:rand(10..40),
      buildingID = building.id,
      battery = current_battery.id,
      column = current_column.id,
      elevator = current_elevator.id,
      employeeID = current_employee.id,
      start_intervention:"null",
      end_intervention:"null",
      result:"incomplete", 
      report:"empty",
      result:"pending"
    })

    quotes = Quote.create!({
      building_type:'Residential', 
      product_line:'Standard',
      no_of_apartments: apartments,
      no_of_floors: floors,
      no_of_basements: basements,
      created_at:Faker::Date.backward(days: 2000),
      updated_at:Faker::Date.backward(days: 1000),
      no_of_elevators_needed: elevatorCount,
      unit_price:7565,
      total_price_of_elevators: totalPriceOfElev,
      installation_fees: installFees,
      final_price: finalPrice,
      companyName:Faker::Company.unique.name,
      email:Faker::Internet.email,
      processed: true
    })

    # puts quotes
  end

    20.times do |i|
    
      apartments = rand(10..40)
      floors = rand(5..50)
      basements = rand(1..5)
  
      averageDoorsPerFloor = apartments / floors
      elevatorShafts = averageDoorsPerFloor / 6
      if elevatorShafts < 1
        elevatorShafts = 1
      end
  
      columns = 0
      unitPrice = 12345
        
      if floors > 20
        columns = ((floors+basements) / 20).ceil + 1
      else
        columns = 1
      end
    
        
      elevatorCount = (elevatorShafts * columns).ceil
      totalPriceOfElev = elevatorCount * unitPrice
      installFees = totalPriceOfElev * 0.13
      finalPrice = totalPriceOfElev + installFees

  
      quotes = Quote.create!({
        building_type:'Residential', 
        product_line:'Premium',
        no_of_apartments: apartments,
        no_of_floors: floors,
        no_of_basements: basements,
        created_at:Faker::Date.backward(days: 2000),
        updated_at:Faker::Date.backward(days: 1000),
        no_of_elevators_needed: elevatorCount,
        unit_price:7565,
        total_price_of_elevators: totalPriceOfElev,
        installation_fees: installFees,
        final_price: finalPrice,
        companyName:Faker::Company.unique.name,
        email:Faker::Internet.email,
        processed: [true, false].sample
      })
    end

  20.times do |i|

    apartments = rand(10..40)
    floors = rand(5..50)
    basements = rand(1..5)

    averageDoorsPerFloor = apartments / floors
    elevatorShafts = averageDoorsPerFloor / 6
    if elevatorShafts < 1
      elevatorShafts = 1
    end

    columns = 0
    unitPrice = 15400
      
    if floors > 20
      columns = ((floors+basements) / 20).ceil + 1
    else
      columns = 1
    end
  
      
    elevatorCount = (elevatorShafts * columns).ceil
    totalPriceOfElev = elevatorCount * unitPrice
    installFees = totalPriceOfElev * 0.16
    finalPrice = totalPriceOfElev + installFees

    quotes = Quote.create!({
      building_type:'Residential', 
      product_line:'Excelium',
      no_of_apartments: apartments,
      no_of_floors: floors,
      no_of_basements: basements,
      created_at:Faker::Date.backward(days: 2000),
      updated_at:Faker::Date.backward(days: 1000),
      no_of_elevators_needed: elevatorCount,
      unit_price:7565,
      total_price_of_elevators: totalPriceOfElev,
      installation_fees: installFees,
      final_price: finalPrice,
      companyName:Faker::Company.unique.name,
      email:Faker::Internet.email,
      processed: [true, false].sample
    })
  end

  ##############Commercial##################
  20.times do |i|
      
    unitPrice = 7565
    elevatorCount = rand(1..10)
    totalPriceOfElev = elevatorCount * unitPrice
    installFees = totalPriceOfElev * 0.1
    finalPrice = totalPriceOfElev + installFees

    quotes = Quote.create!({
      building_type:'Commercial', 
      product_line:'Standard',
      no_of_floors: rand(5..50),
      no_of_basements: rand(2..10),
      no_of_businesses: rand(30..100),
      no_of_parking_spaces: rand(20..200),
      no_of_elevator_cages: elevatorCount,
      created_at:Faker::Date.backward(days: 2000),
      updated_at:Faker::Date.backward(days: 1000),
      no_of_elevators_needed: elevatorCount,
      unit_price:7565,
      total_price_of_elevators: totalPriceOfElev,
      installation_fees: installFees,
      final_price: finalPrice,
      companyName:Faker::Company.unique.name,
      email:Faker::Internet.email,
      processed: [true, false].sample
    })

    # puts quotes
    end

    20.times do |i|

      unitPrice = 12345
      elevatorCount = rand(1..10)
      totalPriceOfElev = elevatorCount * unitPrice
      installFees = totalPriceOfElev * 0.13
      finalPrice = totalPriceOfElev + installFees
  
      quotes = Quote.create!({
        building_type:'Commercial', 
        product_line:'Premium',
        no_of_floors: rand(5..50),
        no_of_basements: rand(2..10),
        no_of_businesses: rand(30..100),
        no_of_parking_spaces: rand(20..200),
        no_of_elevator_cages: elevatorCount,
        created_at:Faker::Date.backward(days: 2000),
        updated_at:Faker::Date.backward(days: 1000),
        no_of_elevators_needed: elevatorCount,
        unit_price:7565,
        total_price_of_elevators: totalPriceOfElev,
        installation_fees: installFees,
        final_price: finalPrice,
        companyName:Faker::Company.unique.name,
        email:Faker::Internet.email,
        processed: [true, false].sample
      })
    end

  20.times do |i|

    unitPrice = 15400
    elevatorCount = rand(1..10)
    totalPriceOfElev = elevatorCount * unitPrice
    installFees = totalPriceOfElev * 0.16
    finalPrice = totalPriceOfElev + installFees

    quotes = Quote.create!({
      building_type:'Commercial', 
      product_line:'Excelium',
      no_of_floors: rand(5..50),
      no_of_basements: rand(2..10),
      no_of_businesses: rand(30..100),
      no_of_parking_spaces: rand(20..200),
      no_of_elevator_cages: elevatorCount,
      created_at:Faker::Date.backward(days: 2000),
      updated_at:Faker::Date.backward(days: 1000),
      no_of_elevators_needed: elevatorCount,
      unit_price:7565,
      total_price_of_elevators: totalPriceOfElev,
      installation_fees: installFees,
      final_price: finalPrice,
      companyName:Faker::Company.unique.name,
      email:Faker::Internet.email,
      processed: [true, false].sample
    })
  end
  
  quote1 = Quote.create!({
    building_type:'Residential', 
    product_line:'Standard',
    no_of_apartments: 45,
    no_of_floors: 50,
    no_of_basements:5,
    created_at:Faker::Date.backward(days: 2000),
    updated_at:Faker::Date.backward(days: 1000),
    no_of_elevators_needed:26,
    unit_price:7565,
    total_price_of_elevators:196690,
    installation_fees:19669,
    final_price:216359,
    companyName:Faker::Company.unique.name,
    email:Faker::Internet.email,
    processed: true
  
  })

quote2 = Quote.create!({
building_type:'Residential', 
product_line:'Standard',
no_of_apartments: 20,
no_of_floors: 30,
no_of_basements:2,
created_at:Faker::Date.backward(days: 2000),
updated_at:Faker::Date.backward(days: 1000),
no_of_elevators_needed:16,
unit_price:7565,
total_price_of_elevators:121040,
installation_fees:12104,
final_price:133144,
companyName:Faker::Company.unique.name,
email:Faker::Internet.email,
processed: true

})

quote3 = Quote.create!({

building_type:'Residential', 
product_line:'Standard',
no_of_apartments: 100,
no_of_floors: 70,
no_of_basements:10,
created_at:Faker::Date.backward(days: 2000),
updated_at:Faker::Date.backward(days: 1000),
no_of_elevators_needed:351,
unit_price:7565,
total_price_of_elevators:2655315,
installation_fees:265531,
final_price:2920846,
companyName:Faker::Company.unique.name,
email:Faker::Internet.email,
processed: true

})

quote4 = Quote.create!({

building_type:'Residential', 
product_line:'Standard',
no_of_apartments: 60,
no_of_floors: 50,
no_of_basements:6,
created_at:Faker::Date.backward(days: 2000),
updated_at:Faker::Date.backward(days: 1000),
no_of_elevators_needed:26,
unit_price:7565,
total_price_of_elevators:196690,
installation_fees:19669,
final_price:216359,
companyName:Faker::Company.unique.name,
email:Faker::Internet.email,
processed: true

})
quote5 = Quote.create!({

building_type:'Residential', 
product_line:'Standard',
no_of_apartments: 20,
no_of_floors: 8,
no_of_basements:2,
created_at:Faker::Date.backward(days: 2000),
updated_at:Faker::Date.backward(days: 1000),
no_of_elevators_needed:1,
unit_price:7565,
total_price_of_elevators:7565,
installation_fees:756,
final_price:8321,
companyName:Faker::Company.unique.name,
email:Faker::Internet.email,
processed: true

})
quote6 = Quote.create!({

building_type:'Residential', 
product_line:'Premium',
no_of_apartments: 28,
no_of_floors: 16,
no_of_basements:3,
created_at:Faker::Date.backward(days: 2000),
updated_at:Faker::Date.backward(days: 1000),
no_of_elevators_needed:1,
unit_price:12345,
total_price_of_elevators:12345,
installation_fees:1604,
final_price:13949,
companyName:Faker::Company.unique.name,
email:Faker::Internet.email,
processed: true

})

quote7 = Quote.create!({

building_type:'Commercial', 
product_line:'Premium',
no_of_floors: 80,
no_of_basements:62,
no_of_businesses:30,
no_of_parking_spaces:100,
no_of_elevator_cages:10,
created_at:Faker::Date.backward(days: 2000),
updated_at:Faker::Date.backward(days: 1000),
no_of_elevators_needed:10,
unit_price:12345,
total_price_of_elevators:123450,
installation_fees:16048,
final_price:139498,
companyName:Faker::Company.unique.name,
email:Faker::Internet.email,
processed: true

})

quote8 = Quote.create!({

building_type:'Commercial', 
product_line:'Premium',
no_of_floors: 50,
no_of_basements:10,
no_of_businesses:3,
no_of_parking_spaces:40,
no_of_elevator_cages:8,
created_at:Faker::Date.backward(days: 2000),
updated_at:Faker::Date.backward(days: 1000),
no_of_elevators_needed:8,
unit_price:12345,
total_price_of_elevators:98760,
installation_fees:12838,
final_price:111598,
companyName:Faker::Company.unique.name,
email:Faker::Internet.email,
processed: true

})

quote9 = Quote.create!({

  building_type:'Commercial', 
  product_line:'Standard',
  no_of_floors: 60,
  no_of_basements:1,
  no_of_businesses:30,
  no_of_parking_spaces:200,
  no_of_elevator_cages:10,
  created_at:Faker::Date.backward(days: 2000),
  updated_at:Faker::Date.backward(days: 1000),
  no_of_elevators_needed:18,
  unit_price:7565,
  total_price_of_elevators:75650,
  installation_fees:7565,
  final_price:83215,
  companyName:Faker::Company.unique.name,
  email:Faker::Internet.email,
  processed: true

  })

  quote10 = Quote.create!({

    building_type:'Commercial', 
    product_line:'Standard',
    no_of_floors: 60,
    no_of_basements:10,
    no_of_businesses:60,
    no_of_parking_spaces:300,
    no_of_elevator_cages:16,
    max_of_occupants_per_floor:100,
    no_of_hours_of_activities:12,
    created_at:Faker::Date.backward(days: 2000),
    updated_at:Faker::Date.backward(days: 1000),
    no_of_elevators_needed:602,
    unit_price:7565,
    total_price_of_elevators:4554130,
    installation_fees:455413,
    final_price:5000943,
    companyName:Faker::Company.unique.name,
    email:Faker::Internet.email,
    processed: true
  
    })


  p "Created #{Employee.count} employee and #{User.count} users."
  # Non quote

  # Users
  100.times do |i|
    user = User.create!({
      email: Faker::Internet.unique.email,
      password: '123456',
      password_confirmation: '123456',
      admin: false
    })
    user.save
  end

  path = File.join(File.dirname(__FILE__),"./seeds/real-addresses.json")
  records = JSON.parse(File.read(path))

  29.times do |i|
    address_record = records["addresses"][i]
    address = Adress.create!({
      type_of_adress: ['Residential', 'Commercial','Corporate'].sample,
      status: ['online','offline'].sample,
      entity: ["House","Office","PObox","Gouvernement"].sample,
      number_and_street: address_record["address1"],
      suite_or_appartment: address_record["suite"],
      city: address_record["city"],
      state: address_record["state"],
      postal_code: address_record["postalCode"],
      latitude: address_record["latitude"],
      longitude: address_record["longitude"],
      country: "United States"
    })
    address.save
  end

#   fake_path = File.join(File.dirname(__FILE__),"./seeds/addresses-us-500.json")
#   fake_records = JSON.parse(File.read(fake_path))

#   #Addresses
#   30.upto(40) do |i|
#     adress_record = fake_records["addresses"][i]
#     adress = Adress.create!({
#       type_of_adress: ['Residential', 'Commercial','Corporate'].sample,
#       status: ['online','offline'].sample,
#       entity: ["House","Office","PObox","Gouvernement"].sample,
#       number_and_street: adress_record["address1"],
#       suite_or_appartment: rand(1..500).to_s,
#       city: adress_record["city"],
#       state: adress_record["state"],
#       postal_code: adress_record["postalCode"],
#       latitude: adress_record["coordinates"]["lat"].to_s,
#       longitude: adress_record["coordinates"]["lng"].to_s,
#       country: "United States",
#     })
#     adress.save
#   end
  
  # Customers
  # for i in 1..(User.count / 2) do
  40.times do |i|
    customer = Customer.create!({
      Customers_Creation_Date:Faker::Date.backward(days: 1000),
      Company_Name:Faker::Company.unique.name,
      Full_Name_of_the_company_contact:Faker::Name.unique.name,
      Company_contact_phone:Faker::PhoneNumber.unique.cell_phone,
      Email_of_the_company_contact:Faker::Internet.unique.email,
      Company_Description:Faker::Company.unique.catch_phrase,
      Full_Name_of_servive_Technical_Authority:Faker::Name.unique.name,
      Technical_Manager_Email_for_Servive:Faker::Internet.unique.email,
      user_id: User.find(User.pluck(:id).sample).id,
      adress_id: Adress.find(Adress.pluck(:id).sample).id
    })
    customer.save
  end

  # Buildings
 Adress.find_each do |i|
    current_customer = Customer.where(id: i).first
    building = Building.create!({
      customer_id: current_customer.id,
      adress_id: i.id,
      Full_Name_of_the_building_administrator:Faker::Name.unique.name,
      Email_of_the_administrator_of_the_building:Faker::Internet.email,
      Phone_number_of_the_building_administrator:Faker::PhoneNumber.unique.cell_phone,
      Full_Name_of_the_technical_contact_for_the_building:Faker::Name.unique.name,
      Technical_contact_email_for_the_building:Faker::Internet.unique.email,
      Technical_contact_phone_for_the_building:Faker::PhoneNumber.unique.cell_phone,
      No_of_floors: rand(5..50)
    })
    building.save
  end

  # Building details
  29.times do
    current_building = Building.find(Building.pluck(:id).sample)
    details = Detailsbuilding.create!({
      information_key:Faker::Company.buzzword,
      value:Faker::Company.buzzword,
      building_id: current_building.id
    })
    details.save
  end
  
  # Batteries
  40.times do
    current_building = Building.find(Building.pluck(:id).sample)
    current_employee = Employee.find(Employee.pluck(:id).sample)
    battery = Battery.create!({
      building_id: current_building.id,
      employee_id: current_employee.id,
      status:['online','offline', 'intervention'].sample,
      date_of_commissioning:Faker::Date.backward(days: 1000),
      date_of_last_inspection:Faker::Date.backward(days: 900),
      certificate_of_operations:'Inspected',
      information:Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
      notes:Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
    })
    battery.save
  end

  # Columns
  50.times do
    current_battery = Battery.find(Battery.pluck(:id).sample)
    column = Column.create!({
      battery_id: current_battery.id,
      set_type:['Residential','Commercial','Corporate'].sample,
      nb_of_floors_served:Faker::Number.between(from: 8, to: 20),
      status:['online','offline', 'intervention'].sample,
      information: current_battery.information,
      notes: current_battery.information
    })
    column.save
  end

  # Elevators
  70.times do
    current_column = Column.find(Column.pluck(:id).sample)
    elevator = Elevator.create!({
      column_id: current_column.id,
      Serial_number:Faker::Number.between(from: 1, to: 10),
      Model:['Standard','Premium','Excelium'].sample,
      Type:['Residential', 'Commercial','Corporate'].sample,
      Status:['online','offline', 'intervention'].sample,
      Date_of_commissioning: Faker::Date::between(from: '2020-01-01', to: '2021-11-29'),
      Date_of_last_inspection: Faker::Date::between(from: '2020-01-01', to: '2021-11-29'),
      Certificate_of_inspection:'Inspected',
      Information: current_column.information,
      Notes: current_column.notes
    })
    elevator.save
  end
    
  100.times do
    leads = Lead.create!({
      full_name:Faker::Name.unique.name,
      cie_name:Faker::Company.unique.name,
      email:Faker::Internet.email,
      phone:Faker::PhoneNumber.unique.cell_phone,
      created_at:Faker::Date.backward(days: 2000),
      updated_at:Faker::Date.backward(days: 1000),
      project_name:Faker::Company.unique.name,
      project_description:Faker::Company.industry,
      department_in_charge:Faker::Company.industry,
      message:Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4),
    })
    leads.save
   end


  Building.find_each do |b|
    batteryCount = 0
    columnCount = 0
    elevatorCount = 0
    Battery.find_each do |a|
        if a.building_id == b.id
            batteryCount += 1
            Column.find_each do |c|
                if c.battery_id == a.id
                    columnCount += 1
                end
                Elevator.find_each do |e|
                    if e.column_id = c.id
                        elevatorCount += 1
                    end
                end
            end
        end
    end
    Map.create!({
    location_of_the_building: b.adress.number_and_street + ", " + b.adress.city + ", " + b.adress.state + ", " + b.adress.country + ", " + b.adress.postal_code,
    client_name: b.customer.Company_Name,
    no_of_floors_in_the_building: b.No_of_floors,
    no_of_batteries: batteryCount,
    no_of_columns: columnCount,
    no_of_elevators: elevatorCount,
    full_name_of_technical_contact: b.Full_Name_of_the_technical_contact_for_the_building,
    latitude: b.adress.latitude,
    longitude: b.adress.longitude
    })
  end




























