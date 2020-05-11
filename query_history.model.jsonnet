{
  name: 'snowflake_query_history',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'QUERY_HISTORY' },
  category: 'Snowflake Data-warehouse',

  measures: {
    query_count: {
      aggregation: 'count',
    },
    current_month_query_count: {
      aggregation: 'count',
      filters: [{ dimension: 'start_date', operator: 'between', value: 'P1M', valueType: 'timestamp' }],
    },
    average_execution_time: {
      aggregation: 'average',
      sql: '{{dimension.execution_time}}',
    },
    total_execution_time: {
      aggregation: 'sum',
      sql: '{{dimension.execution_time}}',
    },
    total_queued_overload_time: {
      aggregation: 'sum',
      sql: '{{dimension.queued_overload_time}}',
      filters: [{ dimension: 'has_overload_time', operator: 'is', value: true, valueType: 'boolean' }],
    },
    average_queued_overload_time: {
      aggregation: 'average',
      sql: '1.0*{{dimension.queued_overload_time}}',
      filters: [{ dimension: 'has_overload_time', operator: 'is', value: true, valueType: 'boolean' }],
    },
    total_elapsed_time: {
      aggregation: 'sum',
      sql: '{{dimension.elapsed_time}}',
    },
    total_queued_repair_time: {
      aggregation: 'sum',
      sql: '{{dimension.queued_repair_time}}',
    },
    total_compilation_time: {
      aggregation: 'sum',
      sql: '{{dimension.compilation_time}}',
    },
    total_queued_provisioning_time: {
      aggregation: 'sum',
      sql: '{{dimension.queued_provisioning_time}}',
    },
    total_transaction_blocked_time: {
      aggregation: 'sum',
      sql: '{{dimension.transaction_blocked_time}}',
    },
    current_mtd_avg_exec_time: {
      aggregation: 'average',
      sql: '{{dimension.execution_time}}',
      filters: [{ dimension: 'start_date', operator: 'between', value: 'P1M', valueType: 'timestamp' }],
    },
    prior_mtd_avg_exec_time: {
      aggregation: 'average',
      sql: '{{dimension.execution_time}}',
      filters: [{ dimension: 'is_prior_month_mtd', operator: 'is', value: true, valueType: 'boolean' }],
    },
  },
  dimensions: {
    compilation_time: {
      type: 'long',
      description: 'Compilation time (in milliseconds)',
      column: 'COMPILATION_TIME',
    },
    query_context: {
      hidden: true,
      sql: "PARSE_JSON(regexp_substr(regexp_substr({{TABLE}}.query_text, 'Query\\sContext\\s\\'\\{.*\\}\\''),'\\{.*}'))",
    },
    database_name: {
      type: 'string',
      column: 'DATABASE_NAME',
    },
    end: {
      column: 'END_TIME',
      type: 'timestamp',
    },
    error_code: {
      column: 'ERROR_CODE',
      type: 'integer',
    },
    error_message: {
      type: 'string',
      column: 'ERROR_MESSAGE',
    },
    execution_status: {
      type: 'string',
      column: 'EXECUTION_STATUS',
      description: 'Execution status for the query: success, fail, incident.',
    },
    execution_time: {
      column: 'EXECUTION_TIME',
      type: 'timestamp',
    },
    //    dimension: execution_time_tier {
    //        type: tier
    //        tiers: [1000,2500,5000,10000,25000,50000,100000]
    //      }
    query_id: {
      column: 'QUERY_ID',
      type: 'string',
      description: 'Internal/system-generated identifier for the SQL statement.',
    },
    query_tag: {
      column: 'QUERY_TAG',
      type: 'string',
    },
    query_text: {
      column: 'QUERY_TEXT',
      type: 'string',
    },
    query_type: {
      column: 'QUERY_TYPE',
      type: 'string',
    },
    queued_overload_time: {
      column: 'QUEUED_OVERLOAD_TIME',
      type: 'timestamp',
    },
    has_overload_time: {
      type: 'boolean',
      sql: '{{dimension.queued_overload_time}}>0',
    },
    queued_provisioning_time: {
      type: 'timestamp',
      column: 'QUEUED_PROVISIONING_TIME',
    },
    queued_repair_time: {
      type: 'timestamp',
      column: 'QUEUED_REPAIR_TIME',
    },
    role_name: {
      type: 'string',
      column: 'ROLE_NAME',
    },
    session_id: {
      type: 'integer',
      column: 'SESSION_ID',
    },
    start: {
      column: 'START_TIME',
      type: 'timestamp',
    },
    elapsed_time: {
      column: 'TOTAL_ELAPSED_TIME',
      type: 'integer',
      description: 'Elapsed time (in milliseconds).',
    },
    transaction_blocked_time: {
      column: 'TRANSACTION_BLOCKED_TIME',
      type: 'integer',
      description: 'Time (in milliseconds) spent blocked by a concurrent DML.',
    },
    user_name: {
      column: 'USER_NAME',
      type: 'string',
    },
    warehouse_name: {
      column: 'WAREHOUSE_NAME',
      type: 'string',
    },
    warehouse_size: {
      column: 'WAREHOUSE_SIZE',
      type: 'integer',
    },
    warehouse_type: {
      column: 'WAREHOUSE_TYPE',
      type: 'string',
    },
    is_prior_month_mtd: {
      type: 'boolean',
      sql: 'EXTRACT(month, {{TABLE}}.START_TIME) = EXTRACT(month, current_timestamp()) - 1\n                          and {{TABLE}}.START_TIME <= dateadd(month, -1, current_timestamp())',
    },
  },
}
