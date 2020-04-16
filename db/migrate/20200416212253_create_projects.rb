class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.references :person
      t.string     :name
      t.string     :external_identificator
      t.string     :internal_identificator
      t.integer    :source_type
      t.string     :source
      t.text       :objectives
      t.text       :results
      t.integer    :research_type
      t.date       :start_date
      t.date       :end_date
      t.date       :extension_date	
      t.date       :last_date
      t.integer    :status
      t.timestamps
    end
  end
end
