-- 5.3-1  /fare?uid=:uid  – 사용자 총 요금
SELECT COALESCE(
         SUM(
           ROUND(ty.fare_rate * tr.distance / 1000, -2)
         ), 0
       ) AS total
FROM   tickets tk
JOIN   trains  tr ON tr.id = tk.train
JOIN   types   ty ON ty.id = tr.type
WHERE  tk.user = ?;


-- 5.3-2  /train/status?tid=:tid  – 열차 매진 여부
SELECT COUNT(tk.id) AS occupied,
       ty.max_seats
FROM   trains tr
JOIN   types  ty ON ty.id = tr.type
LEFT JOIN tickets tk ON tk.train = tr.id
WHERE  tr.id = ?
GROUP BY ty.max_seats;
