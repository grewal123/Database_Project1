class CreateFakenames < ActiveRecord::Migration
  def change
    create_table :fakenames do |t|
      t.string :gender
      t.string :title
      t.string :givenname
      t.string :middleinitial
      t.string :surname
      t.string :city
      t.string :countryfull
      t.string :emailaddress

      t.timestamps 
    end
  end
end
