#!/bin/sh
# Run this script directly on the db server.

echo COPY division FROM vdoe
psql -c "COPY (
    SELECT div_num, div_name
    FROM division
  ) TO STDOUT;" vdoe | \
  psql -c "COPY division FROM STDIN;" health4va

echo COPY school FROM vdoe
psql -c "COPY (
    SELECT div_num, sch_num, sch_name
    FROM school
  ) TO STDOUT;" vdoe | \
  psql -c "COPY school FROM STDIN;" health4va


echo COPY fall_membership FROM vdoe
psql -c "COPY (
    SELECT 
      sch_year, div_num, sch_num,
      grade_num, race, gender, disabil,
      lep, disadva, fall_cnt
      
    FROM fall_membership
  ) TO STDOUT;" vdoe | \
  psql -c "COPY fall_membership FROM STDIN;" health4va


echo COPY dec_child_count FROM vdoe
psql -c "COPY (
    SELECT
      sch_year, div_num, sch_num,
      grade_num, race, gender,
      disabil, lep, disadva,
      disabil_type, dec1_cnt 
    FROM dec_child_count
  ) TO STDOUT;" vdoe | \
  psql -c "COPY dec_child_count FROM STDIN;" health4va

echo COPY cte_completer FROM vdoe
psql -c "COPY (
    SELECT
      sch_year, div_num, sch_num,
      race, gender, disabil, lep, disadva,
      program_num, comp_cnt 
    FROM cte_completer
  ) TO STDOUT;" vdoe | \
  psql -c "COPY cte_completer FROM STDIN;" health4va

echo COPY hs_graduate FROM vdoe
psql -c "COPY (
    SELECT
      sch_year, div_num, sch_num,
      race, gender, disabil, lep, disadva,
      diploma_num, graduate_cnt 
    FROM hs_graduate
  ) TO STDOUT;" vdoe | \
  psql -c "COPY hs_graduate FROM STDIN;" health4va

echo COPY ontime_cohort FROM vdoe
psql -c "COPY (
    SELECT
      sch_year, div_num, sch_num,
      race, gender, disabil, lep, disadva,
      cohort_cnt, diploma_rate, dropout_rate
    FROM ontime_cohort
  ) TO STDOUT;" vdoe | \
  psql -c "COPY ontime_cohort FROM STDIN;" health4va

echo COPY postsec_enroll FROM vdoe
psql -c "COPY (
    SELECT
      sch_year, div_num, sch_num,
      race, gender, disabil, lep, disadva,
      enroll_graduate_cnt, ps_institution_type,
      ps_enrollment_cnt 
    FROM postsec_enroll
  ) TO STDOUT;" vdoe | \
  psql -c "COPY postsec_enroll FROM STDIN;" health4va

echo COPY postsec_achieve FROM vdoe
psql -c "COPY (
    SELECT
      sch_year, div_num, sch_num,
      race, gender, disabil, lep, disadva,
      achieve_graduate_cnt, ps_credit_de_cnt,
      ps_unkn_de_cnt, ps_credit_wo_de_cnt,
      ps_unkn_wo_de_cnt 
    FROM postsec_achieve
  ) TO STDOUT;" vdoe | \
  psql -c "COPY postsec_achieve FROM STDIN;" health4va

echo COPY program FROM vdoe
psql -c "COPY (
    SELECT program_num, program_name
    FROM program
  ) TO STDOUT;" vdoe | \
  psql -c "COPY program FROM STDIN;" health4va

echo COPY cte_full_enrollment FROM csv
psql -c "\copy cte_full_enrollment FROM cte_full_enrollment.csv WITH CSV HEADER" health4va

echo COPY dr_profiles FROM csv
psql -c "\copy dr_profiles FROM dr_profiles.csv WITH CSV HEADER" health4va

#echo COPY post_graduate FROM csv
#psql -c "\copy post_graduate FROM post_grad.csv WITH CSV HEADER" health4va

echo COPY stemh_enrollment FROM csv
psql -c "\copy stemh_enrollment FROM stemh.csv WITH CSV HEADER" health4va
