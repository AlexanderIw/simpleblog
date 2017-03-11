class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name, 	  :limit => 50, :deafult => '', :null => false
      t.string :email,    :limit => 255, :deafult => '', :null => false, :unique => true
      t.string :password_digest
      t.integer :user_level, :limit =>1, :deafult =>1
      t.timestamps
    end
  end

  def down
  	drop_table :users
  end
end
