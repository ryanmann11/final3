class CreatePreps < ActiveRecord::Migration
  def change
    create_table :preps do |t|

      t.timestamps
    end
  end
end
