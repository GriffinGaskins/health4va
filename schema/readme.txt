Health4VA

Katie Heatherly
Annalea Roeske
Griffin Gaskins
Matthew Petty


DESCRIPTION

Our application enables policy makers to view and update a list of divisions,
schools, colleges in Virginia. There are also table on CTE and STEM-H enrollment 
as well as doctor information in Virginia. The data is based on last year's VLDS fall
membership and additional data from NCES. Data on post graduate information on VA 
doctors was also used.


STEPS TO CREATE DATABASE

1. Download the "Enrollment Trends in STEM-H Programs" for bachelor, master, and doctor from:
http://research.schev.edu/enrollment/e31_report.asp

2. Use a spreadsheet to save as stem-h-bach-all.csv, stem-h-masters-all.csv, and stem-h-doctors-all.csv.

3. Download the "Enrollment Trends in STEM-H Programs by Gender" for bachelor, master, and doctor from:
http://research.schev.edu/enrollment/e31A_report.asp

4. Use a spreadsheet to save as stem-h-bach-gender.csv, stem-h-masters-gender.csv, and stem-h-doctors-gender.csv.

5. Download the "Middle School & High School CTE Program Enrollment" table from:
http://doe.virginia.gov/instruction/career_technical/statistics_reports/enrollment.shtml

6. Download the "Virginia Department of Health Professionals" table from:
http://data.virginia.gov/hhr

7. Add the VLDS tables as given: cte_enrollment, fall_membership, dec_child_count, hs_graduate, ontime_cohort, 
   postsec_enroll, postsec_achieve

8. Run create.sql to create tables with group ownership.

9. Run copy.sh on db.cs.jmu.edu to copy data from VDOE.

10. Run stats.sql to count rows and analyze the tables.

***NOTE: We are leaving post_grad.csv in the directory for now, it has data inconsistencies, but it is filled with 	a lot of useful information.
