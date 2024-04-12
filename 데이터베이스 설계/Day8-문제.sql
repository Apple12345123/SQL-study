USE mydb;

-- 클래스 정보 추가
INSERT INTO class (class_name, start_time, end_time, Trainner_trainner_name)
VALUES ('오전 요가', '9:00', '10:00', '박서준');

INSERT INTO class
VALUES ('저녁 웨이트 트레이닝', '20:00', '21:00', '최유리');

SELECT * FROM class;		-- 확인
DESC class;

-- 트레이너 정보 추가
INSERT INTO trainner (trainner_name, specialization)
VALUES ('박서준', '필라테스');

INSERT INTO trainner
VALUES ('최유리', '에어로빅');

SELECT * FROM trainner;		-- 확인

-- 회원 정보 추가
INSERT INTO member (mamber_name, phone_number, address)
VALUES ('김지수', '서울시 강남구 역삼동', '010-1234-5678');

INSERT INTO member
VALUES ('이태민', '서울시 서초구 반포동', '010-8765-4321');

SELECT * FROM member;		-- 확인

-- 등록 정보 추가
INSERT INTO class_registration (mamber_name, class_name, Member_mamber_name, Class_class_name)
VALUES ('김지수', '필라테스', '이태민', '에어로빅');

SELECT * FROM class_registration;		-- 확인



