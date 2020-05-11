{
  name: 'snowflake_pipe_usage',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'PIPE_USAGE_HISTORY' },
  mappings: {
    eventTimestamp: 'start_time',
  },
  category: 'Snowflake Data-warehouse',
  measures: {
    count: {
      aggregation: 'count',
    },
    total_credits_used: {
      aggregation: 'sum',
      column: 'CREDITS_USED',
    },
    total_credits_used_usd: {
      aggregation: 'sum',
      sql: '{{dimension.credits_used_usd}}',
      reportOptions: {
        suffix: '$',
      },
    },
    total_bytes_inserted: {
      aggregation: 'sum',
      column: 'BYTES_INSERTED',
    },
    total_files_inserted: {
      aggregation: 'sum',
      column: 'FILES_INSERTED',
    },
  },
  dimensions: {
    pipe_name: {
      column: 'PIPE_NAME',
      type: 'string',
      description: 'Name of the pipe used for a data load. Displays NULL if no pipe name is specified in the query. Each row includes the totals for all pipes in use within the time range.',
    },
    bytes_inserted: {
      column: 'BYTES_INSERTED',
      type: 'integer',
      description: 'Number of bytes loaded during the START_TIME and END_TIME window.',
    },
    files_inserted: {
      column: 'FILES_INSERTED',
      description: 'Number of files loaded during the START_TIME and END_TIME window.',
      type: 'integer',
    },
    credits_used: {
      column: 'CREDITS_USED',
      type: 'double',
      description: 'Number of credits billed for Snowpipe data loads during the START_TIME and END_TIME window.',
    },
    credits_used_usd: {
      sql: '{{dimension.credits_used}} * 2.5',
      type: 'double',
      reportOptions: {
        suffix: '$',
      },
    },
    start_time: {
      column: 'START_TIME',
      type: 'timestamp',
    },
    end_time: {
      column: 'START_TIME',
      type: 'timestamp',
    },
  },
}
