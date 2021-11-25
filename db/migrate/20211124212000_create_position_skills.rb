class CreatePositionSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :position_skills do |t|
      t.references :position, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
