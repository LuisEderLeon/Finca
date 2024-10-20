DELIMITER //

CREATE TRIGGER subtotalCompraAlimentos
before INSERT ON compraAlimentos
FOR EACH ROW
BEGIN
    declare precioAlimento double;
    select alimentos.precio into precioAlimento from alimentos where id = new.idAlimento;
    set new.subtotal = precioAlimento * new.cantidad;
END //

create trigger totalComprasAlimentos
after insert on compraAlimentos
for each ROW
begin
    declare subtotalTemporal double;
    select subtotal into subtotalTemporal from compraAlimentos where idCompra = new.idCompra and idAlimento = new.idAlimento;
    update compras set total = subtotalTemporal + total where id = new.idCompra;
end //

create trigger totalComprasAnimales
after insert on compraAnimales
for each ROW
begin
    declare subtotalTemporal double;
    select precio into subtotalTemporal from animales where id = new.idAnimal;
    update compras set total = subtotalTemporal + total where id = new.idCompra;
end //

create trigger updateInventarioCosecha
after insert on     
for each ROW
begin
    declare subtotalTemporal double;
    select precio into subtotalTemporal from animales where id = new.idAnimal;
    update compras set total = subtotalTemporal + total where id = new.idCompra;
end //

DELIMITER ;