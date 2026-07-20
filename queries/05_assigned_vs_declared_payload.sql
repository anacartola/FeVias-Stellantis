-- ============================================================================
-- Query 05 — Assigned payload vs. declared capacity per locomotive
--
-- Business question:
--   "How much payload is each locomotive actually assigned to haul, and how
--    does the number of assigned wagons compare with the wagon count declared
--    on the locomotive record?"
--
-- Why it matters:
--   Actual load drives energy draw (and therefore how far a charge lasts).
--   Comparing assigned wagons with the declared nr_vagoes also surfaces whether
--   that stored count is kept in sync with real assignments -- a
--   denormalization the model carries on purpose.
-- ============================================================================

SET LINESIZE 200
SET PAGESIZE 100
COLUMN nm_locomotiva FORMAT A34

SELECT
    l.id_locomotiva,
    l.nm_locomotiva,
    l.nr_vagoes            AS nr_vagoes_declarado,
    COUNT(lv.id_vagao)     AS vagoes_atribuidos,
    SUM(lv.vl_peso)        AS peso_total_atribuido
FROM t_sif_locomotiva l
LEFT JOIN t_sif_loc_vagao lv ON lv.id_locomotiva = l.id_locomotiva
GROUP BY l.id_locomotiva, l.nm_locomotiva, l.nr_vagoes
ORDER BY peso_total_atribuido DESC NULLS LAST;
