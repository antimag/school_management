class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string   "first_name"
      t.string   "middle_name"
      t.string   "last_name"
      t.string   :father_name
      t.string   :mother_name
      t.string   "class_roll_no"
      t.date     "date_of_birth"
      t.string   "gender"
      t.string   "birth_place"
      t.string   "language"
      t.string   "religion"
      t.string  "category"
      t.string   "address_line1"
      t.string   "address_line2"
      t.string   "city"
      t.string   "state"
      t.string   "pin_code"
      t.string  "country"
      t.string   "phone"
      t.string   "email"
      t.timestamps
    end
  end
end
