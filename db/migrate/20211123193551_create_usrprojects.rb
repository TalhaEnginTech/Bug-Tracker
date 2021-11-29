class CreateUsrprojects < ActiveRecord::Migration[6.1]
  def change
    create_table :usrprojects do |t|
      t.date :time
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
