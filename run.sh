#!/bin/bash
wget $SECRET_DIR/config.yaml $CONFIG_URL
/opt/webserver/bin/launch.sh