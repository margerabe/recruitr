# frozen_string_literal: true

class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :position, foreign_key: true

      t.timestamps
    end
  end
end
