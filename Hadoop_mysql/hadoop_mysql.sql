/*
iso_code,
date,
new_cases,
new_cases_14_days,
new_cases_14_days_100k,
total_cases,
total_cases_100k,
new_deaths,
new_deaths_14_days,
new_deaths_14_days_100k,
total_deaths,
total_deaths_100k,
*/

use hadoop_test;
SHOW TABLES;
CREATE TABLE IF NOT EXISTS covid19 (
	iso_code char(8) NOT NULL		COMMENT "국가 코드 ISO", 
    date 	TIMESTAMP				COMMENT "집계 날짜",
    new_cases INT					COMMENT "날짜별 신규 확진자 수",
    new_cases_14_days INT			COMMENT "최근 14일간의 확진자 사례 수",
    new_cases_14_days_100k  DOUBLE  COMMENT "인구 10만명당 최근 14일간의 사례 수",
    total_cases INT					COMMENT "전체 누적 확진자 수",
    total_cases_100k DOUBLE			COMMENT "10만명 당 전체 누적 확진자 수", 
    new_deaths INT					COMMENT "신규 사망자 수",
    new_deaths_14_days  INT			COMMENT "최근 14일간의 사망자 수",
    new_deaths_14_days_100k DOUBLE  COMMENT "인구 10만명 당 최근 14일간의 사망자 수",
    total_deaths INT				COMMENT "전체 사망자 수",
    total_deaths_100k DOUBLE		COMMENT "인구 10만명 당 전체 사망자수"
);

DESCRIBE covid19;
SELECT * FROM covid19;

SELECT count(*) FROM covid19;

SELECT * FROM covid19 WHERE date = "";

----------------------------------------------
DROP TABLE IF EXISTS covid19_max;
CREATE TABLE covid19_max(
	iso_code char(8) UNIQUE,
    date TIMESTAMP,
    new_cases INT
);

SELECT * FROM covid19_max;
