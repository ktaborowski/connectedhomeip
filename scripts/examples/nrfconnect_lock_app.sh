#!/usr/bin/env bash

#
#    Copyright (c) 2020 Project CHIP Authors
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#

die() {
    exit 1
}

set -x
[[ -n $ZEPHYR_BASE ]] && source "$ZEPHYR_BASE/zephyr-env.sh"
env

./bootstrap || die

west build -b nrf52840dk_nrf52840 -d examples/lock-app/nrfconnect/build examples/lock-app/nrfconnect || die

west flash --erase -d examples/lock-app/nrfconnect/build || die
