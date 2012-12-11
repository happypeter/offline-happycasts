class AddThingsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :title, :string
    add_column :events, :content, :text
  end
end
