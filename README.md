# 데이터베이스
- 체계적으로 조직된 데이터의 집합
- 다양한 형태(텍스트, 숫자, 파일 등)으로 저장 가능
- 서로 관련성이 있어서 의미 있는 정보 형성
- 여러 사용자가 동시에 접근이 가능, 작업을 수행
- 안전성과 무결성(Integrity) : 데이터의 정확성과 일관성을 유지
- 제약조건(Constraint) 이라고 하는 특성을 가짐
- 보안, 백업 및 복구 등을 보장

## 데이터베이스의 구성요소
- 데이터 : 저장된 원시 정보
- DBMS(DataBase Management System) : 
  데이터베이스를 관리하는 소프트웨어
  - MySQL, Oracle, PostgresSQL, MariaDB 등
- 데이터베이스 서버 : DBMS가 실행되는 컴퓨터 시스템
- 스키마(Schema) : DB의 구조를 정의하는 메타 데이터 집합

## 데이터 모델 (Data Model)
  - 현실세계의 정보를 시스템 내에서 어떻게 구조화하고 조직화할지에 대한 청사진
  - 예) 도서관DB : 책-제목,저자,출판년도 (책에 대한 메타데이터)
  1. 개념적 데이터 모델 (Conceptual) : 높은 수준의 추상화
     - 비전문가나 일반인들도 요구사항을 이해하고 분석할 수 있게 설계
  2. 논리적 데이터 모델 (Logical)
     - 개념적 데이터모델에서 더 구체화
     - 데이터의 속성이나, 키, 관계 등을 명시
     - 특정 DBMS에 의존하지 않고 명시
  3. 물리적 데이터 모델 (Physical)
     - 특정 DBMS에 저장이 될 수 있게,  논리적 데이터 모델을 디테일하게 설계
     - DBA(데이터베이스 관리자) 또는 개발자가 사용

  - 데이터 모델의 종류
    1. 계층형 데이터 모델 (Hierachical 부모-자식관계, 트리 구조)
    2. 네트워크형 데이터 모델 (Network 다 대 다 관계 표현, 구조가 복잡해짐)
    3. 관계형 데이터 모델 ** (Reational, 가장 널리 사용 되는 모델)
    4. 객체 지향 데이터 모델 (Object, 데이터를 객체로 표현)
    5. NoSQL (Not Only SQL) : 비관계형 데이터 모델, (문서, 키-값, 그래프 등), 유연성, 확장성

## 논리적 데이터 모델의 구성 요소
 - 엔티티(Entity) : 실제 세계의 객체 -> 데이터베이스에서 테이블로 표시
   - 각 엔티티는 속성(Attribute)를 가지고 있음.
 - 속성(Attribute) : 엔티티의 특성 -> DB에서는 테이블의 컬럼으로 구현
   - 엔티티를 설명하는 데이터
 - 관계(Relationship) : 엔티티-엔티티 간의 연관성, 상호작용 -> DB에서는 외래키로 표현
 - 키(Key) : 데이터의 무결성을 유지하기 위해 사용되는 특별한 속성
   - *기본 키 (Primary Key)* : 테이블의 행을 고유하게 식별하는 키 NULL 불가
   - *외래 키 (Foreign Key)* : 다른 테이블의 행(기본 키)을 참조하는 키 (관계 정의시 사용)
   - 후보 키 : 데이터베이스에 모든 행을 유일하게 식별할 수 있는 속성들의 집합
   - 대체 키 : 후보 키 중 기본 키로 선택되지 않은 키
   - 복합 키 : 두 개 이상의 속성을 조합하여 만든 키

## 관계형 데이터베이스 모델
  수학 관계대수(Relational Algebra)에서 영감을 받아 데이터의 집합(릴레이션)을
테이블로 표현한 모델
  - 테이블 : 데이터를 저장하는 기본 단위 (릴레이션, 엔티티)
  - 행(Row) : 테이블에서 개별 데이터 항목 (튜플, 레코드)
  - 열(Column) : 테이블에서 데이터의 속성 (애트리뷰트, 필드)
  - 도메인(Domain) : 속성이 가질 수있는 범위, 집합 (Data Type)
  - 스키마 : 데이터베이스의 구조적인 설계 (구조와 제약조건을 정의하는 SQL문)

## 스키마와 상태
  - 스키마 : DB의 구조나 설계
     - 구체적인 데이터 항목이나 값은 포함하지 않음.
     - 데이터베이스 설계과정 초기에 정의되고, 시간이 지나도 상대적으로 변경되지 않음
     - 정적인 특성, 근본적인 요소
  - 상태(Status) : 특정 시점에 데이터베이스 실제로 저장된 데이터베이스의 집합
     - 시간에 따라 변할 수 있고, 지속적으로 업데이트
     - DB의 일관성과 무결성을 유지하기 위해, 스키마의 규칙과 제약조건을 따라야 함.
     - 동적인 특성,  변화하는 데이터의 실체

# 3 Schema Architecture
 1. 내부 스키마 : DB의 물리적 저장 구조, 최하위수준의 추상화
    - 인덱스, 압축, 암호화 등 DBA(데이터베이스 관리자)가 다루는 영역
 2. 개념 스키마 : DB의 전체적인 논리적 구조, 중간수준의 추상화
    - 데이터의 관계, 데이터의 제약조건 등, DB설계자, 분석가가 다루는 영역
 3. 외부 스키마 : 사용자 관점에서 보는 DB의 일부분, 최상위수준 추상화
    - 애플리케이션이 접근하는 View, 최종 사용자, 응용프로그램 개발자가 다루는 영역

# SQL (Struectured Query Language)
 - 관계형 데이터베이스(RDBMS)에서 데이터를 관리하기 위해 사용하는 표준화된 언어

 - 데이터 정의 언어 (Data Definition Language) : DDL
 - 데이터 조작 언어 (Data Manipulation Language) : DML
 - 데이터 질의 언어 (Data Query Language) : DQL
 - 데이터 제어 언어 (Data Control Language) : DCL
 - 트랜잭션 제어 언어 (Transaction Control Language) : TCL

## DCL (Data Control Language)
 - 데이터의 접근 권한을 제어하고 관리하는 명령어들의 집합
 1. GRANT : 권한 부여
   - 특정 사용자나 사용자 그룹에게
   - 특정 데이터베이스(스키마)나 특정 테이블에서
   - 명령할 수 있는 권한 부여
   - 예시
   ```SQL
   GRANT SELECT ON database_name.table_name
   TO '사용자명'@'호스트명';
   ```
 2. REVOKE : 권한 회수
   - 사용자에게 부여된 권한이 더이상 필요하지 않거나
   - 보안 상의 이유로 권한 회수할 때 사용
   ```SQL
   REVOKE SELECT ON database_name.table_name
   FROM '사용자명'@'호스트명';
   ```
- 권한 부여나 회수는 DB의 보안과 직접적인 관련이 있음으로 신중히 할 것.
- 일반적으로 사용자에게 최소한(필요한)의 권한만 부여하는 **최소 권한 원칙** 따름.
- 데이터에 대한무단 접근을 방지하고, 시스템 보안 수준을 높일 수 있음.

* 유저 생성 SQL문
```sql
CREATE USER '사용자명'@'호스트명' IDENTIFIED BY '비밀번호';
```
* 생성한 유저 삭제 SQL문
```sql
DROP USER '사용자명'@'호스트명';
```

## Key

 - 키(Key) : 데이터의 무결성을 유지하기 위해 사용되는 특별한 속성
   - *기본 키 (Primary Key)* => PK
     - 테이블의 행을 고유하게 식별하는 키 
     - 하나 이상의 컬럼의 조합
     - NULL 불가, UNIQUE
     - 테이블 내의 각 레코드(행)을 유일하게 식별할 수 있어야 함.
   - *외래 키 (Foreign Key)* => FK
     - 다른 테이블의 행(기본 키)을 참조하는 키 
     - 두 테이블 간의 관계 정의시 사용
     - 참조 무결성 유지하는데 사용 
   - 후보 키 : 데이터베이스에 모든 행을 유일하게 식별할 수 있는 속성들의 집합
     - 후보키에서 기본키가 선택
   - 대체 키 : 후보 키 중 기본 키로 선택되지 않은 키
   - 복합 키 : 두 개 이상의 속성을 조합하여 만든 키
   - 고유 키 : 모든 행에 대해서 고유한 값을 가져야 하는 속성 (NULL 허용)

## 제약조건 (Constaint)
- 무결성(Integrity) : DB에서 저장된 데이터의 일관성과 정확성을 지키는 것.
   1. NOT NULL
      - 해당 컬럼(속성)에는 NULL 값이 허용되지 않음.
      - 반드시 유효한 값이 있어야 함.
   2. UNIQUE
      - 해당 컬럼의 각 행은 서로 다른 값을 가져야 함.
      - 중복된 값 불가
      - NULL 가능
   3. PRIMARY KEY
      - 각 행을 유일하게 식별할 수 있는 열(또는 열의 조합)
      - NOT NULL, UNIQUE
   4. FOREIGN KEY
      - 한 테이블의 열이 다른 테이블의 PK를 참조
      - 참조 무결성 유지
      - 테이블의 관계를 정의
   5. CHECK
      - 해당 속성(컬럼, 열)에서 입력될 수 있는 데이터의 범위를 제한
      - 조건을 만족하는 데이터만 입력 가능
      - 예시 : 0 < 나이 < 200 : 특정 범위
   6. DEFAULT
      - 해당 속성에 대한 기본 값을 설정
      - 값이 명시 되지 않으면 지정된 기본 값이 자동으로 입력
   7. AUTO_INCREMENT
      - MySQL에서 사용하는 특수 제약조건
      - 기본 키에 주로 사용되고, 새로운 행(row, 레코드)가 추가 될 때마다 자동으로 숫자 증가
   8. BINARY (B)
      - 해당 컬럼이 이진데이터
   9. UNSIGNED
      - 부호가 존재하지 않음. 음수값을 허용하지 않음 => 양수
   10. ZEROFILL
      - 해당 숫자의 열이 특정 길이로 고정되어야 하는 경우
      - 해당길이보다 부족하면 왼쪽에 0이 채워짐
      - 예시. 007
   11. GENERATED
      - 해당 열의 값이 자동으로 생성.
      - 특정 규칙에 따라 숫자가 증가하거나 문자열이 생성 등.

## 속성 데이터 타입
 1. 숫자형 데이터 타입
   - INT : 정수 4byte
   - DECIMAL(M, N) : 고정 소수점 숫자, 정확한 소수 계산에 필요 M 총 자릿수, N 소수점 이하 자릿수
   - FOLAT, DOUBLE : 부동 소수점 소수 4byte, 8byte

 2. 문자열 데이터 타입
   - CHAR(N) : 고정 길이 문자열, N은 문자열의 길이, 문자열이 N보다 짧으면 공백으로 채워짐.
   - VARCHAR(N) : 가변 길이 문자열, N은 문자열의 최대 길이, 실제 사용된 길이만큼만 저장공간 차지. 기본값 : 255 바이트, MYSQL 버전에 따라 최대 바이트가 다름
   - TEXT : 긴 텍스트를 저장 최대 65,535 바이트
   - MEDIUMTEXT : 최대 16MB까지 저장
   - LONGTEXT : 최대 4GB까지 저장

 3. 날짜 시간 데이터타입
   - DATE : 'YYYY-MM-DD'
   - TIME : 'HH:MM:SS'
   - DATETIME : 'YYYY-MM-DD HH:MM:SS'
   - TIMESTAMP : 유닉스 타임스탬프 기반 날짜 시간정보 저장 (1970-01-01 -> 32비트 정수)

 4. 이진 데이터 타입
   - BINARY(N) : 고정길이 이진데이터 (이미지, 파일 등 저장에 사용)
   - VARBINARY(N) : 가변길이
   - BLOB : 이진 대용량 객체 저장에 사용 Binary Large OBject, 4GB 저장

 5. 논리 데이터 타입
   - BOOLEAN : TRUE, FALSE 값 저장, 내부적으로 TINYINT(1)로 처리 => 0 또는 1

 6. 열거형
   - ENUM : 미리 정의된 값 중 하나를 저장 ENUM('mon', 'tue', 'wed' ...)

- 도메인 무결성 제약조건
   - 릴레이션 내 튜플들이 각 속성의 도메인에 지정된 값만 가져야 하는 조건
   - 데이터 타입, null 허용 또는 not null, default, check 제약 조건 등으로 제약조건을 가짐 
 

