class AddColumnToBugs < ActiveRecord::Migration[6.1]
  def change
    add_column :bugs, :assign_developer, :string
  end
end
