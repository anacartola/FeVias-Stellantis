-- ============================================================================
-- Query 05 — Operational telemetry coverage
--
-- Business question:
--   "What operational history do we actually have? How many trips, battery
--    swaps at stations, battery mounts on locomotives, and wagon assignments
--    have been logged — the events every utilization and throughput KPI is
--    built on?"
--
-- Why it matters:
--   Every dwell-time, swap-throughput and locomotive-utilization metric depends
--   on the event tables below. This query is the honest inventory of that
--   layer: it tells us up front which questions the current dataset can and
--   cannot answer. (See the Findings note — these tables are empty in the
--   synthetic seed, so this returns zeros by design.)
-- ============================================================================

SET LINESIZE 200
SET PAGESIZE 100
COLUMN fonte FORMAT A40

SELECT 'Trip records (t_sif_registro)'                    AS fonte, COUNT(*) AS qt FROM t_sif_registro
UNION ALL
SELECT 'Battery->station transfers (t_sif_bateria_estacao)', COUNT(*)       FROM t_sif_bateria_estacao
UNION ALL
SELECT 'Battery->locomotive mounts (t_sif_loc_bateria)',     COUNT(*)       FROM t_sif_loc_bateria
UNION ALL
SELECT 'Locomotive-wagon links (t_sif_loc_vagao)',           COUNT(*)       FROM t_sif_loc_vagao
UNION ALL
SELECT 'Wagon-company links (t_sif_vagao_empresa)',          COUNT(*)       FROM t_sif_vagao_empresa;
