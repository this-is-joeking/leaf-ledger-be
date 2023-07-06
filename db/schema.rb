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

ActiveRecord::Schema[7.0].define(version: 20_230_613_191_803) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'plants', force: :cascade do |t|
    t.string 'scientific_name'
    t.string 'common_name'
    t.string 'sun_exposure'
    t.string 'planting_time'
    t.string 'planting_method'
    t.string 'watering'
    t.string 'fertilization'
    t.string 'pruning'
    t.string 'harvest_timeline'
    t.string 'harvest_method'
    t.string 'pests'
    t.string 'homeopathic_remedies'
    t.string 'spacing'
    t.string 'other_notes'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'user_plants', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'plant_id', null: false
    t.string 'user_notes'
    t.date 'date_planted'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['plant_id'], name: 'index_user_plants_on_plant_id'
    t.index ['user_id'], name: 'index_user_plants_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'user_plants', 'plants'
  add_foreign_key 'user_plants', 'users'
end
