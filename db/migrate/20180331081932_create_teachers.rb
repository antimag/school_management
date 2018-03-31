class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :address_line1
      t.string :address_line2
      t.string :email
      t.string :qualification
      t.string :phone
      t.string :gender
      t.string :category
      t.string :city
      t.string :state
      t.string :pin_code
      t.string :country
      t.timestamps
    end
  end
end
