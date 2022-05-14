# variables passed as properties to jmeter test, all are required

# absolute path and filename for jmeter load test plan/file
JM_TESTFILE=/opt/jmeter/scripts/easytravel-angular-smoke-test.jmx
# jmeter test duration in seconds, infinite loop until time expires
JM_DURATION=300
# jmeter test duration in minutes, used for the dynatrace event timeout setting which requires minutes
JM_MINUTES=5
# jmeter ramp up time in seconds, will scale up virtual users from 0 to JM_THREADS over this amount of seconds
JM_RAMP=60
# jmeter thread count, the number of virtual users
JM_THREADS=5
# HTTP host for the easytravel angular frontend, must be reachable from the location running jmeter
ET_ANGULAR_HOST=localhost
# protocol, http or https, do not add ://
ET_ANGULAR_PROTO=http
# HTTP listening port for the easytravel angular frontend
ET_ANGULAR_PORT=9079
# easytravel login user name/id, must exist already in easytravel instance (sign up is not performed)
ET_USERNAME=demouser
# easytravel login password
ET_PASSWORD=password
# easytravel login credit card number
ET_CCNUMBER=5440748929333328
# dynatrace environment host without trailing slash
# saas = abc123.live.dynatrace.com
# managed = abc123.dynatrace-managed.com
DT_HOST=abc123.live.dynatrace.com
# dynatrace api base uri without trailing slash
# saas = /api
# managed = /e/<environment-uuid>/api
DT_API_URI=/api
# dynatrace api token, only needs permission to 'ingest-events' api v2
DT_API_TOKEN=dt0c01.
# dynatrace management zone, all process group instances belonging to this management zone will have an event
DT_MZ_NAME=k8s-easytravel-nonprod
###
/opt/jmeter/apache-jmeter-5.4.3/bin/jmeter -n -t $JM_TESTFILE -Jthreads=$JM_THREADS -Jduration=$JM_DURATION -Jminutes=$JM_MINUTES -Jramp=$JM_RAMP \
-JET_ANGULAR_PROTO=$ET_ANGULAR_PROTO -JET_ANGULAR_HOST=$ET_ANGULAR_HOST -JET_ANGULAR_PORT=$ET_ANGULAR_PORT \
-JET_USERNAME=$ET_USERNAME -JET_PASSWORD=$ET_PASSWORD -JET_CCNUMBER=$ET_CCNUMBER \
-JDT_HOST=$DT_HOST -JDT_API_URI=$DT_API_URI -JDT_API_TOKEN=$DT_API_TOKEN -JDT_MZ_NAME=$DT_MZ_NAME
