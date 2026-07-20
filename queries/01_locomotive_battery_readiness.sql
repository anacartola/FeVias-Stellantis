-- ============================================================================
-- Query 01 — Which locomotives are running a low battery right now?
--
-- Business question:
--   "For each locomotive, what battery is currently mounted (its most recent
--    mount) and is that pack below the 50% swap-ready charge — i.e. which
--    locomotives should head for a swap station next?"
--
-- Why it matters:
--   This is the live dispatch view. A locomotive whose mounted pack is below
--   threshold is on borrowed time and must reach a charging station before it
--   strands. Uses the actual mount history (t_sif_loc_bateria), not just the
--   battery catalogue.
-- ============================================================================

SET LINESIZE 200
SET PAGESIZE 100
COLUMN nm_locomotiva FORMAT A34
COLUMN status FORMAT A16

SELECT
    l.id_locomotiva,
    l.nm_locomotiva,
    b.id_bateria,
    bc.perc_carga_bateria,
    CASE WHEN bc.perc_carga_bateria < 50 THEN 'BELOW THRESHOLD' ELSE 'READY' END AS status
FROM t_sif_locomotiva l
JOIN t_sif_loc_bateria lb
      ON lb.id_locomotiva = l.id_locomotiva
     AND lb.dt_transferencia = (
            SELECT MAX(lb2.dt_transferencia)
            FROM t_sif_loc_bateria lb2
            WHERE lb2.id_locomotiva = l.id_locomotiva
        )
JOIN t_sif_bateria b         ON b.id_bateria = lb.id_bateria
JOIN t_sif_bateria_carreg bc ON bc.id_bateria_carreg = b.id_bateria_carreg
ORDER BY bc.perc_carga_bateria;
