--
--  Fall Membership Count by Race for a Specific County and Year
--

DROP FUNCTION IF EXISTS fall_count(sch_year integer, div_num integer);

CREATE FUNCTION fall_count(sch_year integer, div_num integer)
RETURNS TABLE(sch_year integer, div_num integer, race text, fall_cnt bigint) AS $$

SELECT DISTINCT sch_year, div_num, race, SUM(fall_cnt) AS fall_cnt
FROM fall_membership
WHERE sch_num = 0
  AND div_num = $2
  AND race <> 'ALL'
  AND gender = 'ALL'
  AND disabil = 'ALL'
  AND lep = 'ALL'
  AND disadva = 'ALL'
  AND sch_year = $1
  AND grade_num = 0
GROUP BY sch_year, div_num, race
ORDER BY fall_cnt DESC


$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION race_program(sch_year integer, div_num integer) OWNER TO health4va;
