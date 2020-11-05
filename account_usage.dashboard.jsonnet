{
  name: 'Snowflake Account Usage',
  filterSchema: [
    {
      name: 'Date',
      type: 'mappingDimension',
      value: {
        name: 'eventTimestamp',
      },
      defaultValue: 'P1W',
      isRequired: true,
    },
  ],
  reports: [
    {
      name: 'Snowflake Snowpipe Daily Cost',
      ttl: 'PT24H',
      x: 3,
      y: 1,
      h: 2,
      w: 3,
      component: 'r-segmentation-chart',
      type: 'segmentation',
      reportOptions: {
        model: 'snowflake_pipe_usage',
        dimensions: [
          {
            name: 'start_time',
            timeframe: 'day',
          },
        ],
        measures: [
          'total_credits_used_usd',
        ],
        reportOptions: {
          chartOptions: {
            type: 'area',
          },
        },
      },
    },
    {
      name: 'Snowflake Pipe Daily Usage',
      ttl: 'PT24H',
      x: 0,
      y: 3,
      h: 2,
      w: 6,
      component: 'r-segmentation-table',
      type: 'segmentation',
      reportOptions: {
        model: 'snowflake_pipe_usage',
        dimensions: [
          {
            name: 'end_time',
            timeframe: 'day',
          },
        ],
        measures: [
          'total_bytes_inserted',
          'total_files_inserted',
          'total_credits_used_usd',
        ],
        reportOptions: {
          chartOptions: {
            type: 'area',
          },
        },
      },
    },
    {
      name: 'Snowflake Billable Storage TB',
      ttl: 'PT24H',
      x: 4,
      y: 0,
      h: 1,
      w: 2,
      component: 'r-number',
      type: 'segmentation',
      reportOptions: {
        model: 'snowflake_storage_metrics',
        dimensions: [],
        measures: [
          'billable_tb',
        ],
      },
    },
  ],
}
