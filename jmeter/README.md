# JMeter easyTravel Angular Smoke Test

This is a shell script and JMeter test plan that can be used to run a load/smoke test against the easyTravel Angular frontend.

1. In Dynatrace, generate an API access token with `ingest-events` permission
2. Download and install JMeter
  - https://jmeter.apache.org/download_jmeter.cgi
3. Use Git to clone repo to JMeter host/server or download/copy `jmeter` directory manually
4. Place `easytravel-angular-smoke-test.jmx` file in scripts directory (any directory of your choosing)
5. Place `jmeter-test-easytravel.sh` in a directory where it can be executed
6. Modify `jmeter-test-easytravel.sh` and update variables
  - Modify variables defined at the top of the script
  - Modify JMeter binary path (replacing `/opt/jmeter/apache-jmeter-5.4.3/bin/jmeter` with actual binary path)
7. Execute the test in headless mode by calling `./jmeter-test-easytravel.sh`
