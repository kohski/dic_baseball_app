class CreateSalaries < ActiveRecord::Migration[5.1]
  def change
    create_table :salaries do |t|
      t.integer :year_id
      t.string :team_id
      t.integer :lg_id
      t.string :player_id
      t.integer :salary

      t.timestamps
    end
  end
end
