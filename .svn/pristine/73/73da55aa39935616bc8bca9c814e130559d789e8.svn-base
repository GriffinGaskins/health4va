--
-- How many students graduate with a degree each year from Virgina?
--

DROP FUNCTION IF EXISTS degrees(div_num integer);

CREATE FUNCTION degrees(div_num integer)
RETURNS TABLE(year integer) AS $$

    SELECT year
    FROM degrees_awarded
    WHERE div_num = $1
    ORDER BY year

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION degree(div_num integer) OWNER TO health4va;

