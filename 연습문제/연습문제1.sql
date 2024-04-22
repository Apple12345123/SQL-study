DROP SCHEMA IF EXISTS quiz;
CREATE SCHEMA quiz;
USE quiz;

CREATE TABLE employees LIKE employees.employees;
CREATE TABLE salaries LIKE employees.salaries;
INSERT INTO employees SELECT * FROM employees.employees;
INSERT INTO salaries SELECT * FROM employees.salaries;  -- 오류

-- `employees` 테이블에 `last_name` 컬럼에 대한 인덱스를 생성하고, 인덱스의 효과를 확인합니다.
CREATE INDEX last_name ON employees (addr);

-- 1. 인덱스 생성 전 `employees` 테이블에  `last_name` 컬럼을 조건으로 하는 쿼리문을 실행하세요.


-- 2. `EXPLAIN`과 Execution Plan을 사용하여 `last_name`을 조건으로 하는 SELECT 쿼리의 실행 계획을 확인하세요.


-- 3. `employees` 테이블에 `last_name` 컬럼에 대한 인덱스를 생성하세요.
CREATE INDEX last_name ON employees (addr);

-- 4. 인덱스 생성 전후의 쿼리문의 실행 시간을 비교하세요.


-- 5.  `employees` 테이블의 모든 인덱스 정보를 조회하세요.
SHOW INDEX FROM employees;


