class CreateSendmails < ActiveRecord::Migration
  def change
    create_table :sendmails do |t|
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
