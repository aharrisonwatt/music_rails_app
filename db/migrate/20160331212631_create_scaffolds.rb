class CreateScaffolds < ActiveRecord::Migration
  def change
    create_table :scaffolds do |t|
      t.string :Band
      t.string :name

      t.timestamps null: false
    end
  end
end
