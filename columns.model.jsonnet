{
  name: 'snowflake_columns',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'COLUMNS' },
  category: 'Snowflake Data-warehouse',
  measures: {
    count: {
      aggregation: 'count',
    },
  },
  dimensions: {
    character_maximum_length: {
      column: 'CHARACTER_MAXIMUM_LENGTH',
      type: 'integer',
      description: 'Maximum length in characters of string columns',
    },
    character_octet_length: {
      column: 'CHARACTER_OCTET_LENGTH',
      type: 'integer',
      description: 'Maximum length in bytes of string columns',
    },
    column_default: {
      column: 'COLUMN_DEFAULT',
      type: 'string',
      description: 'Default value of the column',
    },
    column_name: {
      column: 'COLUMN_NAME',
      type: 'string',
      description: 'Name of the column',
    },
    comment: {
      column: 'COMMENT',
      type: 'string',
      description: 'Comment for this column',
    },
    data_type: {
      type: 'string',
      column: 'DATA_TYPE',
    },
    is_identity: {
      type: 'boolean',
      sql: "CASE WHEN {{TABLE}}.IS_IDENTITY = 'YES' THEN TRUE ELSE FALSE END",
    },
    is_nullable: {
      type: 'boolean',
      sql: "CASE WHEN {{TABLE}}.IS_NULLABLE = 'YES' THEN TRUE ELSE FALSE END",
    },
    numeric_precision: {
      column: 'NUMERIC_PRECISION',
      type: 'integer',
      description: 'Numeric precision of numeric columns',
    },
    numeric_precision_radix: {
      column: 'NUMERIC_PRECISION_RADIX',
      type: 'integer',
      description: 'Radix of precision of numeric columns',
    },
    numeric_scale: {
      column: 'NUMERIC_SCALE',
      type: 'string',
      description: 'Scale of numeric columns',
    },
    ordinal_position: {
      column: 'ORDINAL_POSITION',
      type: 'integer',
      description: 'Ordinal position of the column in the table',
    },
    table_schema: {
      column: 'TABLE_SCHEMA',
      type: 'string',
    },
    table_catalog: {
      column: 'TABLE_CATALOG',
      type: 'string',
    },
  },
}
