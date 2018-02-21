-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION pgeyes" to load this file. \quit
CREATE OR REPLACE FUNCTION pgeyes() 
 RETURNS TABLE (
 item VARCHAR,
 result VARCHAR,
 valid BOOLEAN,
 description VARCHAR
) 
AS $$
BEGIN
	item := 'PostgreSQL version number';
	result := current_setting('server_version_num');
	IF cast(result as INTEGER) >= 90600 THEN
		valid := true;
	ELSE 
		valid := false;
	END IF;
	description := '>=90600';

        RETURN NEXT;
           
END; $$ 
 
LANGUAGE 'plpgsql';
