-- ============================================================================
-- Query 02 — Charging gaps along route segments (trechos)
--
-- Business question:
--   "Is there any route segment (trecho) with NO charging station on it,
--    where a battery locomotive would have nowhere to swap along the way?"
--
-- Why it matters:
--   A segment without a swap point is a hard operational blocker for a
--   battery-only fleet: the locomotive must reach the far end on a single
--   charge or not run the segment at all. A LEFT JOIN is required precisely
--   because the interesting answer is the segment that has NO match.
-- ============================================================================

SET LINESIZE 200
SET PAGESIZE 100
COLUMN nm_trecho FORMAT A34

SELECT
    t.id_trecho,
    t.nm_trecho,
    t.nr_tamanhokm,
    COUNT(e.id_estacao)                                        AS qt_estacoes,
    SUM(CASE WHEN e.vr_carrega_bateria = 'S' THEN 1 ELSE 0 END) AS qt_estacoes_carregadoras
FROM t_sif_trecho t
LEFT JOIN t_sif_estacao e
       ON e.id_trecho = t.id_trecho
GROUP BY t.id_trecho, t.nm_trecho, t.nr_tamanhokm
ORDER BY qt_estacoes_carregadoras, t.nr_tamanhokm DESC;
