# Food Truck Performance Tests

This directory holds a simple performance & load tests which can be run against the API, it can also be used as a system or end to end test to be run against a deployed instance of the API.

The tests use Grafana k6. Grafana k6 is an open-source load testing tool that makes performance testing easy and productive for engineering teams. [Read more about k6](https://k6.io/docs/)

## Installing K6

See the k6 docs https://k6.io/docs/getting-started/installation/

## Running

There is a wrapper bash script to run the tests called `run.sh` 

### Configuration

Copy the `.env.sample` to `.env`, then:
 - Configure other settings as appropriate, such as `BASE_URL` `TEST_VUS` etc.

Some simple configuration of the test run is done using env vars:

- `TEST_DURATION` - How long to run test for, e.g. `120s` is 120 seconds.
- `TEST_VUS` - Number of virtual users. The tests runs with "constant load" no ramping up.
- `TEST_SLEEP` - Sleep time between API calls, to aim to be slightly more realistic.
- `TEST_ONE_ITER` - Used only when developing & local testing of the tests. Forces the script to run a single iteration, with a single user, all other settings are ignored.

For more advanced configuration of the test load, duration etc, the test script would need to be modified, see the k6 docs, e.g. https://k6.io/docs/using-k6/scenarios/

## Output

The test is configured to output results into two files, both of which will be placed into the output subfolder

- `output/load-test-summary.html` - HTML report with summary of the test timings, checks and threshold. This uses a plugin for k6 called [benc-uk/k6-reporter](https://github.com/benc-uk/k6-reporter)
- `output/results.csv` - Raw result data including metrics for every request the test made. This file can get extremely large with longer tests. It can be disabled by modifying `run.sh`
  