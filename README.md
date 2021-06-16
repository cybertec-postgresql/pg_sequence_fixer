# pg_sequence_fixer
Fixing PostgreSQL sequences which got out of sync with the data

Often data is added to a column which carries a sequence manually. In this case
the sequence and the data can be out of sync and people might face "duplicate
key errors".

pg_sequence_fixer will loop over all sequences created by serials and make
sure that they are set to a value that is in sync with the data. We set a value
high enough to avoid trouble.

Two modes are available: With table and without table locking. 
Not going for table locking risks changes while your sequences are fixed.
Turning locking on can lead to troubles due to (potentially) long periods of
table locking.

How to use the extension:

```sql
test=# CREATE EXTENSION pg_sequence_fixer ;
CREATE EXTENSION

test=# SELECT pg_sequence_fixer(1000, false);
NOTICE:  setting sequence for sample2 to 1054
NOTICE:  setting sequence for sample1 to 1019
 pg_sequence_fixer 
-------------------
 
(1 row)
```

Author: Hans-Jürgen Schönig, http://www.cybertec-postgresql.com

