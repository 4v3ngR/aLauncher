#!/bin/sh

flutter build apk --split-per-abi && flutter build apk --split-per-abi --debug
