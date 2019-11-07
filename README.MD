# vagrant-gloss

1. `export CVSROOT=username@trips.cs.rochester.edu`
2. `vagrant up`
3. `vagrant up --provision-with=server`


NOTE 1: if you don't have CVS access, but have access to the gloss sourcecode, replace the contents of `acquisition/gloss.sh` with a command that will place the source code in `shared/gloss`

NOTE 2: This system should be able to handle any trips system.  Just replace any mentions of `gloss` (`system_name` should cover it) with the trips system you're interested in and add the necessary acquisition script to `acquisition/system_name.sh`

# Development

1. Modify code in `shared/gloss` as necessary
2. Recompile with `vagrant reload --provision-with=compile`
3. Restart server with `vagrant up --provision-with=server`
