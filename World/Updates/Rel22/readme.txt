If your database is a version prior to:

Rel22_03_014_Flying Machine.sql

You need to run the appriopriate updates in the zip file in the folder:

Rel21_to_Base_Rel22_Updates


To Find out the current version of your database run this query against your mangos world database:

SELECT * FROM db_version ORDER BY VERSION DESC, structure DESC, content DESC LIMIT 0,1

