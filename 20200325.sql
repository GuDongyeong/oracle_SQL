-- to_number ���� -> ����

SELECT
    '123.67' "1",
    to_number('123.67') "2",
    to_number('123.67', '99999.99') "3", -- ������ ����ɷ¿� ����, ������ ���� ä��� �� �ƴϱ� ������ ����� �������� ����
--    to_number('123.67', '99999.9') "4", -- ����ɷ� �̻��� ���� ������ ����
    to_number('123.67', '99999.99999') "5"
FROM dual;


SELECT 
    67890+11111 "1",
    '67890' + 11111 "2", -- ���ڷ� �ڵ�����ȯ
    to_number('67890') + 11111 "3",
--    '67,890'+11111 "4" -- "invalid number" ����, ���ڰ� �ƴմϴ�. , ����!
--    to_number('67,890')+11111 "5" -- �̰͵� ����, �ڵ�����ȯ ������ ���ڸ� ������ ���̱� ������
    to_number('67,890', '999,999')+11111 "6" -- �̋� ���Ĺ��� �ʿ�
FROM dual;

SELECT 
--    '$78,789'+10000 "1",
    to_number('$78,789', '$999,999,999') + 10000 "2"
FROM dual;


-- to_date  ���� -> ��¥

SELECT
--    '19/10/7' + 5 "1", -- ��¥�� +�� �ϸ� ���ڿ� +��
    to_date('19/10/7') + 30 "2"    
FROM dual;


SELECT
    '12 1 11' "1",
    to_date('12 1 11') "2", -- �����
    to_date('12 1 11', 'YY MM DD') "3", -- �����
    to_date('12 1 11', 'MM DD YY') "4" -- ���ϳ�
FROM dual;


-- NVL
SELECT * FROM emp;

SELECT empno, ename, NVL(comm, 0) comm
FROM emp
ORDER BY comm DESC, ename; -- �̹� NULL�� 0���� �ٲپ� ���ұ� ������ NULLS LAST�� ����� �ʿ䰡 ����

-- NVL2
-- comm�� NULL�̸� sal�� ġȯ
-- comm�� NULL�� �ƴϸ� sal + comm ���� ġȯ

-- NULL �����ʹ� �������� �ʴ� �����ͷ� �����ؼ� ����, �Լ��� ������ ������ ����ϸ� �ƹ��͵� �������� �ʴ´�
SELECT
    ename, sal, comm, sal + comm -- null���� �����ϸ� null���� ����, �������� �ʴ� ���� �Ǿ������
FROM emp;

SELECT 
    ename, NVL2(comm, sal+comm, sal) pay
FROM emp;


-- NULLIF
SELECT
    NULLIF(10, 20) "1",
    NULLIF(20, 10) "2",
    NULLIF(10, 10) "3"
FROM dual;

-- job�÷����� 'SALESMAN'�� ã�´� -> NULL ��ȯ
-- NULL���� NVL�� �̿��� '����' ��ȯ
SELECT empno, ename, job
FROM emp;

SELECT empno, ename, job,
    NULLIF(job, 'SALESMAN') N_IF,
    NVL(NULLIF(job, 'SALESMAN'), '����')
FROM emp;

-- DECODE
SELECT * FROM dept;

SELECT empno, ename, deptno,
    DECODE( deptno,
        10, 'ȸ����',
        20, '������',
        30, '������',
        40, '���',
        '�μ�����' ) dname
FROM emp;


-- CASE ����
SELECT empno, ename, deptno,
    CASE deptno
        WHEN 10 THEN 'ȸ����'
        WHEN 20 THEN '������'
        WHEN 30 THEN '������'
        WHEN 40 THEN '���'
        ELSE '�μ�����'
    END dname
FROM emp;

SELECT empno, ename, deptno,
    CASE
        WHEN job=upper('president') THEN '����' -- ���� ���� ���� �켱������ ����
        WHEN deptno=10 THEN 'ȸ����'
        WHEN deptno=20 THEN '������'
        WHEN deptno=30 THEN '������'
        WHEN deptno=40 THEN '���'
        ELSE '�μ�����'
    END dname
FROM emp;



-- COUNT
SELECT * FROM emp;
SELECT count(*) cnt FROM emp;

SELECT empno FROM emp;
SELECT count(empno) cnt_empno FROM emp;

SELECT mgr FROM emp;
SELECT count(mgr) FROM emp; -- null���� ���� ������ ��޵ǹǷ� 11

SELECT comm FROM emp ORDER BY comm;
SELECT count(comm) FROM emp;

SELECT * FROM emp;
SELECT 'Apple' FROM emp;
SELECT count(*) FROM emp; -- �̰� ����ϸ� ��
SELECT count(1) FROM emp; -- �� ������ ������? ��ü�� ���� �ʿ���� 1�������� �Ǵϱ�.. ������ ���� ������! �����Ǿ���

-- SUM
SELECT sum(sal) tot_sal FROM emp;

-- AVG
SELECT round(avg(sal),2) avg_sal FROM emp;

-- MAX
SELECT max(sal) max_sal FROM emp;


-- MIN
SELECT min(sal) min_sal FROM emp;

SELECT max(ename) FROM emp; -- ���� ������ ���� �ڿ� ���� ��
SELECT min(ename) FROM emp; -- ���� ������ ���� �տ� ���� ��

SELECT
    max(hiredate), --��¥�� ū ���� �ֱٰ�
    min(hiredate) -- ���� ���� ����
FROM emp;

SELECT * FROM emp
ORDER BY deptno;

-- ��ü sal�� ���� �հ�
SELECT sum(sal) FROM emp;

-- �μ��� �޿� �հ�
SELECT
    deptno,
    sum(sal)
FROM emp
GROUP BY deptno -- Į���� �������� ���� ���� �����͵��� �����س��� ��
ORDER BY deptno;


-- �μ��� �ο���
SELECT
    deptno,
    count(*) cnt
FROM emp
GROUP BY deptno;

SELECT
    deptno,
    job
FROM emp
ORDER BY deptno, job;

-- �μ���+������ ��� ��
SELECT
    deptno,
    job,
    count(*) cnt
FROM emp
GROUP BY deptno, job
ORDER BY deptno, job;

-- ���������� �׷��Լ��� ������ ��� �÷��� GROUP BY ���� ���� �Ѵ�, �׷��� �ǹ̾��� �ڵ�
SELECT
    deptno,
    job,
    ename,
    count(*) cnt
FROM emp
GROUP BY deptno, job, ename
ORDER BY deptno, job;

-- ��ȸ �÷�
-- deptno, dname, cnt, tot_sal, avg_sal

-- dname -> �ѱ۷�
-- cnt, tot_sal, avg_sal -> �μ��� ���
-- avg_sal -> �Ҽ��� 2�ڸ�����
SELECT * FROM dept;

SELECT
    deptno,
    DECODE( deptno,
            10, 'ȸ����',
            20, '������',
            30, '������',
            40, '���',
            '�μ� ����') dname,
    count(*) cnt,
    sum(sal) tot_sal,
    round(avg(sal),2) avg_sal
FROM emp
GROUP BY deptno,
        DECODE( deptno,
            10, 'ȸ����',
            20, '������',
            30, '������',
            40, '���',
            '�μ� ����')
ORDER BY deptno;

-- where ������ �׷��Լ��� ����� �� ����
SELECT
    deptno,
    round(avg(sal),2) avg_sal
FROM emp
--WHERE avg(sal) > 2000 
GROUP BY deptno
HAVING avg(sal) > 2000
ORDER BY deptno;

-- JOIN
SELECT * FROM emp
WHERE empno = 7369;

SELECT * FROM dept
WHERE deptno = 20;



SELECT * FROM emp, dept
WHERE emp.deptno = dept.deptno;


-- �� ���̺��� ��� ���� �����ϱ�, ��� ����� ��
SELECT * FROM emp, dept;

-- JOIN
--  emp : 8cols 12rows
--  dept : 3cols 4rows
--  emp x dept : 11cols(8+3) 48rows(12x4)

-- emp, dept ���̺� �� ��ο��� deptno ���� ���� �ุ ����
SELECT * FROM emp, dept
WHERE emp.deptno = dept.deptno;

SELECT empno, ename, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno -- ���� ����, �ǹ��ִ� �����͸� �������� ����, � ����
    AND empno >7800; -- �Ϲ� ��ȸ ����, ���߿� ����

-- ���̺� �̸��� Alias ����
SELECT empno, ename, E.deptno, dname
FROM emp E, dept D
WHERE E.deptno = D.deptno -- ���� ����, �ǹ��ִ� �����͸� �������� ����, � ����
    AND empno >7800; -- �Ϲ� ��ȸ ����, ���߿� ����

-- ANSI INNER JOIN
SELECT empno, ename, E.deptno, dname
FROM emp E
INNER JOIN dept D
    ON E.deptno = D.deptno-- ���� ����
WHERE empno >7800; -- �Ϲ� ����


-- NON-EQUI JOIN, �� ����
SELECT * FROM emp; -- ��� ����
SELECT * FROM salgrade; -- �޿���� ����

SELECT ename, sal, grade
FROM emp, salgrade
WHERE sal BETWEEN losal AND hisal -- ���� ���� 
ORDER BY grade, sal, ename;

-- ANSI ǥ�� ����
SELECT ename, sal, grade
FROM emp
INNER JOIN salgrade
    ON sal BETWEEN losal AND hisal -- ���� ���� 
--WHERE grade = 3
ORDER BY grade, sal, ename;


-- SELF JOIN
SELECT * FROM emp EMPLOYEE;
SELECT * FROM emp MANAGER;

SELECT empno, ename, mgr FROM emp EMPLOYEE;
SELECT DISTINCT mgr FROM emp MANAGER;

SELECT
    E.empno, E.ename, E.mgr, M.empno, M.ename
FROM emp E, emp M
WHERE E.mgr = M.empno; -- ���� ����


-- ANSI
SELECT
    E.empno, E.ename, E.mgr, M.ename mname
FROM emp E
INNER JOIN emp M
    ON E.mgr = M.empno; -- ���� ����
