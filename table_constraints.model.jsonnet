{
  name: 'snowflake_table_constraints',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'TABLE_CONSTRAINTS' },
  category: 'Snowflake Data-warehouse',
  measures: {
    count: {
      aggregation: 'count',
    },
  },
  dimensions: {
    comment: {
      column: 'COMMENT',
      type: 'string',
    },
    constraint_catalog: {
      column: 'CONSTRAINT_CATALOG',
      type: 'string',
    },
    constraint_name: {
      column: 'CONSTRAINT_NAME',
      type: 'string',
    },
    constraint_schema: {
      column: 'CONSTRAINT_SCHEMA',
      type: 'string',
    },
    constraint_type: {
      column: 'CONSTRAINT_TYPE',
      type: 'string',
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
    table_catalog: {
      column: 'TABLE_CATALOG',
      type: 'string',
    },
    table_name: {
      column: 'TABLE_NAME',
      type: 'string',
    },
    table_schema: {
      column: 'TABLE_SCHEMA',
      type: 'string',
    },
    enforced: {
      column: 'ENFORCED',
      type: 'string',
    },
    initially_deferred: {
      type: 'boolean',
      sql: "CASE WHEN {{TABLE}}.INITIALLY_DEFERRED = 'YES' THEN TRUE ELSE FALSE END",
    },
    is_deferrable: {
      type: 'boolean',
      sql: "CASE WHEN {{TABLE}}.IS_DEFERRABLE = 'YES' THEN TRUE ELSE FALSE END",
    },
  },
}
