-- 5.1-1  c1 = 11 AND c2 = 2
SELECT id, c3, c5
FROM   crud
WHERE  c1 = 11 AND c2 = 2;

-- 5.1-2  c1 > 18 OR c2 < 2
SELECT *
FROM   crud
WHERE  c1 > 18 OR c2 < 2;

-- 5.1-3  INSERT (기본값+지정값)
INSERT INTO crud (c1, c2, c3, c5)
VALUES (7, 4, 'col101', 0);

-- 5.1-4  INSERT (id 지정)
INSERT INTO crud (id, c1, c2, c3, c5)
VALUES (103, 3, 3, 'col103', 1);

-- 5.1-5  id > 100
SELECT *
FROM   crud
WHERE  id > 100;

-- 5.1-6  UPDATE 조건행
UPDATE crud
SET    c3 = 'col0',
       c5 = 0
WHERE  c1 > 4 AND c1 < 9 AND c2 = 1;

-- 5.1-7  (6)에서 수정된 행 확인
SELECT *
FROM   crud
WHERE  c1 > 4 AND c1 < 9 AND c2 = 1;

-- 5.1-8  c5 = 0  삭제
DELETE
FROM   crud
WHERE  c5 = 0;

-- 5.1-9  c5 = 0  남은 행 조회
SELECT *
FROM   crud
WHERE  c5 = 0;
