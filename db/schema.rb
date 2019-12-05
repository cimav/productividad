# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_05_223925) do

  create_table "acknowledgments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "attachable_id"
    t.string "attachable_type"
    t.bigint "person_id"
    t.integer "position"
    t.string "notes"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_acknowledgments_on_person_id"
  end

  create_table "activity_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "item_id"
    t.string "item_type"
    t.text "message"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "changed_values"
    t.integer "person_id"
  end

  create_table "cities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "lat"
    t.integer "long"
    t.integer "status"
    t.bigint "country_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "lat"
    t.integer "long"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "departments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.bigint "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_departments_on_organization_id"
  end

  create_table "documents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "attachable_id"
    t.string "attachable_type"
    t.bigint "user_id"
    t.integer "file_type"
    t.string "description"
    t.string "file"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "indexers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "journal_articles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title"
    t.date "sent_date"
    t.date "accepted_date"
    t.date "published_date"
    t.bigint "journal_id", null: false
    t.string "authors"
    t.string "volume"
    t.string "issue"
    t.string "pages"
    t.string "doi"
    t.text "abstract"
    t.bigint "person_id"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "last_date"
    t.date "rejected_date"
    t.index ["journal_id"], name: "index_journal_articles_on_journal_id"
    t.index ["person_id"], name: "index_journal_articles_on_person_id"
  end

  create_table "journal_impact_factors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "journal_id", null: false
    t.integer "year"
    t.string "impact_factor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["journal_id"], name: "index_journal_impact_factors_on_journal_id"
  end

  create_table "journal_indices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "journal_id", null: false
    t.bigint "indexer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["indexer_id"], name: "index_journal_indices_on_indexer_id"
    t.index ["journal_id"], name: "index_journal_indices_on_journal_id"
  end

  create_table "journals", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.boolean "is_refereed"
    t.boolean "is_international"
    t.boolean "is_indexed"
    t.string "issn"
    t.string "e_issn"
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_journals_on_country_id"
  end

  create_table "organizations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "email"
    t.string "address1"
    t.string "address2"
    t.text "description"
    t.integer "lat"
    t.integer "long"
    t.integer "status"
    t.bigint "city_id"
    t.bigint "country_id"
    t.bigint "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "domain"
    t.string "shortname"
    t.index ["city_id"], name: "index_organizations_on_city_id"
    t.index ["country_id"], name: "index_organizations_on_country_id"
    t.index ["organization_id"], name: "index_organizations_on_organization_id"
  end

  create_table "people", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.integer "has_changed"
    t.integer "status"
    t.bigint "organization_id"
    t.bigint "department_id"
    t.bigint "people_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "identificator"
    t.integer "person_type_id"
    t.index ["department_id"], name: "index_people_on_department_id"
    t.index ["organization_id"], name: "index_people_on_organization_id"
    t.index ["people_id"], name: "index_people_on_people_id"
  end

  create_table "person_roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_person_roles_on_person_id"
    t.index ["role_id"], name: "index_person_roles_on_role_id"
  end

  create_table "person_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_participants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "attachable_id"
    t.string "attachable_type"
    t.bigint "person_id"
    t.integer "participation"
    t.integer "position"
    t.integer "participant_type"
    t.string "author_is"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_product_participants_on_person_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "identificator"
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cities", "countries"
  add_foreign_key "departments", "organizations"
  add_foreign_key "journal_articles", "journals"
  add_foreign_key "journal_impact_factors", "journals"
  add_foreign_key "journal_indices", "indexers"
  add_foreign_key "journal_indices", "journals"
  add_foreign_key "journals", "countries"
  add_foreign_key "organizations", "cities"
  add_foreign_key "organizations", "countries"
  add_foreign_key "organizations", "organizations"
  add_foreign_key "people", "departments"
  add_foreign_key "people", "organizations"
  add_foreign_key "people", "people", column: "people_id"
  add_foreign_key "person_roles", "people"
  add_foreign_key "person_roles", "roles"
end
