{
  name: 'snowflake_login_history',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'LOGIN_HISTORY' },
  mappings: {
    eventTimestamp: 'event_timestamp',
  },
  category: 'Snowflake Data-warehouse',
  measures: {
    logins: {
      aggregation: 'count',
    },
    total_failed_logins: {
      aggregation: 'count',
      filters: [{ dimension: 'is_success', operator: 'is', value: false, valueType: 'boolean' }],
    },
    login_failure_rate: {
      sql: '1.0 * ({{measure.total_failed_logins}} / NULLIF({{measure.logins}},0))',
    },
  },
  dimensions: {
    client_ip: {
      column: 'CLIENT_IP',
      description: 'IP address where the request originated from.',
      type: 'string',
    },
    error_code: {
      column: 'ERROR_CODE',
      type: 'string',
      description: 'Error code, if the request was not successful.',
    },
    error_message: {
      column: 'ERROR_MESSAGE',
      type: 'string',
      description: 'Error message returned to the user, if the request was not successful.',
    },
    event_timestamp: {
      column: 'EVENT_TIMESTAMP',
      type: 'timestamp',
      description: 'Time (in the UTC time zone) of the event occurrence.',
    },
    event_type: {
      column: 'EVENT_TYPE',
      type: 'timestamp',
      description: 'Event type, such as LOGIN for authentication events.',
    },
    first_authentication_factor: {
      column: 'FIRST_AUTHENTICATION_FACTOR',
      type: 'string',
      description: 'Method used to authenticate the user (the first factor, if using multi factor authentication).',
    },
    is_success: {
      type: 'boolean',
      sql: "CASE WHEN {{TABLE}}.IS_SUCCESS = 'YES' THEN TRUE ELSE FALSE END",
      description: 'Whether the user’s request was successful or not.',
    },
    reported_client_type: {
      column: 'REPORTED_CLIENT_TYPE',
      type: 'string',
      description: 'Reported type of the client software, such as JDBC_DRIVER, ODBC_DRIVER, etc. This information is not authenticated.',
    },
    reported_client_version: {
      column: 'REPORTED_CLIENT_VERSION',
      type: 'string',
      description: 'Reported version of the client software. This information is not authenticated.',
    },
    second_authentication_factor: {
      column: 'SECOND_AUTHENTICATION_FACTOR',
      type: 'string',
      description: 'The second factor, if using multi factor authentication, or NULL otherwise.',
    },
    user_name: {
      type: 'string',
      column: 'USER_NAME',
      description: 'User associated with this event.',
    },
    seconds_between_login_attempts: {
      type: 'integer',
      sql: 'timediff(seconds, {{TABLE}}.EVENT_TIMESTAMP, lead({{TABLE}}.EVENT_TIMESTAMP) over(partition by {{dimension.user_name}} order by {{TABLE}}.EVENT_TIMESTAMP)) ',
    },
  },
}
