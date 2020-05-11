{
  name: 'snowflake_databases',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'DATABASES' },
  category: 'Snowflake Data-warehouse',
  measures: {
    count: {
      aggregation: 'count',
    },
  },
  dimensions: {
    comment: {
      column: 'COMMENT',
      description: 'Comment for this database',
      type: 'string',
    },
    created: {
      column: 'CREATED',
      type: 'timestamp',
    },
    database_name: {
      column: 'DATABASE_NAME',
      type: 'string',
    },
    database_owner: {
      column: 'DATABASE_OWNER',
      type: 'string',
    },
    is_transient: {
      type: 'string',
      description: 'Whether this is a transient database',
      column: 'IS_TRANSIENT',
    },
    last_altered: {
      column: 'LAST_ALTERED',
      type: 'timestamp',
      description: 'Last altered time of the database',
    },
  },
}
