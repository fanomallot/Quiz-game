class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :time
      t.string :place

      t.timestamps
    end
  end
end
