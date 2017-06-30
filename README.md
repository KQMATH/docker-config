docker-moodle
=============

A Dockerfile to run Moodle on for development on localhost,
with external MySQL Database.  The recommended approach is
to put the moodle installation in a host directory and
mount it as a module.  Named volumes are used and reused
for moodledata and the database. Backup scripts are provided 
to dump data.

## Installation

```
git clone https://github.com/KQMATH/docker-moodle.git
cd docker-moodle
./make.sh
```

## Usage

To spawn a new instance of Moodle:

```
cd ..
git clone -b KQM_32 git@github.com:KQMATH/moodle.git
cd docker-moodle
./run.sh
```

Obviously, you can check out a different version of moodle if you prefer.
Plugins can be added to the moodle directory as necessary.

You can visit the following URL in a browser to get started:

```
http://localhost:8088
```

## Caveats
The following aren't handled, considered, or need work: 
* moodle cronjob (should be called from cron container)
* log handling (stdout?)
* email (does it even send?)

## Credits

This is a fork of [Jonathan Hardison's](https://github.com/jmhardison/docker-moodle) Dockerfile.
