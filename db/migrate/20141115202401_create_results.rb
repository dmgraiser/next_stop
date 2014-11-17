class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :busnum
      t.string :nextstop

      t.timestamps
    end
  end
end
