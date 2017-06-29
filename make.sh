#!/bin/sh

( cd apache ; pwd ; docker build -t kqm/apache . )
( cd moodle ; pwd ; docker build -t kqm/moodle . )
