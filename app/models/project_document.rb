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
    GOOGLE_DOC   => "Doc",
    GOOGLE_SHEET => "Sheet",
    GOOGLE_SLIDE => "Slide",
    GOOGLE_OTHER => "Otro"
  }

  ICONS = {

  }

  def file_type_text
  	DOC_TYPES[file_type]
  end

  def file_type_icon 
    case file_type
      when GOOGLE_DOC 
        "icons/google-doc.svg"
      when GOOGLE_SHEET
        "icons/google-sheet.svg"
      when GOOGLE_SLIDE
        "icons/google-slide.svg"
      when GOOGLE_OTHER
        "icons/google-other.svg"
      else
        case File.extname(name)
          when ".xlsx" || ".xls"
            "icons/xls.svg"
          when ".docx" || ".doc"
            "icons/doc.svg"
          when ".pptx" || ".ppt"
            "icons/ppt.svg"
          else 
            "icons/file.svg"
        end
    end  
  end

end
