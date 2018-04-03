Hanami::Model.migration do
  change do
    add_column :links, :clicks, Integer, default: 0
  end
end
