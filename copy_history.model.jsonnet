{
  name: 'snowflake_copy_history',
  category: 'Snowflake Data-warehouse',
  target: {
    database: 'SNOWFLAKE',
    schema: 'ACCOUNT_USAGE',
    table: 'COPY_HISTORY',
  },
  mappings: {
    eventTimestamp: 'last_load_time',
  },
  dimensions: {
    file_name: {
      label: 'FILE_NAME',
      type: 'string',
      column: 'FILE_NAME',
    },
    stage_location: {
      label: 'STAGE_LOCATION',
      type: 'string',
      column: 'STAGE_LOCATION',
    },
    last_load_time: {
      label: 'LAST_LOAD_TIME',
      type: 'timestamp',
      column: 'LAST_LOAD_TIME',
    },
    row_count: {
      label: 'ROW_COUNT',
      type: 'decimal',
      column: 'ROW_COUNT',
    },
    row_parsed: {
      label: 'ROW_PARSED',
      type: 'decimal',
      column: 'ROW_PARSED',
    },
    file_size: {
      label: 'FILE_SIZE',
      type: 'decimal',
      column: 'FILE_SIZE',
    },
    first_error_message: {
      label: 'FIRST_ERROR_MESSAGE',
      type: 'string',
      column: 'FIRST_ERROR_MESSAGE',
    },
    first_error_line_number: {
      label: 'FIRST_ERROR_LINE_NUMBER',
      type: 'decimal',
      column: 'FIRST_ERROR_LINE_NUMBER',
    },
    first_error_character_pos: {
      label: 'FIRST_ERROR_CHARACTER_POS',
      type: 'decimal',
      column: 'FIRST_ERROR_CHARACTER_POS',
    },
    first_error_column_name: {
      label: 'FIRST_ERROR_COLUMN_NAME',
      type: 'string',
      column: 'FIRST_ERROR_COLUMN_NAME',
    },
    error_count: {
      label: 'ERROR_COUNT',
      type: 'decimal',
      column: 'ERROR_COUNT',
    },
    error_limit: {
      label: 'ERROR_LIMIT',
      type: 'decimal',
      column: 'ERROR_LIMIT',
    },
    status: {
      label: 'STATUS',
      type: 'string',
      column: 'STATUS',
    },
    table_id: {
      label: 'TABLE_ID',
      type: 'decimal',
      column: 'TABLE_ID',
    },
    table_name: {
      label: 'TABLE_NAME',
      type: 'string',
      column: 'TABLE_NAME',
    },
    table_schema_id: {
      label: 'TABLE_SCHEMA_ID',
      type: 'decimal',
      column: 'TABLE_SCHEMA_ID',
    },
    table_schema_name: {
      label: 'TABLE_SCHEMA_NAME',
      type: 'string',
      column: 'TABLE_SCHEMA_NAME',
    },
    table_catalog_id: {
      label: 'TABLE_CATALOG_ID',
      type: 'decimal',
      column: 'TABLE_CATALOG_ID',
    },
    table_catalog_name: {
      label: 'TABLE_CATALOG_NAME',
      type: 'string',
      column: 'TABLE_CATALOG_NAME',
    },
    pipe_catalog_name: {
      label: 'PIPE_CATALOG_NAME',
      type: 'string',
      column: 'PIPE_CATALOG_NAME',
    },
    pipe_schema_name: {
      label: 'PIPE_SCHEMA_NAME',
      type: 'string',
      column: 'PIPE_SCHEMA_NAME',
    },
    pipe_name: {
      label: 'PIPE_NAME',
      type: 'string',
      column: 'PIPE_NAME',
    },
    pipe_received_time: {
      label: 'PIPE_RECEIVED_TIME',
      type: 'timestamp',
      column: 'PIPE_RECEIVED_TIME',
    },
  },
  measures: {
    count_of_rows: {
      aggregation: 'count',
      type: 'double',
    },
    sum_of_row_count: {
      column: 'row_count',
      aggregation: 'sum',
      type: 'double',
    },
    sum_of_row_parsed: {
      column: 'row_parsed',
      aggregation: 'sum',
      type: 'double',
    },
    sum_of_file_size: {
      column: 'file_size',
      aggregation: 'sum',
      type: 'double',
    },
    sum_of_error_count: {
      column: 'error_count',
      aggregation: 'sum',
      type: 'double',
    },
    sum_of_error_limit: {
      column: 'error_limit',
      aggregation: 'sum',
      type: 'double',
    },
  },
}
