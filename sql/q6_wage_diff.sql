SELECT sexo_trabalhador, AVG(vl_remun_media_nom) FROM tableA
GROUP BY 1
ORDER BY 2 DESC