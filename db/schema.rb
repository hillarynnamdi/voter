# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160407182009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "admins", ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true, using: :btree
  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["invitation_token"], name: "index_admins_on_invitation_token", unique: true, using: :btree
  add_index "admins", ["invitations_count"], name: "index_admins_on_invitations_count", using: :btree
  add_index "admins", ["invited_by_id"], name: "index_admins_on_invited_by_id", using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  add_index "admins", ["unlock_token"], name: "index_admins_on_unlock_token", unique: true, using: :btree

  create_table "aspirants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "political_ambition"
    t.integer  "subscription_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image"
    t.string   "position"
    t.string   "statement"
    t.string   "level"
    t.integer  "number_of_votes"
  end

  add_index "aspirants", ["subscription_id"], name: "index_aspirants_on_subscription_id", using: :btree

  create_table "casters", force: :cascade do |t|
    t.string   "president"
    t.string   "vice_president"
    t.string   "secretary_general"
    t.string   "financial_secretary"
    t.string   "pro"
    t.integer  "subscription_id"
    t.string   "voter_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "dos"
    t.string   "welfare"
    t.string   "asg"
    t.string   "firstprov"
    t.string   "secondprov"
    t.string   "treasurer"
    t.string   "dosocial"
    t.string   "dos_name"
    t.string   "welfare_name"
    t.string   "asg_name"
    t.string   "firstprov_name"
    t.string   "secondprov_name"
    t.string   "treasurer_name"
    t.string   "dosocial_name"
    t.string   "president_name"
    t.string   "vice_president_name"
    t.string   "financial_secretary_name"
    t.string   "pro_name"
    t.string   "secretary_general_name"
  end

  add_index "casters", ["subscription_id"], name: "index_casters_on_subscription_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "email",                   default: "chrisgeeq@gmail.com", null: false
    t.string   "encrypted_password",      default: "password1"
    t.string   "reg_no",                  default: "",                    null: false
    t.string   "phone_no",                default: "",                    null: false
    t.integer  "sign_in_count",           default: 0,                     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.string   "authy_id"
    t.datetime "last_sign_in_with_authy"
    t.boolean  "authy_enabled",           default: true
  end

  add_index "students", ["authy_id"], name: "index_students_on_authy_id", using: :btree
  add_index "students", ["reg_no"], name: "index_students_on_reg_no", unique: true, using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.string   "account_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "timer"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "reg_no"
    t.string   "phone_no"
    t.integer  "subscription_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "email"
    t.string   "encrypted_password"
    t.boolean  "has_voted",               default: false
    t.boolean  "has_received_token",      default: false
    t.boolean  "has_received_thanks_msg", default: false
    t.string   "unencrypted_password"
    t.string   "sent_token"
    t.string   "sent_thanks"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["subscription_id"], name: "index_users_on_subscription_id", using: :btree

  add_foreign_key "aspirants", "subscriptions"
  add_foreign_key "casters", "subscriptions"
  add_foreign_key "users", "subscriptions"
end
