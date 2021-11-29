class AddColumnToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :assign_qa, :string
  end
end
