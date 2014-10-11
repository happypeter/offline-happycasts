class RemoveDateFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :date, :string
  end
end
