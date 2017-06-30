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

To spawn a new instance of Moodle as follows.

First we need to start the DB container.

```
./dbrun.sh
```

Note that the DB container will take some time before it is ready.
In the meantime, we can clone moodle, as follows.

```
cd ..
git clone -b KQM_32 git@github.com:KQMATH/moodle.git
cd docker-moodle
```
Obviously, you can check out a different version of moodle if you prefer.
Plugins can be added to the moodle directory as necessary.

To create the moodle DB and moodledata volume, use the install script.

```
./install.sh
```

This prints output from the moodle installation process on stdout.
The installation process takes a while.
The database is populated and the moodledata volume is created.
If the DB is not ready, the installation process will fail with 
an error message.

Once the install script is complete, it is possible to run the
moodle container.

```
./run.sh
```

Now you can visit the following URL in a browser:

```
http://localhost:8088
```

If you are asked to accept license agreements,
then the install script has probably failed.

## Caveats
The following aren't handled, considered, or need work: 
* moodle cronjob (should be called from cron container)
* log handling (stdout?)
* email (does it even send?)

## Credits

This is a fork of [Jonathan Hardison's](https://github.com/jmhardison/docker-moodle) Dockerfile.
