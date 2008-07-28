# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080717142107) do

  create_table "activities", :force => true do |t|
    t.string  "code",         :limit => 3
    t.string  "category",     :limit => 64
    t.string  "title",        :limit => 128
    t.text    "description"
    t.integer "award_total",  :limit => 8
    t.integer "grants_count", :limit => 3
  end

  add_index "activities", ["code"], :name => "index_activities_on_code", :unique => true
  add_index "activities", ["category"], :name => "index_activities_on_category"
  add_index "activities", ["award_total"], :name => "index_activities_on_award_total"
  add_index "activities", ["grants_count"], :name => "index_activities_on_grants_count"

  create_table "grants", :force => true do |t|
    t.integer "organization_id"
    t.integer "investigator_id"
    t.integer "activity_id"
    t.integer "year",            :limit => 2,   :null => false
    t.string  "grant_number",    :limit => 32,  :null => false
    t.string  "project_title",   :limit => 128, :null => false
    t.integer "award",                          :null => false
  end

  add_index "grants", ["organization_id"], :name => "index_grants_on_organization_id"
  add_index "grants", ["investigator_id"], :name => "index_grants_on_investigator_id"
  add_index "grants", ["organization_id", "year", "award"], :name => "index_grants_on_organization_id_and_year_and_award"
  add_index "grants", ["organization_id", "investigator_id"], :name => "index_grants_on_organization_id_and_investigator_id"
  add_index "grants", ["organization_id", "activity_id"], :name => "index_grants_on_organization_id_and_activity_id"
  add_index "grants", ["activity_id"], :name => "index_grants_on_activity_id"
  add_index "grants", ["year", "award"], :name => "index_grants_on_year_and_award"

  create_table "investigators", :force => true do |t|
    t.string  "name",          :limit => 64, :null => false
    t.integer "award_total",                 :null => false
    t.integer "grants_count",  :limit => 2,  :null => false
    t.string  "awarded_years",               :null => false
  end

  add_index "investigators", ["name"], :name => "index_investigators_on_name"
  add_index "investigators", ["award_total"], :name => "index_investigators_on_award_total"
  add_index "investigators", ["grants_count"], :name => "index_investigators_on_grants_count"

  create_table "organizations", :force => true do |t|
    t.string  "name",                :limit => 40, :null => false
    t.string  "city",                :limit => 25
    t.string  "state",               :limit => 14
    t.integer "award_total",         :limit => 8
    t.integer "grants_count",        :limit => 3
    t.string  "awarded_years"
    t.integer "investigators_count", :limit => 2
  end

  add_index "organizations", ["name"], :name => "index_organizations_on_name"
  add_index "organizations", ["city"], :name => "index_organizations_on_city"
  add_index "organizations", ["state"], :name => "index_organizations_on_state"
  add_index "organizations", ["award_total"], :name => "index_organizations_on_award_total"
  add_index "organizations", ["grants_count"], :name => "index_organizations_on_grants_count"

end
