create view pais_mais_10_clientes (pais) as
select p.pais from cliente cl
join endereco e on cl.endereco_id = e.endereco_id
join cidade c on e.cidade_id = c.cidade_id
join pais p on c.pais_id = p.pais_id
group by p.pais
having count(cl.primeiro_nome) > 10;

create view filmes_maior_duracao (titulo, duracao) as
select titulo, duracao_do_filme from filme
where duracao_do_filme = (select max(duracao_do_filme) from filme);

create view filmes_mais_caros (titulo, preco_locacao) as 
select titulo, preco_da_locacao from filme
where preco_da_locacao = (select max(preco_da_locacao) from filme);
