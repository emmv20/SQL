
- Nombre modelo, marca y grupo de coches (los nombre de todos)
- Fecha de compra
- Matricula
- Nombre del color del coche
- Total kilómetros
- Nombre empresa que esta asegurado el coche
- Numero de póliza
Nota: Los importes se debe controlar la moneda (EURO, DÓLAR etc.).

-----------------
--CONSULTA SQL --
-----------------

SELECT ge.nombre as grupo_empresarial,
mc.nombre as MARCA,
modelo_coche.nombre_modelo as modelo_coche,
v.modelo_coche_id as codigo_modelo,
cc.fecha as fecha_compra,
mc2.numero as numero_matricula,
mc2.pais as pais_matricula,
cc2.nombre as color_coche,
mk.km as kilometraje,
p.numero_poliza as numero_poliza,
a.nombre as empresa_aseguradora,
a.telefono as telefono_aseguradora,
a.email as email,
rc.fecha as fecha_fin_poliza,
rc.costo as costo_revision,
m.nombre_moneda as moneda,
rc.comentario as comentarios  
		FROM grupo_empresarial ge 
		INNER JOIN marca_coche mc on mc.grupo_empresarial_id=ge.grupo_empresarial_id 
		INNER JOIN modelo_coche ON mc.marca_coche_id  = modelo_coche.marca_coche_id 
		INNER JOIN vehiculo v on modelo_coche.modelo_coche_id  = v.modelo_coche_id 
		INNER join compra_coche cc on v.vehiculo_id  = cc.vehiculo_id
		inner join matricula_coche mc2 on v.vehiculo_id = mc2.vehiculo_id
		inner join color_coche cc2 on modelo_coche.color_coche_id = cc2.color_coche_id 
		inner join medidor_km mk on v.vehiculo_id = mk.vehiculo_id
		inner join poliza p on v.vehiculo_id = p.vehiculo_id  
		inner join aseguradora a on p.aseguradora_id = a.aseguradora_id
		inner join revision_coche rc on v.vehiculo_id = rc.vehiculo_id
		inner join moneda m on rc.moneda_id = m.moneda_id 