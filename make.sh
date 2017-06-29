#!/bin/sh

( cd moodle ; pwd ; docker build -t kqm/moodle . )
( cd apache ; pwd ; docker build -t kqm/apache . )
