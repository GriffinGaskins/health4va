-- How many students who are economicaly disadvantaged in this dataset
-- complete health-related cte programs in 2008?

DROP FUNCTION IF EXISTS disadva_cte(sch_year integer);

CREATE FUNCTION disadva_cte(sch_year integer)
RETURNS TABLE(sch_year integer, div_name text, sch_name text, program_name text, comp_cnt integer) AS $$

SELECT DISTINCT sch_year, div_name, sch_name, program_name, comp_cnt
FROM cte_completer AS cte
  NATURAL JOIN program AS p
  NATURAL JOIN division AS d
  NATURAL JOIN school AS s
WHERE sch_num != 0
  AND div_num != 0
  AND race = 'ALL'
  AND gender = 'ALL'
  AND disabil = 'ALL'
  AND lep = 'ALL'
  AND disadva = 'Y'
  AND p.program_num > 3000
  AND p.program_num < 4000
  AND sch_year = $1
ORDER BY sch_year, div_name, sch_name, program_name, comp_cnt

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION disadva_cte(sch_year integer) OWNER TO health4va;
