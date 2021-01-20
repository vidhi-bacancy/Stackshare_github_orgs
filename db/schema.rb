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

ActiveRecord::Schema.define(version: 2021_01_15_071402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "organizations", force: :cascade do |t|
    t.string "github_login"
    t.bigint "github_id"
    t.string "node_id"
    t.string "url"
    t.string "repos_url"
    t.string "events_url"
    t.string "hooks_url"
    t.string "issues_url"
    t.string "members_url"
    t.string "public_members_url"
    t.string "avatar_url"
    t.text "description"
    t.string "org_name"
    t.string "company"
    t.string "blog"
    t.string "location"
    t.string "email"
    t.string "twitter_username"
    t.boolean "is_verified"
    t.boolean "has_organization_projects"
    t.boolean "has_repository_projects"
    t.bigint "public_repos"
    t.bigint "public_gists"
    t.integer "followers"
    t.integer "following"
    t.string "html_url"
    t.datetime "org_created_at"
    t.datetime "org_updated_at"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
