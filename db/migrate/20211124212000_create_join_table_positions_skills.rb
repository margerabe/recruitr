class CreateJoinTablePositionsSkills < ActiveRecord::Migration[6.1]
  def change
    create_join_table :positions, :skills do |t|
      t.index :position_id
      t.index :skill_id
    end
  end
end
