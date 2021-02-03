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

ActiveRecord::Schema.define(version: 2021_02_03_061206) do

  create_table "00_aux_art_part", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "correo", collation: "latin1_swedish_ci"
    t.string "titulo", collation: "latin1_swedish_ci"
  end

  create_table "00_integra_revistas", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "integra_nombre"
    t.string "regular_nombre"
  end

  create_table "00_jcr_2019", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "ranking"
    t.text "journal"
    t.text "vacio"
    t.text "cites"
    t.text "impact_factor"
    t.text "eigen_factor"
  end

  create_table "00_numbers", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "n"
  end

  create_table "00_open_journals", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "name"
    t.text "url"
    t.text "alternative_name"
    t.text "issn"
    t.text "eissn"
    t.text "publisher"
    t.text "country"
    t.text "keywords"
    t.text "language"
    t.text "subject"
  end

  create_table "00_wos_categories", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "cat", size: :long
  end

  create_table "00_wos_journals", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "title"
    t.text "issn"
    t.text "eissn"
    t.text "publisher"
    t.text "address"
    t.text "lang"
    t.text "categories"
  end

  create_table "acknowledgments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
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

  create_table "action_text_rich_texts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "body", size: :long
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activity_logs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "item_id"
    t.string "item_type"
    t.text "message"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "changed_values"
    t.integer "person_id"
  end

  create_table "announcements", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id"
    t.string "name"
    t.date "end_date"
    t.string "ammount"
    t.string "url"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_announcements_on_person_id"
  end

  create_table "association_members", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "association_id"
    t.bigint "person_id"
    t.date "start_date"
    t.date "end_date"
    t.text "activities"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "last_date"
    t.index ["association_id"], name: "index_association_members_on_association_id"
    t.index ["person_id"], name: "index_association_members_on_person_id"
  end

  create_table "associations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "location"
    t.boolean "is_international"
    t.bigint "country_id"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "submitted_by"
    t.integer "validated"
    t.index ["country_id"], name: "index_associations_on_country_id"
  end

  create_table "awards", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id"
    t.string "name"
    t.integer "award_type"
    t.string "granted_by"
    t.date "grant_date"
    t.date "last_date"
    t.bigint "country_id"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_awards_on_country_id"
    t.index ["person_id"], name: "index_awards_on_person_id"
  end

  create_table "books", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.string "authors"
    t.integer "book_type"
    t.integer "publisher"
    t.boolean "is_refereed"
    t.bigint "country_id", null: false
    t.integer "status"
    t.date "sent_date"
    t.date "accepted_date"
    t.date "published_date"
    t.string "pages"
    t.string "isbn"
    t.bigint "person_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "last_date"
    t.index ["country_id"], name: "index_books_on_country_id"
    t.index ["person_id"], name: "index_books_on_person_id"
  end

  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "lat"
    t.integer "long"
    t.integer "status"
    t.bigint "country_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "conference_papers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.date "sent_date"
    t.date "accepted_date"
    t.date "published_date"
    t.bigint "conference_id"
    t.string "authors"
    t.text "abstract"
    t.bigint "person_id"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "last_date"
    t.index ["conference_id"], name: "index_conference_papers_on_conference_id"
    t.index ["person_id"], name: "index_conference_papers_on_person_id"
  end

  create_table "conference_works", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.integer "work_type"
    t.date "sent_date"
    t.date "accepted_date"
    t.date "published_date"
    t.bigint "conference_id"
    t.string "authors"
    t.bigint "person_id"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "last_date"
    t.index ["conference_id"], name: "index_conference_works_on_conference_id"
    t.index ["person_id"], name: "index_conference_works_on_person_id"
  end

  create_table "conferences", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "place"
    t.bigint "country_id"
    t.date "start_date"
    t.date "end_date"
    t.string "organizer"
    t.boolean "is_international"
    t.boolean "is_refereed"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "submitted_by"
    t.integer "validated"
    t.index ["country_id"], name: "index_conferences_on_country_id"
  end

  create_table "countries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "lat"
    t.integer "long"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "english_name"
    t.string "code3"
    t.string "phone_code"
  end

  create_table "degrees", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "departments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.bigint "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "person_id"
    t.integer "department_id", default: 1
    t.boolean "is_scientific"
    t.index ["organization_id"], name: "index_departments_on_organization_id"
  end

  create_table "documents", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
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

  create_table "educations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.integer "degree_id"
    t.bigint "organization_id"
    t.string "faculty"
    t.integer "start_year"
    t.integer "end_year"
    t.bigint "person_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.index ["organization_id"], name: "index_educations_on_organization_id"
    t.index ["person_id"], name: "index_educations_on_person_id"
  end

  create_table "event_organizers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "organizer_type"
    t.text "activity"
    t.date "last_date"
    t.bigint "conference_id"
    t.bigint "person_id"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conference_id"], name: "index_event_organizers_on_conference_id"
    t.index ["person_id"], name: "index_event_organizers_on_person_id"
  end

  create_table "experience_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "experiences", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.integer "experience_type_id"
    t.string "company"
    t.string "location"
    t.date "start_date"
    t.date "end_date"
    t.bigint "person_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.text "description"
    t.index ["person_id"], name: "index_experiences_on_person_id"
  end

  create_table "gantt_links", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "project_id"
    t.integer "source"
    t.integer "target"
    t.string "link_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_gantt_links_on_project_id"
  end

  create_table "gantt_tasks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "person_id"
    t.string "text"
    t.datetime "start_date"
    t.integer "duration"
    t.integer "parent"
    t.decimal "progress", precision: 10
    t.integer "sortorder"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_gantt_tasks_on_person_id"
    t.index ["project_id"], name: "index_gantt_tasks_on_project_id"
  end

  create_table "indexers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invited_conferences", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.date "conference_date"
    t.date "last_date"
    t.bigint "conference_id"
    t.bigint "person_id"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conference_id"], name: "index_invited_conferences_on_conference_id"
    t.index ["person_id"], name: "index_invited_conferences_on_person_id"
  end

  create_table "journal_article_reviewers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id"
    t.string "name"
    t.string "title"
    t.text "authors"
    t.date "review_date"
    t.bigint "journal_id"
    t.date "last_date"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["journal_id"], name: "index_journal_article_reviewers_on_journal_id"
    t.index ["person_id"], name: "index_journal_article_reviewers_on_person_id"
  end

  create_table "journal_articles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.date "sent_date"
    t.date "accepted_date"
    t.date "published_date"
    t.bigint "journal_id", null: false
    t.text "authors"
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
    t.text "notes"
    t.index ["journal_id"], name: "index_journal_articles_on_journal_id"
    t.index ["person_id"], name: "index_journal_articles_on_person_id"
  end

  create_table "journal_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "journal_impact_factors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "journal_id", null: false
    t.integer "year"
    t.string "impact_factor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "eigen_factor"
    t.index ["journal_id"], name: "index_journal_impact_factors_on_journal_id"
  end

  create_table "journal_indices", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "journal_id", null: false
    t.bigint "indexer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["indexer_id"], name: "index_journal_indices_on_indexer_id"
    t.index ["journal_id"], name: "index_journal_indices_on_journal_id"
  end

  create_table "journal_journal_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "journal_id"
    t.bigint "journal_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["journal_category_id"], name: "index_journal_journal_categories_on_journal_category_id"
    t.index ["journal_id"], name: "index_journal_journal_categories_on_journal_id"
  end

  create_table "journals", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
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
    t.integer "submitted_by"
    t.integer "validated"
    t.text "publisher"
    t.text "publisher_address"
    t.text "language"
    t.text "wos_categories"
    t.boolean "is_open_access"
    t.index ["country_id"], name: "index_journals_on_country_id"
  end

  create_table "organizations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
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

  create_table "patents", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.date "register_date"
    t.string "authors"
    t.bigint "person_id"
    t.integer "status"
    t.date "last_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_patents_on_person_id"
  end

  create_table "people", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
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
    t.bigint "person_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "identificator"
    t.integer "person_type_id"
    t.text "about"
    t.index ["department_id"], name: "index_people_on_department_id"
    t.index ["organization_id"], name: "index_people_on_organization_id"
    t.index ["person_id"], name: "index_people_on_person_id"
  end

  create_table "person_research_lines", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "research_line_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_person_research_lines_on_person_id"
    t.index ["research_line_id"], name: "index_person_research_lines_on_research_line_id"
  end

  create_table "person_roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_person_roles_on_person_id"
    t.index ["role_id"], name: "index_person_roles_on_role_id"
  end

  create_table "person_topics", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_person_topics_on_person_id"
    t.index ["topic_id"], name: "index_person_topics_on_topic_id"
  end

  create_table "person_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "popular_sciences", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id"
    t.string "name"
    t.integer "activity_type"
    t.text "description"
    t.string "location"
    t.bigint "country_id"
    t.date "start_date"
    t.date "end_date"
    t.date "last_date"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_popular_sciences_on_country_id"
    t.index ["person_id"], name: "index_popular_sciences_on_person_id"
  end

  create_table "product_cites", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "attachable_id"
    t.string "attachable_type"
    t.bigint "journal_article_id"
    t.bigint "journal_id", null: false
    t.string "title"
    t.string "authors"
    t.string "volume"
    t.string "issue"
    t.string "pages"
    t.date "published_date"
    t.string "doi"
    t.bigint "person_id"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["journal_article_id"], name: "index_product_cites_on_journal_article_id"
    t.index ["journal_id"], name: "index_product_cites_on_journal_id"
    t.index ["person_id"], name: "index_product_cites_on_person_id"
  end

  create_table "product_files", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "attachable_id"
    t.string "attachable_type"
    t.string "file"
    t.integer "file_type"
    t.bigint "person_id"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.index ["person_id"], name: "index_product_files_on_person_id"
  end

  create_table "product_participants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
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

  create_table "project_documents", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "project_id"
    t.integer "file_type"
    t.integer "parent"
    t.string "name"
    t.string "url"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_project_documents_on_person_id"
    t.index ["project_id"], name: "index_project_documents_on_project_id"
  end

  create_table "project_messages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "project_id"
    t.string "title"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_project_messages_on_person_id"
    t.index ["project_id"], name: "index_project_messages_on_project_id"
  end

  create_table "project_participants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "person_id"
    t.integer "participation"
    t.integer "role_type"
    t.integer "participant_type"
    t.string "role"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_project_participants_on_person_id"
    t.index ["project_id"], name: "index_project_participants_on_project_id"
  end

  create_table "project_reviewers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id"
    t.string "name"
    t.string "announcement"
    t.text "description"
    t.date "review_date"
    t.bigint "country_id"
    t.date "last_date"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_project_reviewers_on_country_id"
    t.index ["person_id"], name: "index_project_reviewers_on_person_id"
  end

  create_table "project_status_changes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "project_id"
    t.integer "from"
    t.integer "to"
    t.date "change_date"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_project_status_changes_on_person_id"
    t.index ["project_id"], name: "index_project_status_changes_on_project_id"
  end

  create_table "project_task_lists", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "person_id"
    t.string "name"
    t.integer "position"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_project_task_lists_on_person_id"
    t.index ["project_id"], name: "index_project_task_lists_on_project_id"
  end

  create_table "project_tasks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "project_task_list_id"
    t.bigint "person_id"
    t.string "name"
    t.integer "position"
    t.integer "assigned_to"
    t.integer "done"
    t.date "done_date"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_project_tasks_on_person_id"
    t.index ["project_task_list_id"], name: "index_project_tasks_on_project_task_list_id"
  end

  create_table "projects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id"
    t.string "name"
    t.string "external_identificator"
    t.string "internal_identificator"
    t.integer "source_type"
    t.string "source"
    t.integer "research_type"
    t.date "start_date"
    t.date "end_date"
    t.date "extension_date"
    t.date "last_date"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_projects_on_person_id"
  end

  create_table "prospect_participants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "prospect_id"
    t.bigint "person_id"
    t.integer "suggested_by"
    t.text "suggester_comments"
    t.text "suggested_comments"
    t.integer "participant_type"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_prospect_participants_on_person_id"
    t.index ["prospect_id"], name: "index_prospect_participants_on_prospect_id"
  end

  create_table "prospect_status_changes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "prospect_id"
    t.integer "from"
    t.integer "to"
    t.date "change_date"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_prospect_status_changes_on_person_id"
    t.index ["prospect_id"], name: "index_prospect_status_changes_on_prospect_id"
  end

  create_table "prospects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id"
    t.string "subject"
    t.string "organization"
    t.string "contact"
    t.integer "decision_type"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.bigint "country_id"
    t.string "source"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "contact_date"
    t.index ["country_id"], name: "index_prospects_on_country_id"
    t.index ["person_id"], name: "index_prospects_on_person_id"
  end

  create_table "relevant_activities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id"
    t.string "name"
    t.integer "activity_type"
    t.text "description"
    t.string "location"
    t.bigint "country_id"
    t.date "start_date"
    t.date "end_date"
    t.date "last_date"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_relevant_activities_on_country_id"
    t.index ["person_id"], name: "index_relevant_activities_on_person_id"
  end

  create_table "research_groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_research_groups_on_department_id"
  end

  create_table "research_lines", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "department_id"
  end

  create_table "research_sub_groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "research_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["research_group_id"], name: "index_research_sub_groups_on_research_group_id"
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "identificator"
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "topics", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
  end

  create_table "working_group_members", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "working_group_id"
    t.bigint "working_group_role_id"
    t.text "activities"
    t.date "start_date"
    t.date "end_date"
    t.date "last_date"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_working_group_members_on_person_id"
    t.index ["working_group_id"], name: "index_working_group_members_on_working_group_id"
    t.index ["working_group_role_id"], name: "index_working_group_members_on_working_group_role_id"
  end

  create_table "working_group_roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.bigint "working_group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["working_group_id"], name: "index_working_group_roles_on_working_group_id"
  end

  create_table "working_groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.bigint "person_id"
    t.bigint "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_working_groups_on_organization_id"
    t.index ["person_id"], name: "index_working_groups_on_person_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "books", "countries"
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
  add_foreign_key "people", "people"
  add_foreign_key "person_research_lines", "people"
  add_foreign_key "person_research_lines", "research_lines"
  add_foreign_key "person_roles", "people"
  add_foreign_key "person_roles", "roles"
  add_foreign_key "person_topics", "people"
  add_foreign_key "person_topics", "topics"
  add_foreign_key "research_groups", "departments"
  add_foreign_key "research_sub_groups", "research_groups"
end
