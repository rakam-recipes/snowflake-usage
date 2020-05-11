{
  name: 'snowflake_tables',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'TABLES' },
  category: 'Snowflake Data-warehouse',

  measures: {
    count: {
      aggregation: 'count',
    },
  },
  dimensions: {
    bytes: {
      column: 'BYTES',
      type: 'long',
    },
    clustering_key: {
      type: 'string',
      column: 'CLUSTERING_KEY',
    },
    comment: {
      type: 'string',
      column: 'COMMENT',
    },
    commit_action: {
      type: 'string',
      column: 'COMMIT_ACTION',
    },
    created: {
      column: 'CREATED',
      type: 'timestamp',
    },
    deleted: {
      column: 'DELETED',
      type: 'timestamp',
    },
    last_altered: {
      column: 'LAST_ALTERED',
      type: 'timestamp',
    },
    is_insertable_into: {
      sql: "CASE WHEN {{TABLE}}.IS_INSERTABLE_INTO = 'YES' THEN TRUE ELSE FALSE END",
      type: 'boolean',
    },
    is_transient: {
      sql: "CASE WHEN {{TABLE}}.IS_TRANSIENT = 'YES' THEN TRUE ELSE FALSE END",
      type: 'boolean',
    },
    is_typed: {
      sql: "CASE WHEN {{TABLE}}.IS_TYPED = 'YES' THEN TRUE ELSE FALSE END",
      type: 'boolean',
    },
    reference_generation: {
      column: 'REFERENCE_GENERATION',
      type: 'string',
    },
    row_count: {
      column: 'ROW_COUNT',
      type: 'integer',
    },
    self_referencing_column_name: {
      column: 'SELF_REFERENCING_COLUMN_NAME',
      type: 'string',
    },
    table_catalog: {
      column: 'TABLE_CATALOG',
      type: 'string',
    },
    table_name: {
      column: 'TABLE_NAME',
      type: 'string',
    },
    table_owner: {
      column: 'TABLE_OWNER',
      type: 'string',
    },
    table_schema: {
      column: 'TABLE_SCHEMA',
      type: 'string',
    },
    table_type: {
      column: 'TABLE_TYPE',
      type: 'string',
    },
    user_defined_type_name: {
      column: 'USER_DEFINED_TYPE_NAME',
      type: 'string',
    },
    user_defined_catalog_type: {
      column: 'USER_DEFINED_TYPE_CATALOG',
      type: 'string',
    },
    user_defined_schema_type: {
      column: 'USER_DEFINED_TYPE_SCHEMA',
      type: 'string',
    },
  },
}
