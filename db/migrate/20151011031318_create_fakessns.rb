class CreateFakessns < ActiveRecord::Migration
  def change
    create_table :fakessns do |t|
      t.string :ssn
      t.string :emailaddress

      t.timestamps 
    end
  end
end
