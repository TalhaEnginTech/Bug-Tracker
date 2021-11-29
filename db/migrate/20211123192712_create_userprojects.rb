class CreateUserprojects < ActiveRecord::Migration[6.1]
  def change
    create_table :userprojects do |t|
      # t.date :created_at
      t.date :time
      t.references :User, null: false, foreign_key: true
      t.string :Project
      t.string :references

      t.timestamps
    end
  end
end
