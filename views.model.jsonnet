{
  name: 'snowflake_views',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'VIEWS' },
  category: 'Snowflake Data-warehouse',

  measures: {
    count: {
      aggregation: 'count',
    },
  },
  dimensions: {
    check_option: {
      column: 'CHECK_OPTION',
      type: 'string',
    },
    comment: {
      column: 'COMMENT',
      type: 'string',
    },
    created: {
      column: 'CREATED',
      type: 'timestamp',
    },
    deleted: {
      column: 'DELETED',
      type: 'timestamp',
      timeframes: [],
    },
    last_altered: {
      column: 'LAST_ALTERED',
      type: 'timestamp',
    },
    table_catalog: {
      column: 'TABLE_CATALOG',
      type: 'string',

    },
    insertable_into: {
      sql: "CASE WHEN {{TABLE}}.INSERTABLE_INTO = 'YES' THEN TRUE ELSE FALSE END",
      type: 'boolean',

    },
    is_secure: {
      sql: "CASE WHEN {{TABLE}}.IS_SECURE = 'YES' THEN TRUE ELSE FALSE END",
      type: 'boolean',

    },
    is_updatable: {
      type: 'boolean',
      sql: "CASE WHEN {{TABLE}}.IS_UPDATABLE = 'YES' THEN TRUE ELSE FALSE END",
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
    view_definition: {
      column: 'VIEW_DEFINITION',
      type: 'string',
    },
  },
}
