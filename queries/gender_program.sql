--
--  How many students of each gender in this dataset complete health-related cte programs?
--

DROP FUNCTION IF EXISTS gender_program(sch_year integer, gender text);

CREATE FUNCTION gender_program(sch_year integer, gender text)
RETURNS TABLE(sch_year integer, program text, divison text, school text, gender text, comp_cnt integer) AS $$

SELECT DISTINCT sch_year AS year, program_name AS program, div_name AS division, sch_name AS school, gender, comp_cnt
FROM cte_completer AS cte
  NATURAL JOIN program AS p 
  NATURAL JOIN division AS d
  NATURAL JOIN school AS s
WHERE sch_num != 0
  AND div_num != 0
  AND race = 'ALL'
  AND gender = $2
  AND disabil = 'ALL'
  AND lep = 'ALL'
  AND disadva = 'ALL'
  AND p.program_num > 3000
  AND p.program_num < 4000
  AND sch_year = $1
ORDER BY sch_year, program_name, div_name, sch_name, gender, comp_cnt

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION gender_program(sch_year integer, gender text) OWNER TO health4va;
