class CreateInterviews < ActiveRecord::Migration[6.1]
  def change
    create_table :interviews do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :candidate, null: false, foreign_key: true
      t.references :recruiter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
