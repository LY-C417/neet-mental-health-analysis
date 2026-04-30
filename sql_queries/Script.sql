-- viz1 mental health trend
SELECT date, 
  ROUND(percent_of_neet, 2) as mental_health_percent
FROM mental_health_trend_neet
WHERE health_condition = 'Mental health condition'
ORDER BY date DESC;

-- viz2 gender trend
SELECT date, sex, 
ROUND (neet_percent, 2) as neet_percent
FROM neet_by_gender_trend
WHERE date >2011;

-- viz3 geder reason breakdown
SELECT date, sex, 
ROUND (ilo_unemployed_less_6months_percent + ilo_unemployed_more_6months_percent, 2)as unemployed_percent,
ROUND (inactive_longterm_temp_sick_percent, 2) as longterm_sick_percent,
Round (inactive_look_after_fam_home_percent,2) as caring_percent,
ROUND (inactive_other_percent ,2) as other_inactive_percent
FROM neet_gender_reason_breakdown 
WHERE sex IN ('Male','Female')AND date >2011
ORDER BY date DESC, sex;

-- viz4 regional inequality
SELECT region_name,
ROUND (neet_percent, 2)as region_percent
FROM neet_by_region_england
WHERE region_name IS NOT NULL
AND TRIM(region_name) != ''
ORDER BY region_percent DESC;

-- viz5 uk quarterly trend
SELECT 
  date,
  CASE 
    WHEN date like 'Jan%' THEN 'Q1'
    WHEN date like 'APR%' THEN 'Q2'
    WHEN date like 'Jul%' THEN 'Q3'
    WHEN date like 'Oct%' THEN 'Q4'
  END AS quater,
  sex,
  ROUND(neet_percent, 2) as neet_percent,
  'UK' as location
FROM neet_ons_clean
WHERE sex IN ('Male', 'Female');



