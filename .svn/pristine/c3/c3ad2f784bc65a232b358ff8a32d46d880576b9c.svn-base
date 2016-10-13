--
-- Is Virginia successfully developing a diverse and well-rounded health workforce for the future?
-- Returns number of graduating docotrs of given year. Trend turns out we're either really lacking 
-- in doctors or proper recording of graduates.

DROP FUNCTION IF EXISTS dr_grad_year();

CREATE FUNCTION dr_grad_year()
RETURNS TABLE(grad_year integer, num_of_grads bigint) AS $$

SELECT grad_completion, count(*)
FROM dr_profiles
WHERE grad_completion < 2016 
  AND grad_completion IS NOT NULL
  AND grad_completion = $1
GROUP BY grad_completion
ORDER BY grad_completion

$$ LANGUAGE SQL STABLE STRICT;

ALTER FUNCTION dr_grad_year() OWNER TO health4va;
