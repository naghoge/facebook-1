class CreateInsts < ActiveRecord::Migration
  def change
    create_table :insts do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
