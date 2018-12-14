# pleroma_test_cookbook

Example cookbook for utilizing the [pleroma-cookbook](https://github.com/jayme/pleroma-cookbook) LWRP resources. 

You can model your cookbook off this - add attributes, use data bags, etc etc. 

**WARNING** Due to an open issue in [sous-chef/postgresql](https://github.com/sous-chefs/postgresql/pull/577) you will need to manually add the extentions. 

Example:

```
root@default-ubuntu-1604:~# su -c 'psql -U postgres' postgres
psql (9.6.11)
Type "help" for help.

postgres=# \c pleroma
You are now connected to database "pleroma" as user "postgres".
pleroma=# CREATE EXTENSION IF NOT EXISTS citext;
CREATE EXTENSION
pleroma=# CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION
pleroma=# CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION
```
