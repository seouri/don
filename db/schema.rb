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
    t.string  "category"
    t.string  "title"
    t.text    "description"
    t.integer "award_total",  :limit => 8
    t.integer "grants_count"
  end

  add_index "activities", ["code"], :name => "index_activities_on_code", :unique => true
  add_index "activities", ["category"], :name => "index_activities_on_category"
  add_index "activities", ["award_total"], :name => "index_activities_on_award_total"
  add_index "activities", ["grants_count"], :name => "index_activities_on_grants_count"

  create_table "grants", :force => true do |t|
    t.integer "organization_id"
    t.integer "investigator_id"
    t.integer "activity_id"
    t.integer "year"
    t.string  "grant_number"
    t.string  "project_title"
    t.integer "award"
  end

  add_index "grants", ["organization_id"], :name => "index_grants_on_organization_id"
  add_index "grants", ["investigator_id"], :name => "index_grants_on_investigator_id"
  add_index "grants", ["activity_id"], :name => "index_grants_on_activity_id"
  add_index "grants", ["year"], :name => "index_grants_on_year"
  add_index "grants", ["grant_number"], :name => "index_grants_on_grant_number"
  add_index "grants", ["project_title"], :name => "index_grants_on_project_title"
  add_index "grants", ["award"], :name => "index_grants_on_award"
  add_index "grants", ["year", "award"], :name => "index_grants_on_year_and_award"

  create_table "investigators", :force => true do |t|
    t.string  "name"
    t.integer "award_total"
    t.integer "grants_count"
    t.string  "awarded_years"
  end

  add_index "investigators", ["name"], :name => "index_investigators_on_name"
  add_index "investigators", ["award_total"], :name => "index_investigators_on_award_total"
  add_index "investigators", ["grants_count"], :name => "index_investigators_on_grants_count"

  create_table "organizations", :force => true do |t|
    t.string  "name"
    t.string  "city"
    t.string  "state"
    t.integer "award_total",         :limit => 8
    t.integer "grants_count"
    t.string  "awarded_years"
    t.integer "investigators_count"
  end

  add_index "organizations", ["name"], :name => "index_organizations_on_name"
  add_index "organizations", ["city"], :name => "index_organizations_on_city"
  add_index "organizations", ["state"], :name => "index_organizations_on_state"
  add_index "organizations", ["award_total"], :name => "index_organizations_on_award_total"
  add_index "organizations", ["grants_count"], :name => "index_organizations_on_grants_count"

end
