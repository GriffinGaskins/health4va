--
-- How many students graduate with a stemh degree each year from Virgina?
--

DROP FUNCTION IF EXISTS degrees_stemh(div_num integer);

CREATE FUNCTION degrees_stemh(div_num integer)
RETURNS TABLE(year integer) AS $$

    SELECT year
    FROM degrees_awarded_stemh
    WHERE div_num = $1
    ORDER BY year

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION degree_stemh(div_num integer) OWNER TO health4va;

