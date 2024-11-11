DELIMITER //

create procedure obter_filmes_ano(in ano int)
begin 
	select * from filme
    where ano_de_lancamento = ano;
end //
DELIMITER ;

call obter_filmes_ano(2006);


DELIMITER //

CREATE PROCEDURE filmes_comeca(IN letra VARCHAR(1))
BEGIN 
    SELECT * 
    FROM filme
    WHERE titulo LIKE CONCAT(letra, '%');
END //

DELIMITER ;
call filmes_comeca("c");

DELIMITER //

CREATE PROCEDURE buscar_por_idioma(IN idioma VARCHAR(15))
BEGIN 
  select * from filme
  join idioma on filme.idioma_id = idioma.idioma_id
  where idioma.nome like concat("%", idioma, "%");
END //

DELIMITER ;
call buscar_por_idioma("japanese");
