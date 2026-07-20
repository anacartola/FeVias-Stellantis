-- ============================================================================
-- Query 04 — Trip activity and in-progress runs per locomotive
--
-- Business question:
--   "How many trips has each locomotive logged, how many are still in progress
--    (no arrival recorded), and how long do completed trips take on average?"
--
-- Why it matters:
--   Utilization and live status in one view. In-progress trips (null arrival)
--   are the fleet currently on the network; average duration feeds scheduling
--   and battery-range planning. Reads the trip log (t_sif_registro).
-- ============================================================================

SET LINESIZE 200
SET PAGESIZE 100
COLUMN nm_locomotiva FORMAT A34

SELECT
    l.id_locomotiva,
    l.nm_locomotiva,
    COUNT(*)                                                          AS total_viagens,
    SUM(CASE WHEN r.hr_chegada IS NULL THEN 1 ELSE 0 END)            AS em_andamento,
    ROUND(AVG(CASE WHEN r.hr_chegada IS NOT NULL
                   THEN (r.hr_chegada - r.hr_saida) * 24 END), 1)    AS horas_medias_concluidas
FROM t_sif_registro r
JOIN t_sif_locomotiva l ON l.id_locomotiva = r.id_locomotiva
GROUP BY l.id_locomotiva, l.nm_locomotiva
ORDER BY total_viagens DESC, l.id_locomotiva;
