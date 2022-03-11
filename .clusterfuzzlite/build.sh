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

#sed -i 's/.\/buildconf/sh buildconf/g' ./scripts/install_curl.sh
#sed -i '55a \            --with-amissl \\' ./scripts/install_curl.sh
#sed -i '55a \            --with-bearssl \\' ./scripts/install_curl.sh
#sed -i '55a \            --with-gnutls \\' ./scripts/install_curl.sh
#sed -i '55a \            --with-mbedtls \\' ./scripts/install_curl.sh
#sed -i '55a \            --with-nss \\' ./scripts/install_curl.sh
#sed -i '55a \            --with-openssl \\' ./scripts/install_curl.sh
#sed -i '55a \            --with-schannel \\' ./scripts/install_curl.sh
#sed -i '55a \            --with-secure-transport \\' ./scripts/install_curl.sh
#sed -i '55a \            --with-wolfssl \\' ./scripts/install_curl.sh
#sed -i '55a \            --with-nss-deprecated \\' ./scripts/install_curl.sh

cat ./scripts/install_curl.sh

#cp /src/curl/curl.1 /src/curl/docs/
cp /github/workspace/storage/testfuzz/curl.1 /src/curl/docs/
mkdir -p /tmp/dependency
tar -xvf /github/workspace/storage/testfuzz/cmdline-opts.tar -C /tmp/dependency
cp /tmp/dependency/docs/cmdline-opts/*.d /src/curl/docs/cmdline-opts
md5sum /src/curl/curl.1
md5sum /github/workspace/storage/testfuzz/curl.1

#echo '#!/bin/sh
#echo "*** Do not use buildconf. Instead, just use: autoreconf -fi" >&2
#exec ${AUTORECONF:-autoreconf} -fi "${@}"'> buildconf

chmod 777 ./buildconf
ls -al /src/curl/docs

./ossfuzz.sh
