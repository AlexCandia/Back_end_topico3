class AddTipoToUsuario < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :tipo, :integer
  end
end
