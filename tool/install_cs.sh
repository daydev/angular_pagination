#!/bin/bash

which content_shell
if [[ $? -ne 0 ]]; then
  CHROMIUM="$DART_SDK/../chromium"
  cd ${CHROMIUM}
  ./download_contentshell.sh
  unzip -d content_shell -j content_shell-linux-x64-release.zip
  chmod +x ${CHROMIUM}/content_shell/content_shell
  ln -s ${CHROMIUM}/content_shell/content_shell $DART_SDK/bin/content_shell
fi