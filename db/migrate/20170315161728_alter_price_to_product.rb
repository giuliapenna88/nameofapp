class AlterPriceToProduct < ActiveRecord::Migration[5.0]
  def change_column :price, 'integer USING CAST(price AS integer)'
  end
end
