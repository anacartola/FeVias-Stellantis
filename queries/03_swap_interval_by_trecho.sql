-- ============================================================================
-- Query 03 — Distance between swaps vs. nominal battery range
--
-- Business question:
--   "On each route segment, how far does a locomotive travel between charging
--    stations on average, and does that distance exceed a nominal 300 km
--    battery range — i.e. where do we risk stranding a locomotive?"
--
-- Why it matters:
--   This is the core network-planning check for a battery fleet: swap spacing
--   must stay inside the pack's usable range. km-per-station is a first-order
--   proxy for that spacing and flags segments that need another station.
-- ============================================================================

SET LINESIZE 200
SET PAGESIZE 100
COLUMN nm_trecho FORMAT A34
COLUMN avaliacao_autonomia FORMAT A14

SELECT
    t.id_trecho,
    t.nm_trecho,
    t.nr_tamanhokm,
    COUNT(e.id_estacao)                                          AS qt_estacoes_carregadoras,
    ROUND(t.nr_tamanhokm / NULLIF(COUNT(e.id_estacao), 0), 1)    AS km_por_estacao,
    CASE
        WHEN COUNT(e.id_estacao) = 0                       THEN 'NO COVERAGE'
        WHEN t.nr_tamanhokm / COUNT(e.id_estacao) > 300    THEN 'RANGE RISK'
        ELSE 'OK'
    END AS avaliacao_autonomia
FROM t_sif_trecho t
LEFT JOIN t_sif_estacao e
       ON e.id_trecho = t.id_trecho
      AND e.vr_carrega_bateria = 'S'
GROUP BY t.id_trecho, t.nm_trecho, t.nr_tamanhokm
ORDER BY km_por_estacao DESC NULLS FIRST;
