{
  name: 'snowflake_load_history',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'LOAD_HISTORY' },
  category: 'Snowflake Data-warehouse',
  measures: {
    total_row_count: {
      aggregation: 'sum',
      sql: '{{dimension.row_count}}',
    },
    total_error_count: {
      aggregation: 'sum',
      sql: '{{dimension.error_count}}',
    },
    count: {
      aggregation: 'count',
    },
  },
  dimensions: {
    table_name: {
      column: 'TABLE_NAME',
      type: 'string',
    },
    schema_name: {
      column: 'SCHEMA_NAME',
      type: 'string',
    },
    file_name: {
      column: 'FILE_NAME',
      type: 'string',
    },
    last_load_time: {
      column: 'LAST_LOAD_TIME',
      type: 'timestamp',
    },
    status: {
      column: 'STATUS',
      type: 'string',
    },
    row_count: {
      column: 'ROW_COUNT',
      type: 'integer',
    },
    row_parsed: {
      column: 'ROW_PARSED',
      type: 'integer',
    },
    first_error_message: {
      column: 'FIRST_ERROR_MESSAGE',
      type: 'string',
    },
    first_error_line_number: {
      column: 'FIRST_ERROR_LINE_NUMBER',
      type: 'integer',
    },
    first_error_character_position: {
      column: 'FIRST_ERROR_CHARACTER_POSITION',
      type: 'integer',
    },
    first_error_col_name: {
      column: 'FIRST_ERROR_COL_NAME',
      type: 'string',
    },
    error_count: {
      column: 'ERROR_COUNT',
      type: 'integer',
    },
    error_limit: {
      column: 'ERROR_LIMIT',
      type: 'integer',
    },
  },
}
