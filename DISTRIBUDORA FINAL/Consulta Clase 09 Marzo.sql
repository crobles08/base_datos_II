/*ciudad, departamento, pais, cant_sucursales - Agrega ID solo para verificar*/
SELECT ciudades.`id`, ciudades.`n_ciudad`, departamentos.`n_departamento`, paises.`n_pais`, COUNT(sucursal.`id`) AS CANT_SUCU
FROM ciudades
LEFT JOIN sucursal ON ciudades.`id` = sucursal.`id_ciudad_u`
INNER JOIN departamentos ON departamentos.`id` = ciudades.`id_departamento`
INNER JOIN paises ON paises.`id` = departamentos.`id_pais`
GROUP BY ciudades.`id`