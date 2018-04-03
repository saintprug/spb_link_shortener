Hanami::Model.migration do
  change do
    create_table :links do
      primary_key :id

      column :key, String
      column :url, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
