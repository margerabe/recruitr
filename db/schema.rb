# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_211_125_234_931) do
  create_table 'candidates', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.integer 'position_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['position_id'], name: 'index_candidates_on_position_id'
  end

  create_table 'interviews', force: :cascade do |t|
    t.datetime 'start_time'
    t.datetime 'end_time'
    t.integer 'candidate_id', null: false
    t.integer 'recruiter_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['candidate_id'], name: 'index_interviews_on_candidate_id'
    t.index ['recruiter_id'], name: 'index_interviews_on_recruiter_id'
  end

  create_table 'position_skills', force: :cascade do |t|
    t.integer 'position_id', null: false
    t.integer 'skill_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['position_id'], name: 'index_position_skills_on_position_id'
    t.index ['skill_id'], name: 'index_position_skills_on_skill_id'
  end

  create_table 'positions', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'recruiters', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'skills', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'candidates', 'positions'
  add_foreign_key 'interviews', 'candidates'
  add_foreign_key 'interviews', 'recruiters'
  add_foreign_key 'position_skills', 'positions'
  add_foreign_key 'position_skills', 'skills'
end
