class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :file, :null=>false
      t.references :album
    end
  end
end

##use md5