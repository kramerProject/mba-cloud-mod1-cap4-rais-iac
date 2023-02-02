SELECT sexo_trabalhador, AVG(vl_remun_media_nom) FROM tableA
WHERE cnae_2_0_classe == 62040
GROUP BY 1
ORDER BY 2 DESC