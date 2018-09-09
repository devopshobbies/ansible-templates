#!/bin/bash

export PATH=/{{username}}/{{application}}/content/android-studio/tools/bin:${PATH}
yes | sdkmanager "platforms;android-27" "build-tools;27.0.3"
yes | sdkmanager --licenses
