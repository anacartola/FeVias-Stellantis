-- ============================================================================
-- Query 04 — Haulable payload in the wagon pool, by type
--
-- Business question:
--   "What is the total and average payload the wagon pool can haul, split by
--    wagon type (passengers vs. freight), so we can size the tonnage a swap
--    station must hold on its siding during a battery swap?"
--
-- Why it matters:
--   Dwell time and siding load at a swap station depend on what the train is
--   carrying. The passenger/freight split also speaks directly to the
--   Stellantis brief (access for populations vs. cargo logistics).
-- ============================================================================

SET LINESIZE 200
SET PAGESIZE 100
COLUMN tipo FORMAT A16

SELECT
    v.tp_vagao,
    CASE v.tp_vagao
        WHEN 'P' THEN 'Passageiros'
        WHEN 'O' THEN 'Carga/Objetos'
    END                          AS tipo,
    COUNT(*)                     AS qt_vagoes,
    SUM(v.vl_peso_vagao)         AS peso_total,
    ROUND(AVG(v.vl_peso_vagao), 1) AS peso_medio,
    MIN(v.vl_peso_vagao)         AS peso_min,
    MAX(v.vl_peso_vagao)         AS peso_max
FROM t_sif_vagao v
GROUP BY v.tp_vagao
ORDER BY peso_total DESC;
