set sql_safe_updates=0;

/*1*/
select pais from pais;

/*2*/
select count(*) qtd_paises from pais;

/*3*/
select count(*) qtd_paises_a from pais
where pais like "%a";

/*4*/
select distinct ano_de_lancamento from filme;

/*5*/
update filme 
set ano_de_lancamento = 2007 
where titulo like "b%";

/*6*/
select titulo, duracao_do_filme from filme
where duracao_do_filme > 100 and classificacao = "G";

/*7*/
update filme 
set ano_de_lancamento = 2008
where duracao_da_locacao < 4 and classificacao = "PG";

/*8*/
select count(*) qtd_filmes from filme
where classificacao = "PG-13" and preco_da_locacao > 2.40;

/*9*/
select distinct nome idioma from idioma, filme
where idioma.idioma_id = filme.idioma_id;

/*10*/
update filme
set idioma_id = 6 
where preco_da_locacao > 4;

/*11*/
update filme
set idioma_id = 3
where preco_da_locacao = 0.99;

/*12*/
select count(*) qtd_filme, classificacao from filme
group by classificacao;

/*13*/
select distinct preco_da_locacao from filme;

/*14*/
select count(*) qtd_filmes, preco_da_locacao from filme
group by preco_da_locacao;

/*15*/
select preco_da_locacao from filme
group by preco_da_locacao
having count(*) > 340;

/*16*/
select count(*) qtd_atores, titulo from ator, filme, filme_ator as fa
where ator.ator_id = fa.ator_id and filme.filme_id = fa.filme_id
group by ator.ator_id
order by qtd_atores asc;

/*17*/
select count(*) qtd_atores, titulo from ator, filme, filme_ator as fa
where ator.ator_id = fa.ator_id and filme.filme_id = fa.filme_id
group by ator.ator_id
having qtd_atores > 5
order by qtd_atores desc;

/*18*/
select count(*) qtd_atores, titulo from ator, filme, filme_ator as fa
where ator.ator_id = fa.ator_id and filme.filme_id = fa.filme_id
group by ator.ator_id
having qtd_atores > 10
order by titulo asc;

/*19*/
select max(duracao_da_locacao) as maior_locacao from filme;

/*20*/
select count(*) as qtd_filmes from filme
where duracao_da_locacao = 7;

/*21*/
select count(*) as qtd_filmes from filme
where idioma_id = 6 and duracao_da_locacao = 7;

/*22*/
select count(*) as qtd_filmes from filme
group by classificacao, preco_da_locacao;

/*23*/
SELECT MAX(filme.duracao_da_locacao) max_duaracao_loc, categoria.nome
FROM filme
JOIN filme_categoria ON filme.filme_id = filme_categoria.filme_id
JOIN categoria ON categoria.categoria_id = filme_categoria.categoria_id
GROUP BY categoria.nome;

/*24*/
select count(*) as qtd_filme from filme
JOIN filme_categoria ON filme.filme_id = filme_categoria.filme_id
JOIN categoria ON categoria.categoria_id = filme_categoria.categoria_id
GROUP BY categoria.nome;

/*25*/
select count(*) as qtd_filme from filme
JOIN filme_categoria ON filme.filme_id = filme_categoria.filme_id
JOIN categoria ON categoria.categoria_id = filme_categoria.categoria_id
where classificacao = "G"
GROUP BY categoria.nome;

/*26*/
select count(*) as qtd_filme from filme
JOIN filme_categoria ON filme.filme_id = filme_categoria.filme_id
JOIN categoria ON categoria.categoria_id = filme_categoria.categoria_id
where classificacao = "PG"
GROUP BY categoria.nome;

/*27*/
select count(*) as qtd_filme, categoria.nome, classificacao from filme
JOIN filme_categoria ON filme.filme_id = filme_categoria.filme_id
JOIN categoria ON categoria.categoria_id = filme_categoria.categoria_id
GROUP BY categoria.nome, classificacao;

/*28*/
select count(*) as qtd_filme, ator.primeiro_nome from filme f
join filme_ator fa on f.filme_id = fa.filme_id
join ator on ator.ator_id = fa.ator_id
group by ator.primeiro_nome
order by qtd_filme desc;

/*29*/
select  count(*) as qtd_filme, ano_de_lancamento from filme
group by ano_de_lancamento
order by qtd_filme asc;

/*30*/
select  count(*) as qtd_filme, ano_de_lancamento from filme
group by ano_de_lancamento
having qtd_filme > 400;

/*31*/
SELECT f.ano_de_lancamento
FROM filme f
JOIN filme_categoria fc ON f.filme_id = fc.filme_id
JOIN categoria c ON fc.categoria_id = c.categoria_id
WHERE f.preco_da_locacao > (
    SELECT AVG(f2.preco_da_locacao)
    FROM filme f2
    JOIN filme_categoria fc2 ON f2.filme_id = fc2.filme_id
    JOIN categoria c2 ON fc2.categoria_id = c2.categoria_id
    WHERE c2.nome = 'Children'
)
GROUP BY f.ano_de_lancamento
HAVING COUNT(f.filme_id) > 100;

/*32*/
select cidade, pais from cidade
join pais on cidade.pais_id = pais.pais_id
where pais like "a%";

/*33*/
select count(*) qtd_cidade, pais from cidade
join pais on cidade.pais_id = pais.pais_id
group by pais
order by qtd_cidade desc;

/*34*/
select count(*) qtd_cidade, pais from cidade
join pais on cidade.pais_id = pais.pais_id
where cidade like "a%"
group by pais
order by qtd_cidade asc;

/*35*/
select pais from cidade
join pais on cidade.pais_id = pais.pais_id
where cidade like "a%" 
group by pais
having count(cidade) > 3;

/*36*/
select pais from cidade
join pais on cidade.pais_id = pais.pais_id
where cidade like "%r%"
group by pais
having count(cidade) > 3;

/*37*/
select primeiro_nome from cliente cl
join endereco e on cl.endereco_id = e.endereco_id
join cidade c on e.cidade_id = c.cidade_id
join pais p on c.pais_id = p.pais_id
where p.pais = "United States";

/*38*/
select count(*) qtd_clientes_brasil from cliente cl
join endereco e on cl.endereco_id = e.endereco_id
join cidade c on e.cidade_id = c.cidade_id
join pais p on c.pais_id = p.pais_id
where p.pais = "Brazil";

/*39*/
select count(*) qtd_clientes_pais, p.pais from cliente cl
join endereco e on cl.endereco_id = e.endereco_id
join cidade c on e.cidade_id = c.cidade_id
join pais p on c.pais_id = p.pais_id
group by p.pais;

/*40*/
select p.pais from cliente cl
join endereco e on cl.endereco_id = e.endereco_id
join cidade c on e.cidade_id = c.cidade_id
join pais p on c.pais_id = p.pais_id
group by p.pais
having count(cl.primeiro_nome) > 10;

/*41*/
select avg(duracao_do_filme), idioma.nome from filme
join idioma on filme.idioma_id = idioma.idioma_id
group by idioma.nome;

/*42*/
select count(*) qtd_ator from ator
join filme_ator on ator.ator_id = filme_ator.ator_id
join filme on filme_ator.filme_id = filme.filme_id
where filme.idioma_id = 1;

/*43*/
select ator.primeiro_nome, titulo from ator
join filme_ator on ator.ator_id = filme_ator.ator_id
join filme on filme_ator.filme_id = filme.filme_id
where filme.titulo = "BLANKET BEVERLY";

/*44*/
select count(filme.titulo) qtd_filme, categoria.nome from filme
join filme_categoria on filme.filme_id = filme_categoria.filme_id
join categoria on filme_categoria.categoria_id = categoria.categoria_id
group by categoria.nome
having qtd_filme > 60;

/*45*/
select distinct titulo from filme f
join inventario i on f.filme_id = i.filme_id
join aluguel al on i.inventario_id = al.inventario_id
join cliente cl on al.cliente_id = cl.cliente_id
join endereco en on cl.endereco_id = en.endereco_id
join cidade ci on en.cidade_id = ci.cidade_id
join pais p on ci.pais_id = p.pais_id
where p.pais = "Argentina";

/*46*/
select count(titulo) as qtd from filme f
join inventario i on f.filme_id = i.filme_id
join aluguel al on i.inventario_id = al.inventario_id
join cliente cl on al.cliente_id = cl.cliente_id
join endereco en on cl.endereco_id = en.endereco_id
join cidade ci on en.cidade_id = ci.cidade_id
join pais p on ci.pais_id = p.pais_id
where p.pais = "Chile";

/*47*/
select funcionario_id, COUNT(*) as qtd from aluguel
group by funcionario_id;

/*48*/
select count(titulo) as qtd, categoria.nome from filme f
join inventario i on f.filme_id = i.filme_id
join aluguel al on i.inventario_id = al.inventario_id
join funcionario func on al.funcionario_id = func.funcionario_id
join filme_categoria fc on f.filme_id = fc.filme_id
join categoria on fc.categoria_id = categoria.categoria_id
group by categoria.nome, func.primeiro_nome;

/*49*/
select titulo from filme 
where preco_da_locacao > ( select avg(preco_da_locacao) from filme);

/*50*/
select sum(duracao_do_filme), c.nome from filme
join filme_categoria fc on filme.filme_id = fc.filme_id
join categoria c on fc.categoria_id = c.categoria_id
group by c.nome;

/*51*/
select year(al.data_de_aluguel) as ano, month(al.data_de_aluguel) as mes, count(*) as qtd_alocado from filme
join inventario inv on filme.filme_id = inv.filme_id
join aluguel al on inv.inventario_id = al.inventario_id
group by year(al.data_de_aluguel), month(al.data_de_aluguel);

/*52*/
select sum(valor) total_2006, classificacao from pagamento
join aluguel al on pagamento.aluguel_id = al.aluguel_id
join inventario inv on al.inventario_id = inv.inventario_id
join filme on inv.filme_id = filme.filme_id
where year(data_de_aluguel)= 2006 
group by classificacao;

/*53*/
select avg(valor) total_2006, month(al.data_de_aluguel) mes from pagamento
join aluguel al on pagamento.aluguel_id = al.aluguel_id
join inventario inv on al.inventario_id = inv.inventario_id
join filme on inv.filme_id = filme.filme_id
where year(data_de_aluguel)= 2005
group by month(al.data_de_aluguel);

/*54*/
select cliente.primeiro_nome, sum(valor) total_2006, filme.titulo  from pagamento
join aluguel al on pagamento.aluguel_id = al.aluguel_id
join inventario inv on al.inventario_id = inv.inventario_id
join cliente on al.cliente_id = cliente.cliente_id
join filme on inv.filme_id = filme.filme_id
where month(data_de_aluguel)= "06" and year(data_de_aluguel) = "2006"
group by cliente.primeiro_nome, filme.titulo;



