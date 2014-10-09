class RemoveStateFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :state, :string
  end
end
