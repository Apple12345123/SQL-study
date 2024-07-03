USE mental;
DROP TABLE IF EXISTS hospital;

TRUNCATE hospital;
CREATE TABLE hospital (
    hospital_id VARCHAR(255),
    hospital_name VARCHAR(255) NOT NULL,
    hospital_loc_code VARCHAR(255) NOT NULL,
    hospital_location VARCHAR(255) NOT NULL,
    hospital_website VARCHAR(255),
    hospital_call VARCHAR(255),
    PRIMARY KEY (hospital_id)
);

DROP TABLE IF EXISTS hospital_detail;
CREATE TABLE hospital_detail (
	hospital_id VARCHAR(255),
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
	hospital_id VARCHAR(255) NOT NULL,
    consultation_id BIGINT,
	reservation_date DATE NOT NULL,
    reservation_time TIME NOT NULL, -- NOT NULL, 
    -- treatment_time TIME(6) NOT NULL,
    reservation_id BIGINT NOT NULL AUTO_INCREMENT,
    user_id VARCHAR(255) NOT NULL,
    PRIMARY KEY (reservation_id),
    FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id)
);

ALTER TABLE  `mental`.`reservation` 
ADD CONSTRAINT `reservation_ibfk_2`
FOREIGN KEY (consultation_id) REFERENCES consultation(consultation_id) ON DELETE CASCADE;

ALTER TABLE  `mental`.`reservation` 
DROP  CONSTRAINT `reservation_ibfk_1`;


DESCRIBE reservation;
DROP TABLE IF EXISTS consultation;
CREATE TABLE consultation (
	reservation_id BIGINT NOT NULL,
	consultation_id BIGINT NOT NULL AUTO_INCREMENT,
	consultation_details VARCHAR(500),
    my_change VARCHAR(500),
    picture BLOB,
    PRIMARY KEY (consultation_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id) );

ALTER TABLE  `mental`.`consultation` 
DROP  CONSTRAINT `consultation_ibfk_1`;

ALTER TABLE  `mental`.`consultation` 
ADD CONSTRAINT `consultation_ibfk_1`
FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`) ON DELETE CASCADE;


SELECT * FROM reservation;
SELECT * FROM consultation;


 -- SELECT count(*) FROM hospital;
SELECT * FROM hospital ORDER BY hospital_name DESC;
SELECT * FROM hospital_detail;

-- hospital와 hospital_detail을 innerjoin하기
 
create table hospital_tmp
 select * from hospital_first INNER JOIN hospital_detail USING (hospital_id);
 
select * from hospital;

DROP TABLE IF EXISTS hospital;
create table hospital
SELECT `hospital_tmp`.`hospital_id`,
    `hospital_tmp`.`hospital_name`,
    `hospital_tmp`.`hospital_loc_code`,
    `hospital_tmp`.`hospital_location`,
    `hospital_tmp`.`hospital_website`,
    `hospital_tmp`.`hospital_call`,
    concat(substr(lpad(`hospital_tmp`.`mon_start_time`, 4, '0'),1,2),':',substr(lpad(`hospital_tmp`.`mon_start_time`, 4, '0'),3,2)) as mon_start_time,
    concat(substr(lpad(`hospital_tmp`.`mon_end_time`, 4, '0'),1,2),':',substr(lpad(`hospital_tmp`.`mon_end_time`, 4, '0'),3,2)) as mon_end_time,
    concat(substr(lpad(`hospital_tmp`.`tue_start_time`, 4, '0'),1,2),':',substr(lpad(`hospital_tmp`.`tue_start_time`, 4, '0'),3,2)) as tue_start_time,
    concat(substr(lpad(`hospital_tmp`.`tue_end_time`, 4, '0'),1,2),':',substr(lpad(`hospital_tmp`.`tue_end_time`, 4, '0'),3,2)) as tue_end_time,
    concat(substr(lpad(`hospital_tmp`.`wed_start_time`, 4, '0'),1,2),':',substr(lpad(`hospital_tmp`.`wed_start_time`, 4, '0'),3,2)) as wed_start_time,
    concat(substr(lpad(`hospital_tmp`.`wed_end_time`, 4, '0'),1,2),':',substr(lpad(`hospital_tmp`.`wed_end_time`, 4, '0'),3,2)) as wed_end_time,
    concat(substr(lpad(`hospital_tmp`.`thu_start_time`, 4, '0'),1,2),':',substr(lpad(`hospital_tmp`.`thu_start_time`, 4, '0'),3,2)) as thu_start_time,
    concat(substr(lpad(`hospital_tmp`.`thu_end_time`, 4, '0'),1,2),':',substr(lpad(`hospital_tmp`.`thu_end_time`, 4, '0'),3,2)) as thu_end_time,
    concat(substr(lpad(`hospital_tmp`.`fri_start_time`, 4, '0'),1,2),':',substr(lpad(`hospital_tmp`.`fri_start_time`, 4, '0'),3,2)) as fri_start_time,
    concat(substr(lpad(`hospital_tmp`.`fri_end_time`, 4, '0'),1,2),':',substr(lpad(`hospital_tmp`.`fri_end_time`, 4, '0'),3,2)) as fri_end_time,
    concat(substr(lpad(`hospital_tmp`.`sat_start_time`, 4, '0'),1,2),':',substr(lpad(`hospital_tmp`.`sat_start_time`, 4, '0'),3,2)) as sat_start_time,
    concat(substr(lpad(`hospital_tmp`.`sat_end_time`, 4, '0'),1,2),':',substr(lpad(`hospital_tmp`.`sat_end_time`, 4, '0'),3,2)) as sat_end_time,
    concat(substr(lpad(`hospital_tmp`.`sun_start_time`, 4, '0'),1,2),':',substr(lpad(`hospital_tmp`.`sun_start_time`, 4, '0'),3,2)) as sun_start_time,
    concat(substr(lpad(`hospital_tmp`.`sun_end_time`, 4, '0'),1,2),':',substr(lpad(`hospital_tmp`.`sun_end_time`, 4, '0'),3,2)) as sun_end_time,
    `hospital_tmp`.`sun_holiday`,
    `hospital_tmp`.`lunchtime`,
    `hospital_tmp`.`holiday`
FROM `mental`.`hospital_tmp`;

ALTER TABLE `mental`.`hospital` 
ADD PRIMARY KEY (`hospital_id`);
;

select lpad(concat(substr(mon_start_time,1,2),':',substr(mon_start_time,3,2)), 5, '0') from hospital;

 -- > 만약 start_time, end_time 이 3자리 숫자라면, 앞에 0을 추가하기 -> 4자리 숫자인 문자를 가운데에 : 추가하기 (ex 00:00)
 
 SELECT count(*) FROM hospital;



SELECT * FROM consultation;


DESCRIBE reservation;
DESCRIBE hospital;
DESCRIBE consultation;
