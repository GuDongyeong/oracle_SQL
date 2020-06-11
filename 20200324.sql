
-- ������ ���� ������ ||
SELECT 
    ename || ' is ' || job AS EMPLOYEE
FROM emp;

-- ' '�� ǥ���� ���� �ȿ��� '�� ����ϰ� ������ ''�� ���
SELECT -- SMITH'S job is CLERK
    ename || '''s job is ' || job AS EMPLOYEE
FROM emp;

-- SQL Function

-- ���� �� �Լ�, Single Row Function
-- length() ���̸� ���ִ� �Լ�
SELECT ename, length(ename)AS len FROM emp; -- Single Row

-- ��ȸ�Ǵ� ����� �� ���� ���ִ� �׷��Լ� count()
SELECT count(*) FROM emp;

-- DUAL���̺�, �׽�Ʈ������ ���� ������ ��
SELECT 1 FROM emp;
-- emp���̺��� ���� ��ȸ, ù��° ���� ���� ���� ����, ���� ��...
SELECT 1 + 2 FROM emp;

SELECT 1 FROM dual;
SELECT 1 + 2 FROM dual;

SELECT 1+2 "FIRST", 6*5 SECOND, 5-7 THIRD FROM dual;

-- SQL Function
-- abs(), Absolute
SELECT abs(-44) FROM dual;
SELECT abs(-5678.1234) FROM dual;
SELECT abs(sal) FROM emp;

-- ���� �Լ� ����
-- 12.523 -> �Ҽ������� �ݿø�
SELECT round(12.523) FROM dual;
-- -12.723 -> �Ҽ������� �ݿø�
SELECT round(-12.723) FROM dual;
-- 12.567 -> �Ҽ��� 3°�ڸ����� �ݿø�
SELECT round(12.567, 2) FROM dual;
-- 12345 -> 1�� �ڸ����� �ݿø�
SELECT round(12345, -1) FROM dual;
-- 56789 -> 10�� �ڸ����� �ݿø�
SELECT round(56789, -2) FROM dual;
-- 12.456 -> �Ҽ������� ����
SELECT trunc(12.456) FROM dual;
-- 12.456 -> �Ҽ��� 3°�ڸ����� ����
SELECT trunc(12.456, 2) FROM dual;
-- 12345 -> 1���ڸ����� ����
SELECT trunc(12345, -1) FROM dual;
-- 56789 -> 10���ڸ����� ����
SELECT trunc(56789, -2) FROM dual;
-- 13�� 8�� ���� ������
SELECT mod(13, 8) FROM dual;
-- 12.345 �ø� -> 13
SELECT ceil(12.345) FROM dual;
-- -12.567 �ø� -> -12
SELECT ceil(-12.345) FROM dual;
-- 12.567 ���� -> 12
SELECT floor(12.567) FROM dual;
-- 12.123 ���� -> 12
SELECT floor(12.123) FROM dual;
-- -12.567 ���� -> -13
SELECT floor(-12.567) FROM dual;
-- -12.123 ���� -> -13
SELECT floor(-12.123) FROM dual;
-- 3�� 4���� -> 81
SELECT power(3, 4) FROM dual;
-- 3�� -1 ���� -> 0.33333333333
SELECT power(3, -1) FROM dual;
-- 9�� ������ -> 3
SELECT sqrt(9) FROM dual;
-- 11�� ������ -> 3.3166...
SELECT sqrt(11) FROM dual;


-- ���� �Լ�

-- length()
SELECT 
    length('Apple') len1,
    length('�ȳ�') len2,
    length('Hello ����Ŭ') len3
FROM dual;

-- lengthb() - ����Ʈ ����, �ѱ� ���ڵ� ���  XE������ UTF-8, �ѱ��� 3����Ʈ�� ó��, SE������ 2����Ʈ?
SELECT 
    lengthb('Apple') len1,
    lengthb('�ȳ�') len2,
    lengthb('Hello ����Ŭ') len3
FROM dual;


-- ĳ���ͼ�(���ڵ�) Ȯ��
SELECT * FROM nls_database_parameters
WHERE parameter = 'NLS_CHARACTERSET';


-- ���� �Լ� ����

-- 'hELlo' ��� �빮�ڷ� ��ȯ -> HELLO
SELECT upper('hELlo') FROM dual;
-- 'hELlo' ��� �ҹ��ڷ� ��ȯ -> hello
SELECT lower('hELlo') FROM dual;
-- 'hELlo' �̴ϼ�(ù����) �빮�� -> Hello
SELECT initcap('hELlo hI') FROM dual; -- initial Capital

SELECT * FROM tabs
WHERE table_name = upper('emp');

-- 'Alice Bob'�� ���ڿ� ���� -> 9
SELECT length('Alice Bob') FROM dual;
-- '�ȳ��ϼ���'�� ���ڿ� ���� -> 5
SELECT length('�ȳ��ϼ���') FROM dual;
-- 'Alice Bob' ���ڿ� ����Ʈ �� -> 9
SELECT lengthb('Alice Bob') FROM dual;
-- 'ACE �ȳ��ϼ���'���ڿ� ����Ʈ �� -> 19
-- (����Ŭ�� �ѱ� ���ڵ��� UTF-8�� �⺻���� �ϸ�
--  UTF-8�� �ѱ� �ѱ��ڿ� 3����Ʈ�� �ʿ��ϴ�)
SELECT lengthb('ACE �ȳ��ϼ���') FROM dual;

-- 'ABCDEFGHI'���� 'D' �� ��ġ -> 4
SELECT instr('ABCDEFGHI', 'D') FROM dual;
-- 'ABCDEFGHI'���� 'DEF'���ڿ��� ��ġ ->4
SELECT instr('ABCDEFGHI', 'DEF') FROM dual;
-- 'ABCDEFGHI'���� 'DF'���ڿ��� ��ġ -> 0
SELECT instr('ABCDEFGHI', 'DF') FROM dual;
-- '�ȳ��ϼ���'���� '��'���ڿ��� ��ġ -> 3
SELECT instr('�ȳ��ϼ���', '��') FROM dual;
SELECT instrb('�ȳ��ϼ���', '��') FROM dual; -- '��'�� ���° ����Ʈ�� �����ϴ°�
-- 'ABCABCDDD'���� 'C'���ڿ��� ��ġ -> 3
SELECT instr('ABCABCDDD', 'C') FROM dual;
--'Oracle SQL Developer'���� 5��° �ε��� ������ ���ڿ��� �ڸ���
SELECT substr('Oracle SQL Developer', 6) FROM dual;
--'Oracle SQL Developer'���� 5��° �ε������� 5���ڷ� �ڸ���
SELECT substr('Oracle SQL Developer', 6, 5) FROM dual;
--'����Ŭ SQL'���� 2��° �ε������� 5���ڷ� �ڸ���
SELECT substr('����Ŭ SQL', 3, 5) FROM dual;
SELECT substrb('����Ŭ SQL', 2, 5) FROM dual; -- ��ġ�� ����Ʈ�� �������� ó��
--'�ȳ��ϼ������Ŭ'���� 3��° ���� �ڸ���
SELECT substr('�ȳ��ϼ������Ŭ', 3) FROM dual;

-- �е�, Padding
--  ���ڸ� ǥ���ϱ� ���ؼ� ������ Ȯ���ϰ� ���ڸ� ä���ְ� �� ������ ������ ������ ���ڷ� ä���
-- ���������ϱ� ���� ���

-- LEFT PADDING : lpad() -- ������ ����
SELECT lpad('SQL', 10) FROM dual;
SELECT lpad(ename, 10) FROM emp;

-- ��ĭ ä�� ����
SELECT lpad('SQL', 10, '*') FROM dual;
SELECT lpad(ename, 10, '*') FROM emp;
SELECT lpad(ename, 10, '-_-^') FROM emp;

SELECT lpad('ABCDEFGH', 5) FROM dual;

-- RIGHT PADDING : rpad()
SELECT rpad('SQL', 10, '*') FROM dual;
SELECT rpad('SQL', 10) FROM dual;

-- TRIM
-- ������ �� ���ܿ� �ִ� ' '(����, ����)�� �����ϴ� �Լ�
SELECT '    SQL    ',
    ltrim('    SQL    '),
    rtrim('    SQL    '),
    trim('    SQL    '),
    ltrim(rtrim('    SQL    '))
FROM dual;


-- ��¥ �Լ�, DATETIME

-- ��ǻ�Ͱ� ���� ���� ��¥
SELECT sysdate FROM dual;

-- ��¥ �ð� Ÿ�� -> ����Ÿ��(���� ����)
SELECT
    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') now
FROM dual;

-- MONTHS_BETWEEN : ���� �� ����
SELECT 
    months_between('20-01-01', '20-02-01') "A",
    round(months_between('20/02/15', '20/02/01'), 2) "B",
    round(months_between(sysdate, '20/02/01'), 2) "C"
FROM dual;

-- next_day : ������ ������ �ٰ����� ��¥ ���ϱ�
SELECT
    next_day(sysdate, '��')
FROM dual;

-- trunc(number) 
-- trunc(datatime) �Լ� : �ð��� ����(00:00:00)���� �ʱ�ȭ

SELECT
    sysdate -- �ð��� �������� 
FROM dual;

SELECT
    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') now,
    to_char(trunc( sysdate ), 'YYYY/MM/DD HH24:MI:SS') now
FROM dual;

-- ���̴� ����� ������ �ð��� ���ԵǾ��־� ���� �ٸ� ���� ������
SELECT
    sysdate,
    trunc(systable)
FROM dual;


-- to_char(number)
-- to_char(number, fmt) : ���Ĺ��ڸ� �̿��� ��ȯ
SELECT
    12345 "0",
    to_char(12345) "1", -- number -> varchar2 = '12345'
    length(to_char(12345)) "3",
    length(12345) "4", -- ���� ��ȯ�� �ʿ� ������, �ڵ� ����ȯ(��κ� ����, ���� ���̿��� �Ͼ��)
    to_char(12345, '99') "5", -- ���ڰ� ������ �� �ִ� �ִ� ���̰� 2������ ���ڿ� ���� �ǹ�
    to_char(12345, '9999999999') "6",
    to_char(12345, '0000000000') "7", -- 9�� ���� ������ �������� 0�� 0���� �е�
    to_char(12345, '9990000000') "8"
FROM dual;

SELECT
    to_char(12345.6789) "1",
    to_char(12345.6789, '99999.9') "2", -- �ڸ����� �����ϸ� �ݿø��Ͽ�ó��
    to_char(12345.6789, '9,999,999.99') "3", -- ������ ���� ������ ��ĭ, ,�߰�
    to_char(12345.6, '9,999,999.9999') "4" -- ������ ���� ������ ��ĭ, �Ҽ����� 0���� �е�
FROM dual;

SELECT
    to_char(12345) "1",
    to_char(12345, '$99,999,999') "2",
    to_char(12345, '$999') "3", -- �ڸ��� �����ϸ� #���� ����
    trim(to_char(12345, 'L99,999,999')) "4" -- LOCALE : �̹� ����Ǿ��ִ� ��, ���, ��ȭ, ����, Ÿ���� �� ȯ�� ����
FROM dual;

-- to_char(datetime)
SELECT 
--    sysdate
--    to_char(sysdate, 'SCC') -- ����

--    to_char(to_date('369/1/7'), 'SCC') -- ���ڴ� ��¥�� �ڵ�����ȯ���� �ʴ� ��찡 �����Ƿ� �������� ���־���Ѵ�

--    to_char(sysdate, 'YEAR'),
--    to_char(sysdate, 'year'),
--    to_char(sysdate, 'Year')
 
--    to_char(sysdate, 'YYYY'),
--    to_char(sysdate, 'YY'),
--    to_char(sysdate, 'YYY'),
--    to_char(sysdate, 'Y'),
--    to_char(sysdate, 'YYYYYY') -- YYYY YY
    
--    to_char(sysdate, 'MM'), -- ���� ��
--    to_char(sysdate, 'MONTH'), -- ���� ��
--    to_char(sysdate, 'MON') -- ���� �� ���

--    to_char(sysdate, 'Q') -- �б�

--    to_char(sysdate, 'DD'),-- �� ���� �ϼ�
--    to_char(sysdate, 'D'), -- �� ���� �ϼ�, ����
--    to_char(sysdate, 'DDD') -- �� ���� �ϼ�

--    to_char(sysdate, 'DAY'), -- ����   
--    to_char(sysdate, 'DY') -- ���� ���

--    to_char(sysdate, 'HH'), -- 12�ð� ���� �ð�
--    to_char(sysdate, 'HH12'), --12�ð� ���� �ð�
--    to_char(sysdate, 'HH24') -- 24�ð� ���� �ð�

--    to_char(sysdate, 'MI') -- ��    

--    to_char(sysdate, 'AM'),    
--    to_char(sysdate, 'PM'),    
--    to_char(sysdate, 'A.M'),    
--    to_char(sysdate, 'P.M') 

    to_char(sysdate, 'FF') -- �и���    
FROM dual;

SELECT sysdate, systimestamp FROM dual;

SELECT
    to_char(systimestamp, 'FF'),
    to_char(systimestamp, 'FF1'), -- 1/10 ��
    to_char(systimestamp, 'FF2'), -- 1/100��
    to_char(systimestamp, 'FF3') -- 1/1000��
FROM dual;

SELECT
    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS DAY')
FROM dual;

SELECT * FROM emp
--WHERE to_char(hiredate, 'Q') =3; -- 3�б⿡ �Ի��� �����
WHERE hiredate >= '81/07/01' AND hiredate < '81/10/1';

