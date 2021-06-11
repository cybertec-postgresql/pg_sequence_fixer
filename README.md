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


Author: Hans-Jürgen Schönig, http://www.cybertec-postgresql.com

