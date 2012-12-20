class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :admin
      t.boolean :in_beijing
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
