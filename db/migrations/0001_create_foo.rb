# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:comments) do
      primary_key :id
      String :author
      String :text
    end
  end
  down do
    drop_table(:comments)
  end
end
