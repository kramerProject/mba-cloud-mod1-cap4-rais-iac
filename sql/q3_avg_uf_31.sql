SELECT uf, AVG(vl_remun_media_nom) FROM tableA
WHERE uf == '31'
GROUP BY 1
ORDER BY 2 DESC