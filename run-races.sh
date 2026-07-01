#!/bin/sh

# set -x

run() {
    export INSTANCE=$1
    export NAME=$HOST-$TRACK-run-$INSTANCE
    echo "Run ${INSTANCE} logfile: ${NAME} STARTING"
    ./run.sh
    echo "Run ${INSTANCE} logfile: ${NAME} COMPLETED"
}

run_trial() {
    export HOST=$1
    export TRACK=$2
    export TARGET=$3
    echo "Running 1st race ${TRACK} on ${HOST} via ${TARGET}..."
    run 1
    echo "Running 2nd race ${TRACK} on ${HOST} via ${TARGET}..."
    run 2
    echo "Running 3rd race ${TRACK} on ${HOST} via ${TARGET}..."
    run 3
    echo "All races run for ${TRACK} on ${HOST} via ${TARGET}"
}

run_platform() {
    export PLATFORM=$1
    export TARGET=$2
    run_trial $PLATFORM geopoint $TARGET
    run_trial $PLATFORM pmc $TARGET
    run_trial $PLATFORM http_logs $TARGET
}

main() {
    echo "Starting trails..."
    run_platform graviton4 172.31.27.30:9200
    run_platform graviton5 172.31.42.181:9200
    run_platform intel64 172.31.51.79:9200
    run_platform amd64 172.31.24.225:9200
    echo "All trials completed."
}

main $*
echo "All races ended. Exiting"
exit 0
