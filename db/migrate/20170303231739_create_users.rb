class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      #cant be null and deafult to empty string
      t.string :name, 	  :limit => 60, :deafult => '', :null => false
      t.string :email,    :limit => 50, :deafult => '', :null => false, :unique => true
      t.string :username, :limit => 25, :deafult => '', :null => false
      t.text :bio, :null => false
      t.string :password_digest, :deafult => '', :null =>  false
      t.integer :user_level, :limit =>1, :deafult =>0, :null => false
      t.timestamps
    end
  end

  def down
  	drop_table :users
  end
end
