# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(username: 'admin',
    employee_id: 'IH00001',
    email:'admin@intellixam.co.th',
    firstname:'Administrator',
    lastname:'Naja',
    phone_no: "+66891234567",
    password: 'password', 
    password_confirmation: 'password',
    created_by: 'system'
    )

Organization.create!(username: 'AIT',
    tax_id: 'TAX123456789',
    email:'st120224@ait.asia',
    name:'Asian Institute of Technology',
    address:'หมู่ที่ 9 58 Phahonyothin Rd, Khlong Nueng, Khlong Luang District, Pathum Thani 12120',
    contact_name: "Akraradet Sinsamersuk",
    phone_no: "089-122-2061",
    contact_note: "A student at AIT",
    password: 'password', 
    password_confirmation: 'password',
    created_by: 'system'
    )