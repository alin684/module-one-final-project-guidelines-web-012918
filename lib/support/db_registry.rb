require_relative 'connection_adapter'

DBRegistry ||= OpenStruct.new(test: ConnectionAdapter.new("db/lyrics-test.db"),
  development: ConnectionAdapter.new("db/lyrics-development.db"),
  production: ConnectionAdapter.new("db/lyrics-production.db")
  )
