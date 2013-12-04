class Attachment < ActiveRecord::Base
  belongs_to :post

  PATH_IMAGENES = File.join Rails.root,"public","archivos"

  def photo=(archivo)
  	unless archivo.blank?
  		@archivo = archivo
  		self.nombre = archivo.original_filename
  		self.extension = archivo.original_filename.split(".").last.downcase
  	end
  end

  def path_imagen
  	File.join PATH_IMAGENES, "#{self.id}.#{self.extension}"
  end

  def tiene_imagen?
  	File.exists? path_imagen
  end

  private
  def guardar_imagen
  	if @archivo
  		FileUtils.mkdir_p PATH_IMAGENES
  		File.open(path_imagen, "wb") do |f|
  			f.write(@archivo.read)
  		end
  		@archivo.nil
  	end
  end
end
