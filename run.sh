#!/bin/sh

set -x

rm -rf $HOME/.rally
if [ ! -d $HOME/races/results ]; then
   mkdir $HOME/races/results
fi
if [ ! -d $HOME/races/logs ]; then
   mkdir $HOME/races/logs
fi
esrally race --distribution-version=9.3.0 --pipeline=benchmark-only --kill-running-processes --report-format=markdown --report-file=$HOME/races/results/${NAME}.txt --track=${TRACK} --target-hosts=${TARGET} --client-options="timeout:60,use_ssl:true,verify_certs:false,basic_auth_user:'elastic',basic_auth_password:'dogman123'" --on-error=abort --exclude-tasks="geoGrid_geohex-esql,geoGrid_aggs_geohex,geoGrid_aggs_geohex-esql" 2>&1 1> $HOME/races/logs/${NAME}.log
