class CreateHaikouilles < ActiveRecord::Migration[5.1]
  def change
    create_table :haikouilles do |t|
      t.string :first
      t.string :second
      t.string :third
      t.string :title

      t.timestamps
    end
  end
end
