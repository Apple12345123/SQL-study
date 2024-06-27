CREATE DATABASE testMentalCare;
USE testMentalCare;
DROP TABLE IF EXISTS hospital;
CREATE TABLE hospital (
    hospital_id VARCHAR(300),
    hospital_name VARCHAR(255),
    hospital_location VARCHAR(255),
    hospital_website VARCHAR(255),
    hospital_call VARCHAR(255),
    mon_start_time TIME,
    mon_end_time TIME,
    tue_start_time TIME,
    tue_end_time TIME,
    wed_start_time TIME,
    wed_end_time TIME,
    thu_start_time TIME,
    thu_end_time TIME,
    fri_start_time TIME,
    fri_end_time TIME,
    sat_start_time TIME,
    sat_end_time TIME,
    sun_start_time TIME,
    sun_end_time TIME,
    sun_holiday VARCHAR(255),
    lunchtime VARCHAR(300),
    holiday VARCHAR(300),
    PRIMARY KEY (hospital_id)
);

DROP TABLE IF EXISTS reservation;
CREATE TABLE reservation (
	hospital_id VARCHAR(300),
	reservation_date DATE,
    treatment_date DATE,
    treatment_time TIME(6),
    hospital_name BIGINT,
    reservation_id BIGINT NOT NULL AUTO_INCREMENT,
    user_id VARCHAR(255),
    PRIMARY KEY (reservation_id),
    FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id) );

DROP TABLE IF EXISTS consultation;
CREATE TABLE consultation (
	hospital_id VARCHAR(300),
	consultation_id BIGINT NOT NULL AUTO_INCREMENT,
	consultation_details VARCHAR(500),
    my_change VARCHAR(500),
    FOREIGN KEY (hospital_id) REFERENCES hospital(hospital_id) );


SELECT * FROM reservation;
DESCRIBE reservation;
DESCRIBE hospital;
DESCRIBE consultation;