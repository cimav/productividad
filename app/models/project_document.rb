class ProjectDocument < ApplicationRecord
  belongs_to :person  
  belongs_to :project 
  belongs_to :parent_document, foreign_key: 'parent', class_name: 'ProjectDocument', optional: true 
  has_one_attached :file
  has_rich_text :content



  ACTIVE = 1
  DELETED = 99

  FOLDER       = 1
  UPLOAD       = 2
  DOCUMENT     = 3
  GOOGLE_DOC   = 4
  GOOGLE_SHEET = 5
  GOOGLE_SLIDE = 6
  GOOGLE_OTHER = 7

  DOC_TYPES = {
  	FOLDER       => "Carpeta",
  	DOCUMENT     => "Documento",
    UPLOAD       => "Archivo",
    GOOGLE_DOC   => "Google Doc",
    GOOGLE_SHEET => "Google Sheet",
    GOOGLE_SLIDE => "Google Slide",
    GOOGLE_OTHER => "Google Other"
  }

  def file_type_text
  	DOC_TYPES[file_type]
  end

end
