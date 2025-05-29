-- 5.2-1  노선 11 승객 목록
SELECT u.id,
       u.name,
       t.seat_number
FROM   tickets AS t
JOIN   users   AS u ON u.id = t.user
WHERE  t.train = 11
ORDER BY t.seat_number;

-- 5.2-2  사용자별 탑승 수 / 총거리  (TOP 6)
SELECT u.id,
       u.name,
       COUNT(*)         AS trains_count,
       SUM(tr.distance) AS total_distance
FROM   users   AS u
JOIN   tickets AS tk ON tk.user  = u.id
JOIN   trains  AS tr ON tr.id    = tk.train
GROUP BY u.id, u.name
ORDER BY total_distance DESC
LIMIT 6;

-- 5.2-3  노선별 여행시간  (TOP 6)
SELECT tr.id,
       ty.type,
       ss.name                             AS src_stn,
       ds.name                             AS dst_stn,
       TIMEDIFF(tr.arrival, tr.departure)  AS travel_time
FROM   trains   AS tr
JOIN   types    AS ty ON ty.id = tr.type
JOIN   stations AS ss ON ss.id = tr.src_stn
JOIN   stations AS ds ON ds.id = tr.dst_stn
ORDER BY travel_time DESC
LIMIT 6;

-- 5.2-4  노선별 운임·시간 (출발순)
SELECT ty.type,
       ss.name AS src_stn,
       ds.name AS dst_stn,
       tr.departure,
       tr.arrival,
       ROUND(ty.fare_rate * tr.distance / 1000, -2) AS fare
FROM   trains   AS tr
JOIN   types    AS ty ON ty.id = tr.type
JOIN   stations AS ss ON ss.id = tr.src_stn
JOIN   stations AS ds ON ds.id = tr.dst_stn
ORDER BY tr.departure;

-- 5.2-5  예약이 있는 노선의 좌석 현황
SELECT tr.id,
       ty.type,
       ss.name             AS src_stn,
       ds.name             AS dst_stn,
       COUNT(tk.id)        AS occupied,
       ty.max_seats        AS maximum
FROM   trains   AS tr
JOIN   types    AS ty ON ty.id = tr.type
JOIN   stations AS ss ON ss.id = tr.src_stn
JOIN   stations AS ds ON ds.id = tr.dst_stn
JOIN   tickets  AS tk ON tk.train = tr.id
GROUP BY tr.id, ty.type, ss.name, ds.name, ty.max_seats
ORDER BY tr.id;

-- 5.2-6  모든 노선 좌석 현황 (예약 없어도 포함)
SELECT tr.id,
       ty.type,
       ss.name             AS src_stn,
       ds.name             AS dst_stn,
       COUNT(tk.id)        AS occupied,
       ty.max_seats        AS maximum
FROM   trains   AS tr
JOIN   types    AS ty ON ty.id = tr.type
JOIN   stations AS ss ON ss.id = tr.src_stn
JOIN   stations AS ds ON ds.id = tr.dst_stn
LEFT JOIN tickets AS tk ON tk.train = tr.id
GROUP BY tr.id, ty.type, ss.name, ds.name, ty.max_seats
ORDER BY tr.id;
