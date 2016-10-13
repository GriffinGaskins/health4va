-- Queries to present for 3/3/2016
--
-- Is Virginia successfully developing a diverse and well-rounded health workforce for the future?
--

--Query #1
--  How many students who are economicaly disadvantaged in this dataset
--  complete health-related cte programs in 2008?

SELECT DISTINCT sch_year, div_name, sch_name, p.program_name, comp_cnt
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
ORDER BY sch_year, div_name, sch_name, p.program_name, comp_cnt
LIMIT 500;


--Query #3
--  How many "LIMITED ENGLISH PROFICIENCY"students in this dataset
--  complete health-related cte programs in 2008? Turns out none.

SELECT sch_year, div_num, sch_num, race, p.program_name, comp_cnt
FROM cte_completer AS cte
  JOIN program AS p ON p.program_num = cte.program_num
WHERE sch_num != 0
  AND div_num != 0
  AND race = 'ALL'
  AND gender = 'ALL'
  AND disabil = 'ALL'
  AND lep = 'Y'
  AND disadva = 'ALL'
  AND p.program_num > 3000
  AND p.program_num < 4000
ORDER BY sch_year, div_num, sch_num, program_name, comp_cnt
LIMIT 500;

