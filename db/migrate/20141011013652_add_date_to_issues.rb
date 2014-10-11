class AddDateToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :date, :string
  end
end
