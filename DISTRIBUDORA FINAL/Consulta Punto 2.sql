SELECT sc.`id_sucursal` AS ID_SUCURSAL, sucursal.`nombre_encargado` AS ENCARGADO_SUCURSAL, CONCAT( "(",contactos.`identificacion`, ") ", contactos.`nom_representante`)AS NOMBRE_CLIENTE, paises.`n_pais` AS PAIS
FROM sucursal_cliente sc 
INNER JOIN sucursal ON sucursal.`id` = sc.`id_sucursal`
INNER JOIN contactos ON contactos.`id` = sc.`id_contacto`
INNER JOIN ciudades ON sucursal.`id_ciudad_u` = ciudades.`id`
INNER JOIN departamentos ON ciudades.`id_departamento`=departamentos.`id`
INNER JOIN paises ON departamentos.`id_pais` = paises.`id`