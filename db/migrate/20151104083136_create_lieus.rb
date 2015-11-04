class CreateLieus < ActiveRecord::Migration
  def change
    create_table :lieus do |t|
      t.string :nom
      t.text :commentaire
      t.boolean :recommandation
      t.integer :note

      t.timestamps null: false
    end
  end
end
