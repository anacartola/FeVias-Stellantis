-- ============================================================================
-- Query 01 — Battery fleet readiness
--
-- Business question:
--   "Right now, which batteries are below the 50% charge required to be
--    swap-ready, so dispatch knows which units to pull for charging before
--    the next locomotive arrives at a swap station?"
--
-- Why it matters:
--   A battery-swap network can only keep locomotives moving if enough charged
--   packs are staged. A pack under the readiness threshold is effectively
--   out of service until recharged. This is the daily go/no-go list.
-- ============================================================================

SET LINESIZE 200
SET PAGESIZE 100
COLUMN ds_bateria FORMAT A15
COLUMN swap_status FORMAT A16

SELECT
    b.id_bateria,
    b.ds_bateria,
    bc.perc_carga_bateria,
    CASE
        WHEN bc.perc_carga_bateria < 50 THEN 'BELOW THRESHOLD'
        ELSE 'READY'
    END AS swap_status
FROM t_sif_bateria b
JOIN t_sif_bateria_carreg bc
      ON bc.id_bateria_carreg = b.id_bateria_carreg
ORDER BY bc.perc_carga_bateria;
