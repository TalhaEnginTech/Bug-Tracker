class CreateUserbugs < ActiveRecord::Migration[6.1]
  def change
    create_table :userbugs do |t|
      t.string :raised_by
      t.references :user, null: false, foreign_key: true
      t.references :bug, null: false, foreign_key: true

      t.timestamps
    end
  end
end
