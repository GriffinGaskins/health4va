--
--  Pulls from the generated data table
--

DROP FUNCTION IF EXISTS fake_race_program(sch_year integer, program_num integer,
 div_num integer);

CREATE FUNCTION fake_race_program(sch_year integer, program_num integer,
div_num integer)
RETURNS TABLE(sch_year integer, program text, race text, comp_cnt integer) AS $$

SELECT DISTINCT sch_year AS year, program_name AS program, race, comp_cnt
FROM fake_cte_completer AS cte
  NATURAL JOIN program AS p
  NATURAL JOIN division AS d
  NATURAL JOIN school AS s
WHERE sch_num = 0
  AND div_num = $3
  AND race <> 'ALL'
  AND gender = 'ALL'
  AND disabil = 'ALL'
  AND lep = 'ALL'
  AND disadva = 'ALL'
  AND p.program_num = $2
  AND sch_year = $1
ORDER BY comp_cnt DESC


$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION fake_race_program(sch_year integer, program_num integer,
div_num integer) OWNER TO health4va;
