class AddUrlToContenidos < ActiveRecord::Migration[5.0]
  def change
    add_column :contenidos, :url, :string
  end
end
