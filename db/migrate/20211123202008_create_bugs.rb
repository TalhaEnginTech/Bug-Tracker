class CreateBugs < ActiveRecord::Migration[6.1]
  def change
    create_table :bugs do |t|
      t.text :description
      t.string :deadline
      t.string :bug_type
      t.string :status

      t.timestamps
    end
  end
end
