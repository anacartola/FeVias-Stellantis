-- ============================================================================
-- Query 03 — Charging coverage and range risk per corridor
--
-- Business question:
--   "On each route segment, how far does a locomotive travel between CHARGING
--    stations, and does that exceed a nominal 300 km battery range — where is a
--    battery locomotive at risk of stranding?"
--
-- Why it matters:
--   The core network-planning check for a battery fleet. Only stations that can
--   actually charge count toward coverage, so this deliberately separates
--   'S' (charging) from 'N' (not yet electrified) stations.
-- ============================================================================

SET LINESIZE 200
SET PAGESIZE 100
COLUMN nm_trecho FORMAT A34
COLUMN avaliacao FORMAT A14

SELECT
    t.id_trecho,
    t.nm_trecho,
    t.nr_tamanhokm,
    COUNT(e.id_estacao)                                                    AS qt_estacoes,
    SUM(CASE WHEN e.vr_carrega_bateria = 'S' THEN 1 ELSE 0 END)            AS qt_carregadoras,
    ROUND(t.nr_tamanhokm
          / NULLIF(SUM(CASE WHEN e.vr_carrega_bateria = 'S' THEN 1 ELSE 0 END), 0), 1) AS km_por_carregadora,
    CASE
        WHEN SUM(CASE WHEN e.vr_carrega_bateria = 'S' THEN 1 ELSE 0 END) = 0 THEN 'NO COVERAGE'
        WHEN t.nr_tamanhokm
             / SUM(CASE WHEN e.vr_carrega_bateria = 'S' THEN 1 ELSE 0 END) > 300 THEN 'RANGE RISK'
        ELSE 'OK'
    END AS avaliacao
FROM t_sif_trecho t
LEFT JOIN t_sif_estacao e ON e.id_trecho = t.id_trecho
GROUP BY t.id_trecho, t.nm_trecho, t.nr_tamanhokm
ORDER BY km_por_carregadora DESC NULLS FIRST;
