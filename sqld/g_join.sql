-- *** JOIN
-- 하나 이상의 테이블에서 데이터를 조회하기 위해 사용
-- 수행결과는 하나의 RESULT SET으로 나온다.
-- 관계형 데이터베이스에서는 데이터의 중복을 최소화하고 이상현상을 방지하기 위해 데이터를 테이블에 알맞가 분리하여 저장하고
-- 테이블간의 관계를 통해 필요한 데이터를 조합하여 사용하기 때문.

--모든 사원의 직원번호, 직원명, 부서코드, 부서명을 조회
select emp_id, emp_name, dept_code, dept_id, dept_title
from employee e join department d
on(e.dept_code = d.dept_id)
where emp_name = '전지연';

--0. CROSS JOIN (안씀)
--Cartensian곱이 발생
--한 쪽 테이블의 한 행과 다른 테이블의 모든 행이 결합되는 방식
select * 
from employee cross join department
order by emp_id desc;

--1. inner join, outer join(left outer join, right outer join, full outer join)
-- 1. inner join (등가 조인)
-- join 조건문을 작성해 조건문에 부합하는 row들만 join을 수행
-- 사원아이디, 사원명, 직급코드, 직급명
select emp_id, emp_name, e.job_code, j.job_code, job_name
from employee e
inner join job j
on(e.job_code = j.job_code);

select emp_id, emp_name, job_code, job_name
from employee e
inner join job j
using(job_code);

--2. n개의 테이블 결합하기
-- 사원번호, 사원명, 부서코드, 부서명, 부서지역명
select emp_id, emp_name, dept_code, dept_title, local_name
from employee e
inner join department d on(e.dept_code = d.dept_id)
inner join location l on (d.location_id = l.local_code);

--SELF JOIN
-- 사원명, 부서코드, 메니저 아이디, 메니저 이름
select e.emp_name, e.dept_code, e.manager_id, m.emp_name
from employee e
inner join employee m
on(e.manager_Id = m.emp_id);


-- outer join
--1. left [outer] join
select *
from job left join employee using(job_code) order by job_code;

--2. right [outer] join
select *
from employee right join job using(job_code) order by job_code;

--3. full [outer] join
select *
from employee full outer join job using(job_code) order by job_code;


--이름에 '형'이 들어가는 사원의 사원ID, 사원이름, 직업명을 출력하세요 


--부서명이 D5, D6 인 사원의 이름, 직업명, 부서코드, 부서명을 출력하세요


--부서가 위치한 국가가 한국이나 일본인 사원의
--이름, 부서명, 지역명, 국가명을 출력하시오
-- employee, department, location, national 


