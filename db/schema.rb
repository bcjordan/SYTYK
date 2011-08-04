# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110804185508) do

  create_table "answers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "beens", :force => true do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.integer  "rating"
    t.boolean  "yes"
    t.boolean  "no"
    t.boolean  "want"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", :force => true do |t|
    t.string   "name"
    t.string   "location_name"
    t.decimal  "lat",           :precision => 10, :scale => 6
    t.decimal  "lng",           :precision => 10, :scale => 6
    t.string   "url"
    t.string   "image_url"
    t.string   "category"
    t.integer  "location_id"
    t.integer  "num_reviews"
    t.integer  "ranking"
    t.decimal  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "json"
  end

  create_table "questions", :force => true do |t|
    t.string   "question"
    t.text     "options"
    t.integer  "answer"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", :force => true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "stars",         :null => false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], :name => "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], :name => "index_rates_on_rater_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "uid"
    t.string   "pic_square_with_logo"
    t.string   "profile_url"
    t.integer  "level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "wrong"
    t.text     "right"
    t.text     "want_to_go"
  end

  create_table "users_questions", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "question_id"
  end

end
