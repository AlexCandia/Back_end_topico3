class AddCorreoToUsuario < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :correo, :string
  end
end
