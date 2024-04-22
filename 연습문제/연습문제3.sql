/*
문제3. 스토어드 프로시저 작성


같은 스키마의 `salaries` 테이블을 이용해서 스토어드 프로시저를 작성하세요.

1.  입력 매개변수 :  직원의 ID(emp_no)와 연도(year)를 입력받습니다.

2. 입력받은 연도에 해당 직원이 받은 급여 정보(급여 salary와 해당 급여의 시작 날짜 from_date)를 조회합니다.

3. 스토어드 프로시저를 작성하고 호출합니다.

 - 호출 및 예시

 CALL GetEmployeeSalariesByYear(10001, 2000);

| salary  |  from_date |
| ------- | ---------- |
| 85,112  | 2000-06-22 |
*/

USE quiz;

select * from salaries;

DELIMITER $$
CREATE PROCEDURE getEmployeeSalariesByYear (IN empNo INT, IN year INT)
BEGIN
	SELECT * FROM salaries WHERE (emp_no = empNo) AND (year = year(from_date));
END$$
DELIMITER ;

CALL getEmployeeSalariesByYear(10001, 2000);