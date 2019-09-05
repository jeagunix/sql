-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
  select count(emp_no) as '직원수'
    from salaries
    where to_date = '9999-01-01'
      and salary > ( select avg(salary)
					   from salaries);
					
-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요.
-- 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
  select b.emp_no as '사번', concat(b.first_name, ' ', b.last_name) as '이름', avg(c.salary) as '부서 평균연봉', d.avgsalary as '내연봉'
    from dept_emp a, employees b, salaries c,
         ( select b.dept_no, max(a.salary) as maxsalary, avg(a.salary) as avgsalary
									  from salaries a, dept_emp b, employees c
									  where a.emp_no = c.emp_no
                                        and c.emp_no = b.emp_no
                                        and a.to_date = '9999-01-01'
                                        and b.to_date = '9999-01-01'
								   group by b.dept_no) d
   where a.emp_no = b.emp_no
     and b.emp_no = c.emp_no
	 and a.dept_no = d.dept_no
     and a.to_date = '9999-01-01'
     and c.to_date = '9999-01-01'
     and c.salary = d.maxsalary
	order by c.salary desc;



-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 
  select b.dept_no as '부서번호', c.emp_no as '사번', concat(c.first_name, ' ', c.last_name) as '이름', a.salary as '연봉',  d.avgsalary
    from salaries a, dept_emp b, employees c,
		(select avg(a.salary) as avgsalary, b.dept_no
									   from salaries a, dept_emp b, employees c
									  where a.emp_no = c.emp_no
										and b.emp_no = c.emp_no
										and b.to_date = '9999-01-01'
										and a.to_date = '9999-01-01'
								   group by b.dept_no) d
   where a.emp_no = c.emp_no
     and b.emp_no = c.emp_no
     and b.dept_no = d.dept_no
     and b.to_date = '9999-01-01'
     and a.to_date = '9999-01-01'
     and a.salary  > d.avgsalary;

-- 문제4
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
  select c.emp_no, concat(c.first_name, ' ', c.last_name), b.
    from departments a, dept_manager b, employees c
   where a.dept_no = b.dept_no
     and b.emp_no = c.emp_no
     and b.to_date = '9999-01-01';
     




-- 문제5
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
   select c.emp_no, concat(c.first_name, ' ', c.last_name), d.title, a.salary
     from salaries a, dept_emp b, employees c, titles d
	where a.emp_no = c.emp_no
      and b.emp_no = c.emp_no
      and c.emp_no = d.emp_no
      and a.to_date = '9999-01-01'
      and b.to_date = '9999-01-01'
      and d.to_date = '9999-01-01'
	  and b.dept_no = (select a.dept_no
										from dept_emp a, employees b, salaries c
										where a.emp_no = b.emp_no
										and b.emp_no = c.emp_no
										and a.to_date = '9999-01-01'
										and c.to_date = '9999-01-01'
										group by a.dept_no
										order by avg(c.salary) desc
										limit 0,1);
				
    
    select a.dept_no, avg(c.salary)
      from dept_emp a, employees b, salaries c
	 where a.emp_no = b.emp_no
       and b.emp_no = c.emp_no
       and a.to_date = '9999-01-01'
       and c.to_date = '9999-01-01'
       group by a.dept_no
       order by avg(c.salary) desc
       limit 0,1;
   
   
   
                                        
-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 

     


-- 문제7.                 
-- 평균 연봉이 가장 높은 직책?


-- 문제 8
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.
 

