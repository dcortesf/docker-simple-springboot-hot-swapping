#!/bin/bash

# Copyright 2017 Daniel Cortés - Stratio.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

echo "================================"
echo "    Starting Springboot v.0.6   "
echo "================================"
echo $(readlink -f /usr/bin/java | sed "s:/bin/java::")
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")

if [ -n "$ARTIFACT_URL" ]
then
  if [[ ${ARTIFACT_URL} == *".git"* ]];
  then
    echo "Getting artifact from: ${ARTIFACT_URL}"
    ##wget -q --no-check-certificate --connect-timeout=5 --read-timeout=10 --tries=2 -O /tmp/application.jar "$ARTIFACT_URL"
    mkdir /tmp/git/
    cd /tmp/git
    git clone ${ARTIFACT_URL} .
    exec mvn spring-boot:run
  fi
else
  cd /tmp/
  exec mvn spring-boot:run
fi
