class CreateProjectReviewers < ActiveRecord::Migration[6.0]
  def change
    create_table :project_reviewers do |t|
      t.references :person
      t.string     :name
      t.string     :announcement
      t.text       :description
      t.date       :review_date
      t.references :country
      t.date       :last_date
      t.integer    :status      
      t.timestamps
    end
  end
end
