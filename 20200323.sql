-- scott/tiger ����...

-- ����� ������ ���̺� ��ȸ
-- ( tabs ) �ڷ����
SELECT * FROM tabs;

-- ���̺��� ����(��Ű��) ������ Ȯ��
DESC emp;

-- ���̺��� ������ Ȯ��
SELECT * FROM emp;

-- �ּ�, Comment
-- ���� �ּ� ����� : ctrl + /


-- SELECT ����

-- ��ü �÷� ��ȸ
SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM salgrade;
SELECT * 
FROM bonus;

-- �κ� �÷�(������ �÷�) ��ȸ
SELECT
    empno, ename, job 
FROM emp;

-- ��ȸ�Ǵ� �÷��� ��Ī(Alias)�� �����ϱ�
SELECT
    empno AS "���", -- �����ȣ, as ������ ���� �̸��� �ٲ㼭 �����ش�
    ename "�̸�" -- ����̸�, as ��� ����
FROM emp;

desc emp;
select empno, ename, job from emp;


-- WHERE�� (������)

-- ��������鸸 ��ȸ�ϱ�
SELECT * FROM emp
WHERE job = 'SALESMAN';
-- ����, ����, ��¥ : ���ڴ� ''�� ǥ��
-- = ����񱳿�����

-- ��ü ����� �� �޿��� 2000�� �Ѵ� ���
SELECT * FROM emp
WHERE sal > 2000;

-- �޿��� 2500�� �Ѱ� �����ڰ� �ƴ� ���
SELECT * FROM emp
WHERE sal > 2500
--    AND job != 'MANAGER';
    AND NOT(job = 'MANAGER');
    
    
    
-- BETWEEN a AND b
-- �����ȣ�� 7700 ~ 7900�� ��� ��ȸ
SELECT empno, ename FROM emp
WHERE empno BETWEEN 7700 AND 7900;

-- ��� �̸��� 'ALLEN' ~ 'KING' ������ ��� ��ȸ, ���ڴ� ���� �������, ASCII CODE��
SELECT empno, ename FROM emp
--WHERE ename BETWEEN 'ALLEN' AND 'KING';

-- �ݴ� ���
--WHERE NOT(ename BETWEEN 'ALLEN' AND 'KING');
WHERE ename NOT BETWEEN 'ALLEN' AND 'KING';

-- ������ ��ü�� ��ҹ��ڸ� ���������� Ű����, Į���� ���� ��ҹ��ڻ�������ϴ�
-- ������Ҵ� �빮��, �ĺ��ڴ� �ҹ���


-- IN(list)
SELECT empno, ename FROM emp
WHERE empno IN ( 7369, 7521, 7654, 7777, 8888, 7878);


-- NOT IN( list )
SELECT empno, ename FROM emp
WHERE empno NOT IN ( 7369, 7521, 7654, 7777, 8888, 7878);
--WHERE NOT(empno IN ( 7369, 7521, 7654, 7777, 8888, 7878));


SELECT empno, ename FROM emp
WHERE ename IN('SMITH', 'ALLEN', 'KING', 'ALICE');


-- LIKE
SELECT empno, ename FROM emp
--WHERE ename LIKE '%R%'; -- �̸��� R�� �����ϴ� ���
--WHERE ename LIKE '_A%'; -- �̸��� �ι�°�� A�� ���
--WHERE ename LIKE '%RD'; -- �̸��� RD�� ������ ���
WHERE ename NOT LIKE '%R%'; -- �̸��� R�� �������� �ʴ� ���

-- ���ǻ��� : LIKE �����ڿ� IN�����ڸ� ���� ����ϴ� ������ ����, �Ʒ�ó�� �ѹ� �� ���־�� ��
SELECT empno, ename FROM emp
WHERE ename LIKE '%R%'
    OR ename LIKE '%L%';

-- ������� ���� LIKE���� �� ��, 
-- ���ľ��� �����(equal)�� �� ������ LIKE�����ڸ� ����ϸ� �ȵȴ�( Full-Scan �߻� )
SELECT empno, ename FROM emp
--WHERE empno LIKE '7654'; -- ������ full��ĵ�� ���� �Ͼ��, ���ɿ� �ǿ���
WHERE empno = '7654'; -- �ε����� �����ִ� �÷��̶�� �ε�����ĵ�� �켱 �Ѵ�


SELECT * FROM emp
--WHERE mgr = NULL; -- NULL���� �ƿ� ���� ���̹Ƿ� ��ĵ�� �� NULL���� ��ȸ���� �ʴ´�
WHERE mgr IS NULL;

-- WHERE �� ����
SELECT * FROM emp;

-- �μ���ȣ�� 30�̰� ������ ����
SELECT empno, ename, deptno FROM emp
WHERE deptno = 30 
    AND job = 'SALESMAN';
    
-- �μ���ȣ�� 30�̰� ������ ������ �ƴ� ���
SELECT empno, ename, deptno FROM emp
WHERE deptno = 30
    AND job != 'SALESMAN';
    
-- �μ���ȣ�� 30�� �ƴϰ� ������ ������ �ƴ� ��� ��ȸ
SELECT empno, ename, deptno FROM emp
WHERE deptno != 30
    AND job != 'SALESMAN';
    
-- �����ȣ�� 7782���� 7900 ������ ��� ��ȸ
SELECT empno, ename, deptno FROM emp
WHERE empno BETWEEN 7782 AND 7900;

-- ������� A���� C�� �����ϴ� ��� ��ȸ
SELECT empno, ename, deptno FROM emp
WHERE ename >= 'A'
    AND ename < 'D';
--WHERE ename LIKE 'A%'
--    OR ename LIKE 'B%'
--    OR ename LIKE 'C%'; -- Ǯ��ĵ�� �� ������ ����, �ε�����ĵ�� ���ɼ��� ���δ�
--WHERE ename < 'D';
--WHERE ename BETWEEN 'A' AND 'C~'; -- ~�� �ƽ�Ű�ڵ尪�� ������ ��ȣ

-- %�� LIKE�� ���϶��� �����ϴ�
    
-- �μ���ȣ�� 10 �Ǵ� 50�� ��� ��ȸ(IN���)
SELECT empno, ename, deptno FROM emp
WHERE deptno IN (10, 30);

--  ORDER BY ��
SELECT * FROM emp
--ORDER BY empno;
ORDER BY ename DESC;

-- �μ���ȣ ��������, �μ� �� �̸� ��������, �������� ��� ��������
SELECT * FROM emp
ORDER BY deptno ASC, ename DESC, empno;

-- NULL���� ���� ū������ ���
SELECT empno, ename, comm FROM emp
ORDER BY comm DESC NULLS LAST; -- NULLS : �� ���� ���� �߰� ����, NULL���� ����������
--ORDER BY comm ASC NULLS FIRST; -- NULL���� ó������

SELECT empno, ename, comm, deptno FROM emp
--WHERE comm IS NOT NULL
ORDER BY comm DESC NULLS LAST, ename, empno;

-- ��ȸ���� �ʴ� �÷��� �̿��ؼ��� ���ı������� ���� �� �ִ�
SELECT empno, ename, comm FROM emp
ORDER BY sal DESC, comm DESC;

-- DISTINCTŰ����
SELECT DISTINCT 
    deptno
FROM emp
ORDER BY deptno;

SELECT empno, ename FROM emp;

--������ ���ΰ� ���� ���� ������ �־�� �ߺ����� ó���Ѵ�
SELECT DISTINCT empno, ename FROM emp;

SELECT DISTINCT
    deptno, ename
FROM emp
ORDER BY deptno, ename;

SELECT DISTINCT
    job
FROM emp
ORDER BY job;

SELECT DISTINCT
    deptno, job
FROM emp
ORDER BY deptno, job;