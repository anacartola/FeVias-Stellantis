-- ============================================================================
-- Query 02 — Which stations are the busy swap hubs?
--
-- Business question:
--   "How many battery transfers has each station handled, and over what
--    window — where is swap demand concentrating so we know where to add
--    charging bays first?"
--
-- Why it matters:
--   Charging infrastructure is expensive; it should follow demand. A station
--   handling most of the swaps is the one to reinforce. Reads the real event
--   log (t_sif_bateria_estacao).
-- ============================================================================

SET LINESIZE 200
SET PAGESIZE 100
COLUMN nm_estacao FORMAT A34

SELECT
    e.id_estacao,
    e.nm_estacao,
    COUNT(*)                                     AS qt_transferencias,
    TO_CHAR(MIN(be.dt_transferencia), 'YYYY-MM-DD') AS primeira,
    TO_CHAR(MAX(be.dt_transferencia), 'YYYY-MM-DD') AS ultima
FROM t_sif_bateria_estacao be
JOIN t_sif_estacao e ON e.id_estacao = be.id_estacao
GROUP BY e.id_estacao, e.nm_estacao
ORDER BY qt_transferencias DESC, e.id_estacao;
