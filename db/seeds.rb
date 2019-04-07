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

org_ait = Organization.create!(username: 'AIT',
    tax_id: 'TAX123456789',
    email:'akraradets@gmail.com',
    name:'Asian Institute of Technology',
    address:'หมู่ที่ 9 58 Phahonyothin Rd, Khlong Nueng, Khlong Luang District, Pathum Thani 12120',
    contact_name: "Akraradet Sinsamersuk",
    phone_no: "089-122-2061",
    contact_note: "A student at AIT",
    password: 'password', 
    password_confirmation: 'password',
    created_by: 'system'
    )

Candidate.create!(username: 'akraradets',
    firstname: 'Akraradet',
    lastname: 'Sinsamersuk',
    email: 'st120224@ait.asia',
    citizen_id: '1100500661429',
    phone_no: '089-122-2061',
    gender: 'M',
    birthday: Date.new(1992,9,23),
    password: 'password', 
    password_confirmation: 'password',
    created_by: 'system'
)

# Resources
bu_ait = Building.create!(
    name: 'CSIM',
    address: 'หมู่ที่ 9 58 Phahonyothin Rd, Khlong Nueng, Khlong Luang District, Pathum Thani 12120',
    latitude: 14.080602,
    longitude: 100.612749,
    created_by: 'system'
)
room_cs106 = Room.create!(
    building: bu_ait,
    name: 'CS106',
    floor: '1',
    max_row: 5,
    max_column: 6,
    created_by: 'system'
)

# not ready Exam
Exam.create!(
    owner: org_ait,
    title: 'SAD',
    code: 'AIT19-01',
    enroll_start: DateTime.now,
    enroll_end: DateTime.new(2019,4,28,00,00),
    exam_start: DateTime.new(2019,4,29,15,00),
    exam_end: DateTime.new(2019,4,29,18,00),
    description: 'Waiting for reservation to be completed',
    format: 'Wrtting',
    fee: 5000,
    max_enrollment: 20,
    status: 'Waitting for reservation',
    created_by: 'system'
)

# Ready Exam
exam_isdm = Exam.create!(
    owner: Organization.first,
    title: 'ISDM',
    code: 'AIT19-02',
    enroll_start: DateTime.now,
    enroll_end: DateTime.new(2019,4,26,00,00),
    exam_start: DateTime.new(2019,4,26,13,00),
    exam_end: DateTime.new(2019,4,26,16,00),
    description: 'Ready for register',
    format: 'Multiple Choice',
    fee: 5000,
    max_enrollment: 20,
    status: 'Running',
    created_by: 'system'
)

reserve_isdm = Reservation.create!(
    exam: exam_isdm,
    room: room_cs106,
    created_by: 'system'
)

