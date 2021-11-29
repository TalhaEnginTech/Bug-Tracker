class AddColumnToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :assign_developer, :string
  end
end
