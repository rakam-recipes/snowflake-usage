{
  name: 'snowflake_stages',
  target: { database: 'SNOWFLAKE', schema: 'ACCOUNT_USAGE', table: 'STAGES' },
  category: 'Snowflake Data-warehouse',

  measures: {
    count: {
      aggregation: 'count',
    },
  },
  dimensions: {
    comment: {
      type: 'string',
      column: 'COMMENT',
    },
    created: {
      type: 'timestamp',
      column: 'CREATED',
    },
    deleted: {
      type: 'timestamp',
      column: 'DELETED',
    },
    last_altered: {
      type: 'timestamp',
      column: 'LAST_ALTERED',
      description: 'Date and time when the stage was last altered.',
    },
    stage_catalog: {
      type: 'string',
      column: 'STAGE_CATALOG',
    },
    stage_name: {
      type: 'string',
      column: 'STAGE_NAME',
    },
    stage_owner: {
      type: 'string',
      column: 'STAGE_OWNER',
    },
    stage_region: {
      type: 'string',
      column: 'STAGE_REGION',
    },
    stage_schema: {
      type: 'string',
      column: 'STAGE_SCHEMA',
    },
    stage_type: {
      type: 'string',
      column: 'STAGE_TYPE',
    },
    stage_url: {
      type: 'string',
      column: 'STAGE_URL',
    },
  },
}
