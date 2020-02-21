class ProductFile < ApplicationRecord
  belongs_to :attachable, polymorphic: true 
  belongs_to :person, optional: true

  mount_uploader :file, ProductFileUploader

  ACTIVE  = 1
  DELETED = 2

  PROBATORY = 1
  OTHER     = 2
  PRIVATE   = 3

  TYPES = {
    OTHER     => 'Otro Documento',
    PROBATORY => 'Documento Probatorio',
    PRIVATE => 'Documento Privado'
  }

  def type_text
    TYPES[file_type]
  end

  def delete_linked_file
    self.remove_file!
  end
end
