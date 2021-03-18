If your database is a version prior to:

Rel22_01_013_Q_7166_and_7171_details_text.sql

You need to run the appriopriate updates in the zip file in the folder:

Rel20_to_Base_Rel21_Updates


To Find out the current version of your database run this query against your mangos world database:

SELECT * FROM db_version ORDER BY VERSION DESC, structure DESC, content DESC LIMIT 0,1

