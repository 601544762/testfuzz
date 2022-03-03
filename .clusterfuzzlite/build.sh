#!/bin/bash -eu
# Copyright 2016 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

# Run the OSS-Fuzz script in the curl-fuzzer project.
#cat ossfuzz.sh
#ls -al ./
#ls -al ./scripts/
#cat ./scripts/install_curl.sh
#cat ./buildconf
cat ./scripts/compile_fuzzer.sh

sed -i 's/.\/buildconf/sh buildconf/g' ./scripts/install_curl.sh

#echo '#!/bin/sh
#echo "*** Do not use buildconf. Instead, just use: autoreconf -fi" >&2
#exec ${AUTORECONF:-autoreconf} -fi "${@}"'> buildconf


chmod 777 ./buildconf
ls -al /src/curl/docs

./ossfuzz.sh
