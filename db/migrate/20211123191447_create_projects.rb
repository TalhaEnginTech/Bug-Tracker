class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :project_type
      t.string :created_by

      t.timestamps
    end
  end
end
