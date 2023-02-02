SELECT uf, SUM(vl_remun_media_nom) FROM rais
GROUP BY 1
ORDER BY 2 DESC