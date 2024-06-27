USE mental;
DROP TABLE IF EXISTS hospital;

TRUNCATE hospital;
CREATE TABLE hospital (
    hospital_id VARCHAR(300),
    hospital_name VARCHAR(255) NOT NULL,
    hospital_loc_code VARCHAR(255) NOT NULL,
    hospital_location VARCHAR(255) NOT NULL,
    hospital_website VARCHAR(255),
    hospital_call VARCHAR(255),
    PRIMARY KEY (hospital_id)
);

DROP TABLE IF EXISTS hospital_detail;
CREATE TABLE hospital_detail (
	hospital_id VARCHAR(300),
	mon_start_time VARCHAR(300),
    mon_end_time VARCHAR(300),
    tue_start_time VARCHAR(300),
    tue_end_time VARCHAR(300),
    wed_start_time VARCHAR(300),
    wed_end_time VARCHAR(300),
    thu_start_time VARCHAR(300),
    thu_end_time VARCHAR(300),
    fri_start_time VARCHAR(300),
    fri_end_time VARCHAR(300),
    sat_start_time VARCHAR(300),
    sat_end_time VARCHAR(300),
    sun_start_time VARCHAR(300),
    sun_end_time VARCHAR(300),
    sun_holiday VARCHAR(255),
    lunchtime VARCHAR(300),
    holiday VARCHAR(300),
    FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id)
);

DROP TABLE IF EXISTS reservation;
CREATE TABLE reservation (
	hospital_id VARCHAR(300) NOT NULL,
	reservation_date DATE NOT NULL,
    treatment_date DATE NOT NULL,
    treatment_time TIME(6) NOT NULL,
    hospital_name BIGINT NOT NULL,
    reservation_id BIGINT NOT NULL AUTO_INCREMENT,
    user_id VARCHAR(255) NOT NULL,
    PRIMARY KEY (reservation_id),
    FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id) );

DROP TABLE IF EXISTS consultation;
CREATE TABLE consultation (
	reservation_id BIGINT NOT NULL,
	consultation_id BIGINT NOT NULL AUTO_INCREMENT,
	consultation_details VARCHAR(500),
    my_change VARCHAR(500),
    picture BLOB,
    PRIMARY KEY (consultation_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id) );


SELECT * FROM reservation;


 -- SELECT count(*) FROM hospital;
SELECT * FROM hospital ORDER BY hospital_name DESC;
SELECT * FROM hospital_detail;

-- hospital와 hospital_detail을 innerjoin하기 
create table hospital
 select * from hospital_first INNER JOIN hospital_detail USING (hospital_id);
 
select * from hospital;

DROP TABLE IF EXISTS hospital;
create table hospital
SELECT `hospital`.`hospital_id`,
    `hospital`.`hospital_name`,
    `hospital`.`hospital_loc_code`,
    `hospital`.`hospital_location`,
    `hospital`.`hospital_website`,
    `hospital`.`hospital_call`,
    concat(substr(lpad(`hospital`.`mon_start_time`, 4, '0'),1,2),':',substr(lpad(`hospital`.`mon_start_time`, 4, '0'),3,2)) as mon_start_time,
    concat(substr(lpad(`hospital`.`mon_end_time`, 4, '0'),1,2),':',substr(lpad(`hospital`.`mon_end_time`, 4, '0'),3,2)) as mon_end_time,
    concat(substr(lpad(`hospital`.`tue_start_time`, 4, '0'),1,2),':',substr(lpad(`hospital`.`tue_start_time`, 4, '0'),3,2)) as tue_start_time,
    concat(substr(lpad(`hospital`.`tue_end_time`, 4, '0'),1,2),':',substr(lpad(`hospital`.`tue_end_time`, 4, '0'),3,2)) as tue_end_time,
    concat(substr(lpad(`hospital`.`wed_start_time`, 4, '0'),1,2),':',substr(lpad(`hospital`.`wed_start_time`, 4, '0'),3,2)) as wed_start_time,
    concat(substr(lpad(`hospital`.`wed_end_time`, 4, '0'),1,2),':',substr(lpad(`hospital`.`wed_end_time`, 4, '0'),3,2)) as wed_end_time,
    concat(substr(lpad(`hospital`.`thu_start_time`, 4, '0'),1,2),':',substr(lpad(`hospital`.`thu_start_time`, 4, '0'),3,2)) as thu_start_time,
    concat(substr(lpad(`hospital`.`thu_end_time`, 4, '0'),1,2),':',substr(lpad(`hospital`.`thu_end_time`, 4, '0'),3,2)) as thu_end_time,
    concat(substr(lpad(`hospital`.`fri_start_time`, 4, '0'),1,2),':',substr(lpad(`hospital`.`fri_start_time`, 4, '0'),3,2)) as fri_start_time,
    concat(substr(lpad(`hospital`.`fri_end_time`, 4, '0'),1,2),':',substr(lpad(`hospital`.`fri_end_time`, 4, '0'),3,2)) as fri_end_time,
    concat(substr(lpad(`hospital`.`sat_start_time`, 4, '0'),1,2),':',substr(lpad(`hospital`.`sat_start_time`, 4, '0'),3,2)) as sat_start_time,
    concat(substr(lpad(`hospital`.`sat_end_time`, 4, '0'),1,2),':',substr(lpad(`hospital`.`sat_end_time`, 4, '0'),3,2)) as sat_end_time,
    concat(substr(lpad(`hospital`.`sun_start_time`, 4, '0'),1,2),':',substr(lpad(`hospital`.`sun_start_time`, 4, '0'),3,2)) as sun_start_time,
    concat(substr(lpad(`hospital`.`sun_end_time`, 4, '0'),1,2),':',substr(lpad(`hospital`.`sun_end_time`, 4, '0'),3,2)) as sun_end_time,
    `hospital`.`sun_holiday`,
    `hospital`.`lunchtime`,
    `hospital`.`holiday`
FROM `mental`.`hospital`;

select lpad(concat(substr(mon_start_time,1,2),':',substr(mon_start_time,3,2)), 5, '0') from hospital;

 -- > 만약 start_time, end_time 이 3자리 숫자라면, 앞에 0을 추가하기 -> 4자리 숫자인 문자를 가운데에 : 추가하기 (ex 00:00)
 
 SELECT count(*) FROM hospital;



SELECT * FROM consultation;


DESCRIBE reservation;
DESCRIBE hospital;
DESCRIBE consultation;
