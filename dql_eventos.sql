DELIMITER //

CREATE EVENT notificar_bajo_stock
ON SCHEDULE EVERY 1 DAY 
STARTS NOW()
DO
BEGIN
    INSERT INTO registros (fechaRegistro, mensaje)
    SELECT NOW(), CONCAT('Bajo stock de ', alimentos.nombre) 
    FROM alimentos
    WHERE stock < 10;
END //


DELIMITER ;
