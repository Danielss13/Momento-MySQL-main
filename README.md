## MOMENTO & SEUS FUNCIONÁRIOS 

<h4> A Momento é uma empresa única que faz o melhor que pode para alcançar o melhor da humanidade.</h4>

##

<h3> 1 - Inclua suas próprias informações no departamento de tecnologia da empresa. </h3>
<code>INSERT INTO FUNCIONARIOS VALUES
(207,'Lucas','Costa França','lucascfranca11@gmail.com','080023232','2020-02-04', 9, 10000.00, 100,6); </code>

##
![1](https://cdn.discordapp.com/attachments/1030653726173696010/1038618845977526362/Captura_de_Tela_345.png)
##

<h3> 2 -  A administração está sem funcionários. Inclua os outros elementos do seu grupo do demoday no departamento de administração. </h3>

<code> INSERT INTO FUNCIONARIOS VALUES (208,'Jhonatha','Daniel','jhonathadaniel@gmail.com','32003213','2022-11-05', 3, 8300.00, 100,1),
(209,'Matias','','matias@gmail.com','38282811','2022-11-05', 3,8300.00, 100, 1),
(210,'Gabriel','Pacheco','gabrielpacheco@gmail.com','40242343','2022-11-05', 3, 8300.00, 100, 1),
(211,'Enzo','Serikawa','enzoserikawa@gmail.com','4432432432','2022-11-05', 3, 8300.00, 100,1),
(212,'Daniel','Santos','danielsantos@gmail.com','33432432','2022-11-05', 3, 8300.00, 100,1)
(213,'Weslei','','weslei@gmail.com','3431221','2022-11-05', 3, 8300.00, 100,1); </code>


##
![2](https://cdn.discordapp.com/attachments/1030653726173696010/1038621028475211806/Captura_de_Tela_347.png)
##

<h3> 3 -  Agora diga, quantos funcionários temos ao total na empresa? </h3>
São 47 funcionários. <code> SELECT COUNT(*) FROM funcionarios; </code>

##
![3](https://cdn.discordapp.com/attachments/1030653726173696010/1038622273390772294/Captura_de_Tela_349.png)
##

<h3> 4 -  Quantos funcionários temos no departamento de finanças? </h3>
São 6 funcionários do departamento de finanças. <code> SELECT COUNT(*) FROM funcionarios WHERE departamento_id = 10; </code>

##
![4](https://cdn.discordapp.com/attachments/1030653726173696010/1038622903039709325/Captura_de_Tela_350.png)
##

<h3> 5 -  Qual a média salarial do departamento de tecnologia? </h3>
A média salarial é de: R$: R$ 6466,67. <code> SELECT ROUND(AVG(CONVERT(salario, float))* 1, 2) FROM funcionarios WHERE departamento_id = 6; </code>

##
![5](https://media.discordapp.net/attachments/1030653726173696010/1038632307730436117/Captura_de_Tela_353.png?width=1208&height=247)
##

<h3> 6 - Quanto o departamento de Transportes gasta em salários? </h3>
Ele gasta: R$ 41200,00. <code> SELECT SUM(salario) FROM funcionarios WHERE departamento_id = 5; </code>

##
![6](https://cdn.discordapp.com/attachments/1030653726173696010/1038633575161012264/Captura_de_Tela_354.png)
##

<h3> 7 -   Um novo departamento foi criado. O departamento de inovações. Ele será locado no Brasil. Por favor, adicione-o no banco de dados. </h3>
<code> INSERT INTO departamento VALUES (default,'Inovações','5400') </code>

##
![7](https://cdn.discordapp.com/attachments/1030653726173696010/1038634358774444083/Captura_de_Tela_355.png)
##

<h3> 8 -  Novos Funcionários! </h3>
Três novos funcionários foram contratados para o departamento de inovações. Por favor, adicione-os: William Ferreira, casado com Inara Ferreira, possui um filho chamado Gabriel que tem 4 anos e adora brincar com cachorros. Ele será programador.Já a Fernanda Lima, que é casada com o Rodrigo, não possui filhos. Ela vai ocupar a posição de desenvolvedora.  Por último, a Gerente do departamento será Fabiana Raulino. Casada, duas filhas (Maya e Laura). 
O salário de todos eles será a média salarial dos departamentos de administração e finanças. 

<h4> Inserção dos funcionários: </h4>

<code> INSERT INTO funcionarios VALUES 
('', 'William','Ferreira','williamgerreira@momento.org','50043132','2022-11-05', 9, 8300.00, 100, 12),
('', 'Fernanda','Lima','fernandalima@momento.org','34143132','2022-11-05', 9, 8300.00, 100, 12),
('', 'Fabiana','Raulino','fabianaraulino@momento.org','80343132','2022-11-05', 20, 8300.00, 100, 12);</code>


##
![8a](https://cdn.discordapp.com/attachments/1030653726173696010/1038635355932479558/Captura_de_Tela_356.png)
##

<h4> Alteração dos salários: </h4>

<code> UPDATE funcionarios SET salario=(SELECT AVG(salario) FROM funcionarios WHERE departamento_id = 10 OR departamento_id = 1) WHERE departamento_id = 12;
</code>

##
![8b](https://cdn.discordapp.com/attachments/1030653726173696010/1038640369488887889/Captura_de_Tela_358.png)
##

<h4> Inserção dos Dependentes: </h4>

<code> INSERT INTO `dependentes`(`dependente_id`, `primeiro_nome`, `sobrenome`, `parentesco`, `funcionario_id`) VALUES ('','Inara','Ferreira','Cônjuge',(SELECT funcionario_id from funcionarios WHERE primeiro_nome LIKE '%William%' AND sobrenome LIKE '%Ferreira%')); </code>

<code> INSERT INTO `dependentes`(`dependente_id`, `primeiro_nome`, `sobrenome`, `parentesco`, `funcionario_id`) VALUES ('','Gabriel','Ferreira','Filho(a)',(SELECT funcionario_id from funcionarios WHERE primeiro_nome LIKE '%William%' AND sobrenome LIKE '%Ferreira%')); </code>

<code> INSERT INTO `dependentes`(`dependente_id`, `primeiro_nome`, `sobrenome`, `parentesco`, `funcionario_id`) VALUES ('','Rodrigo','Lima','Cônjuge',(SELECT funcionario_id from funcionarios WHERE primeiro_nome LIKE '%Fernanda%' AND sobrenome LIKE '%Lima%')); </code> 

<code> INSERT INTO `dependentes`(`dependente_id`, `primeiro_nome`, `sobrenome`, `parentesco`, `funcionario_id`) VALUES ('','João','Raulino','Cônjuge',(SELECT funcionario_id from funcionarios WHERE primeiro_nome LIKE '%Fabiana%' AND sobrenome LIKE '%Raulino%')); </code>
  
<code> INSERT INTO `dependentes`(`dependente_id`, `primeiro_nome`, `sobrenome`, `parentesco`, `funcionario_id`) VALUES ('','Maya','Raulino','Filho(a)',(SELECT funcionario_id from funcionarios WHERE primeiro_nome LIKE '%Fabiana%' AND sobrenome LIKE '%Raulino%')); </code>

<code> INSERT INTO `dependentes`(`dependente_id`, `primeiro_nome`, `sobrenome`, `parentesco`, `funcionario_id`) VALUES ('','Laura','Raulino','Filho(a)',(SELECT funcionario_id from funcionarios WHERE primeiro_nome LIKE '%Fabiana%' AND sobrenome LIKE '%Raulino%')); </code>

##
![8c](https://cdn.discordapp.com/attachments/1030653726173696010/1038641237231677500/Captura_de_Tela_359.png)
##

<h3> 9 -  Informe todas as regiões em que a empresa atua acompanhadas de seus países. </h3>
<code> SELECT paises.pais_name AS Pais, regiao.regiao_name FROM paises INNER JOIN regiao WHERE paises.regiao_id = regiao.regiao_id; </code>

##
![9](https://cdn.discordapp.com/attachments/1030653726173696010/1038649425033179186/Captura_de_Tela_360.png)
##

<h3> 10 -  Joe Sciarra é filho de quem? </h3>
<code> SELECT funcionarios.primeiro_nome, funcionarios.sobrenome FROM dependentes INNER JOIN funcionarios WHERE dependentes.funcionario_id = funcionarios.funcionario_id AND dependentes.primeiro_nome = 'Joe' AND dependentes.sobrenome = 'Sciarra'; </code>

##
![10](https://cdn.discordapp.com/attachments/1030653726173696010/1038651689219145828/Captura_de_Tela_361.png)
##

<h3> 11 -  Jose Manuel possui filhos? </h3>
<code> SELECT dependentes.primeiro_nome, dependentes.sobrenome FROM funcionarios INNER JOIN dependentes WHERE funcionarios.funcionario_id = dependentes.funcionario_id AND funcionarios.primeiro_nome = 'Jose Manuel' AND funcionarios.sobrenome = 'Urman';
 </code>

##
![11](https://cdn.discordapp.com/attachments/1030653726173696010/1038656649239474266/Captura_de_Tela_362.png)
##

<h3> 12 -  Qual região possui mais países? </h3>
<code> SELECT regiao.regiao_name, COUNT(paises.regiao_id) FROM paises INNER JOIN regiao WHERE regiao.regiao_id = paises.regiao_id GROUP BY regiao.regiao_name; </code>

##
![12](https://cdn.discordapp.com/attachments/1030653726173696010/1038657348350267474/Captura_de_Tela_363.png)
##

<h3> 13 - Exiba o nome de cada funcionário acompanhado de seus dependentes. </h3>
<code> SELECT funcionarios.primeiro_nome as nome, funcionarios.sobrenome, dependentes.primeiro_nome as dependentes FROM funcionarios INNER JOIN dependentes WHERE funcionarios.funcionario_id = dependentes.funcionario_id;
</code>

##
![13](https://cdn.discordapp.com/attachments/1030653726173696010/1038658513787953253/Captura_de_Tela_365.png)
##

<h3> 14 -  Karen Partners possui um cônjuge? </h3>
<code> SELECT dependentes.primeiro_nome, dependentes.sobrenome FROM dependentes INNER JOIN funcionarios WHERE funcionarios.funcionario_id = dependentes.funcionario_id AND dependentes.funcionario_id = (SELECT funcionario_id FROM funcionarios WHERE primeiro_nome = 'Karen' AND sobrenome ='Partners');</code>

##
![14](https://cdn.discordapp.com/attachments/1030653726173696010/1038661950990733342/Captura_de_Tela_366.png)
##

<h3> 15 -  O ID da tabela de países não segue um padrão numérico. Na sua visão, qual o impacto disso no desenvolvimento do banco? </h3>

<h4>Resposta: Na minha visão, não tem impacto. O fator importante da chave primária é ser única e não ter valor nulo. Cada país tem sua sigla única.</h4>

##

<h3> 16 -  Escolha um país para se mudar. Qual seria esse país? Por que escolheria esse país? E o departamento. O que seria? Como seriam seus funcionários? </h3>

<h4>Resposta: Tenho muita vontade de me mudar para o Canadá. Tem empresas grandes como, Amazon, Microsoft e por ai vai. São muitas oportunidades na área de tecnologia. Meu departamento é de Tecnologia e desenvolvimento. Os meus funcionários seriam pessoas engajadas e com brilho nos olhos. </h4>

##

<h3> 17 -  Atualize as informações na tabela para que seu departamento seja criado. </h3>

<code> INSERT INTO `posicao`(`posicao_id`, `endereco`, `cep`, `cidade`, `estado`, `pais_id`) VALUES ('','346 Westmoreland Ave N Unit 105','98101','Toronto','Ontario','CA'); </code>
<code> INSERT INTO `departamento`(`departamento_id`, `departamento_name`, `posicao_id`) VALUES ('','Tecnologia e Desenvolvimento', (SELECT posicao_id FROM posicao WHERE endereco = '346 Westmoreland Ave N Unit 105')); </code>

##
![17a](https://cdn.discordapp.com/attachments/1030653726173696010/1038670542980530197/Captura_de_Tela_367.png)
