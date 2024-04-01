# Relatório

#### Sumário:

- [Introdução](#introducao)
- [Metodologia](#metodologia)
- [Definiçãs de métricas](#metricas)
- [Coleta e Análise de Dados](#coletaDados)
- [Hipóteses informais](#hipoteses)
- [Resultados](#resultados)
- [Conclusão](#conclusao)

<a id='introducao'></a>
## Introdução

No processo de desenvolvimento de sistemas open-source, em que diversos desenvolvedores contribuem em partes diferentes do código, um dos riscos a serem gerenciados diz respeito à evolução dos seus atributos de qualidade interna. Isto é, ao se adotar uma abordagem colaborativa, corre-se o risco de tornar vulnerável aspectos como modularidade, manutenabilidade, ou legibilidade do software produzido. Para tanto, diversas abordagens modernas buscam aperfeiçoar tal processo, através da adoção de práticas relacionadas à revisão de código ou à análise estática através de ferramentas de CI/CD.

Neste contexto, o objetivo deste laboratório é analisar aspectos da qualidade de repositórios desenvolvidos na linguagem Java, correlacionado-os com características do seu processo de desenvolvimento, sob a perspectiva de métricas de produto calculadas através da ferramenta [CK](https://github.com/mauricioaniche/ck).

<a id='metodologia'></a>
## Metodologia

### 1. Seleção de Repositórios

Com o objetivo de analisar repositórios relevantes, escritos na linguagem estudada, coletaremos os top-1.000 repositórios Java mais populares do GitHub, calculando cada uma das métricas definidas na Seção 3.

### 2. Questões de Pesquisa

Desta forma, este laboratório tem o objetivo de responder às seguintes questões de pesquisa:

- **RQ 01.** Qual a relação entre a popularidade dos repositórios e as suas características de qualidade?
- **RQ 02.** Qual a relação entre a maturidade do repositórios e as suas características de qualidade ? 
- **RQ 03.** Qual a relação entre a atividade dos repositórios e as suas características de qualidade?  
- **RQ 04.** Qual a relação entre o tamanho dos repositórios e as suas características de qualidade?  
 
<a id='metricas'></a>
### 3. Definição de Métricas

Para cada questão de pesquisa, será realizado a comparação entre as características do processo de desenvolvimento dos repositórios e os valores obtidos para as métricas definidas nesta seção. Para as métricas de processo, define-se:

- **Popularidade:** número de estrelas
- **Tamanho:** linhas de código (LOC) e linhas de comentários
- **Atividade:** número de releases
- **Maturidade:** idade (em anos) de cada repositório coletado

- Por métricas de qualidade, entende-se:
    - **CBO:** Coupling between objects
    - **DIT:** Depth Inheritance Tree
    - **LCOM:** Lack of Cohesion of Methods
 
<a id='coletaDados'></a>
### 4. Coleta e Análise de Dados

Para análise das métricas de popularidade, atividade e maturidade, serão coletadas informações dos repositórios mais populares em Java, utilizando o GraphQL do GitHub. Para medição dos valores de qualidade, utilizaremos uma ferramenta de análise estática de código anteriormente citada, [CK](https://github.com/mauricioaniche/ck).

Essa ferramenta gera diferentes arquivos .csv, porém para este trabalho será considerado apenas o arquivo *class.csv* que contém as métricas LOC, CBO, DIT e LCOM. Além disso, como essas
métricas são para classes e não para o sistema como todo, será utilizado o somatório dos LOCs das classes, a média dos resultados CBO e LCOM e o maior valor para DIT de cada sistema para as análises.

<a id='hipoteses'></a>
## Hipóteses informais

-  **RQ 01.** Qual a relação entre a popularidade dos repositórios e as suas características de qualidade?

Hipótese: Repositórios mais populares tendem a ter melhor qualidade, uma vez que a popularidade pode ser um indicativo de confiabilidade e utilidade percebida pelos usuários. Portanto, é possível que repositórios com mais estrelas apresentem métricas de qualidade mais altas, como menor acoplamento entre objetos (CBO), profundidade da árvore de herança (DIT) mais equilibrada e maior coesão de métodos (LCOM).

- **RQ 02.** Qual a relação entre a maturidade do repositórios e as suas características de qualidade ?

Hipótese: Repositórios mais antigos podem ter uma qualidade superior devido à sua longevidade e histórico de manutenção. Portanto, é razoável esperar que repositórios mais maduros apresentem métricas de qualidade mais altas, pois ao longo do tempo podem ter passado por refinamentos e ajustes para melhorar a sua estrutura e design.

- #### **RQ 03.** Qual a relação entre a atividade dos repositórios e as suas características de qualidade?  

Hipótese: Repositórios com maior atividade, medidos pelo número de lançamentos (releases), podem indicar uma comunidade ativa de desenvolvedores e uma maior atenção à manutenção e evolução do código. Assim, é provável que repositórios com mais lançamentos apresentem métricas de qualidade mais altas, pois estão sob constante revisão e atualização.

- #### **RQ 04.** Qual a relação entre o tamanho dos repositórios e as suas características de qualidade?

Hipótese: A relação entre o tamanho do repositório (medido em linhas de código e linhas de comentários) e sua qualidade pode variar. Em alguns casos, repositórios menores podem ser mais fáceis de manter e entender, o que poderia resultar em métricas de qualidade mais altas. Por outro lado, repositórios maiores podem ser mais robustos e abrangentes, refletindo em métricas de qualidade mais altas devido à sua maior complexidade e funcionalidades.

<a id='resultado'></a>
## Resultados

Dos 1000 repositórios obtidos, 96,4% apresentaram valores satisfatórios e foram considerados para as análises subsequentes. Cerca de 1,3% correspondiam a recursos educacionais, tutoriais ou conteúdos similares, e, portanto, não continham códigos a serem avaliados. Por fim, os 2,3% restantes foram identificados com falhas na execução da ferramenta CK. Esses potenciais erros são exemplificados a seguir:

| **tipo** | **Descrição** |
|-------------|-------------|
| Erros de sintaxe no código-fonte: | Se o código-fonte contiver erros de sintaxe que a ferramenta CK não consegue analisar corretamente, isso pode impedir a extração de informações significativas para serem incluídas no arquivo CSV. Por exemplo, se houver blocos de código mal formados, erros de indentação, ou caracteres especiais que não são reconhecidos pela ferramenta, isso pode resultar na interrupção da análise e na geração de um arquivo CSV vazio.|
| Problemas de integração com outras ferramentas: | A ferramenta CK pode depender de outras ferramentas ou bibliotecas para analisar o código-fonte e calcular as métricas de complexidade. Se houver problemas de integração com essas ferramentas, como versões incompatíveis, configurações incorretas ou falhas durante a execução, isso pode impedir a geração dos dados necessários para preencher o arquivo CSV. |
| Problemas de configuração do projeto: |  Se o projeto não estiver configurado corretamente para ser analisado pela ferramenta CK, isso pode levar a problemas durante a análise do código-fonte e à geração de um arquivo CSV vazio. Por exemplo, se as configurações de caminho para o código-fonte ou para as ferramentas auxiliares estiverem incorretas, a ferramenta CK pode não conseguir acessar os arquivos necessários para realizar a análise. |
| Limitações da ferramenta CK: |  Em alguns casos, a própria ferramenta CK pode ter limitações ou bugs que podem causar problemas durante a análise do código-fonte e levar à geração de um arquivo CSV vazio. Nesses casos, pode ser necessário atualizar para uma versão mais recente da ferramenta ou procurar por soluções alternativas. |

### Tabela com dados auxiliares

<div align="center" style="display:flex;"> 
 
| Métrica | Média | Máximo | Mínimo |
| ----- | ----- | ----- | ----- |
| Releases | 26.29 | 344 | 0 |
| CBO | 5.24 | 13.89 | 0 |
| LCOM | 154652.74 | 438.49 | 0 |
| DIT | 3734 | 1 | 28.52 |
| LOC | 83756.40 | 4455723.0 | 2 |

</div>

<div align="center" style="display:flex;">
 
#### Spearman
 
|     | Estrelas                | Anos                    | Releases                | LOC                    |
|-----|-------------------------|-------------------------|-------------------------|------------------------|
| CBO | ρ = 0.047 \| P = 0.142 | ρ = -0.009 \| P = 0.776 | ρ = 0.370 \| P = 8.022 | ρ = 0.373 \| P = 2.410 |
| LCOM| ρ = 0.020 \| P = 0.530 | ρ =  0.147 \| P = 4.103 | ρ = 0.277 \| P = 1.676 | ρ = 0.477 \| P = 5.987 |
| DIT | ρ = 0.176 \| P = 3.654 | ρ =  0.218 \| P = 6.773 | ρ = 0.387 \| P = 5.734 | ρ = 0.805 \| P = 3.254 |

#### Pearson
 
|     | Estrelas                | Anos                    | Releases                | LOC                    |
|-----|-------------------------|-------------------------|-------------------------|------------------------|
| CBO | ρ = -0.076 \| P = 0.019 | ρ =  0.006 \| P = 0.850 | ρ =  0.213 \| P = 2.502 | ρ = 0.156 \| P = 1.179 |
| LCOM| ρ = -0.017 \| P = 0.592 | ρ =  0.033 \| P = 0.305 | ρ = -0.018 \| P = 0.583 | ρ = 0.101 \| P = 0.001 |
| DIT | ρ =  0.056 \| P = 0.080 | ρ = -0.032 \| P = 0.326 | ρ =  0.097 \| P = 0.002 | ρ = 0.323 \| P = 6.423 |


</div>



### Gráficos auxiliares

Nesta seção contem gráficos que auxiliam nas interpretações e tomadas de decisões para as análises das perguntas apresentadas nas [hipóteses](#hipoteses)


| | | |
|:-:|:-:|:-:|
|<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/1bc88527-7bdf-49f4-9831-f98a79ad28c1" alt="violin releases" align="left" height="auto" width="300">|<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/1616508a-b0c7-4ce7-b662-5221143669c9" alt="violin CBO" align="left" height="auto" width="300">|<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/6fb8f03d-feeb-4c8f-88ee-d0751c0ac0f6" alt="violin LOC" align="left" height="auto" width="300">|
|<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/0521a651-a87d-4439-8bc8-e017e04da371" alt="violin LOC [0, 900000]" align="left" height="auto" width="300">|<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/20b34051-f05e-40ab-b7d3-07373d95e3aa" alt="violin LCOM" align="left" height="auto" width="300">|<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/a282c6bc-df2f-496c-905a-74884820e7c2" alt="violin LCOM [0, 10000]" align="left" height="auto" width="300">|
|<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/0187a229-7964-4821-81e1-c418fb967c62" alt="violin DIT" align="left" height="auto" width="300">|<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/748df72f-6e64-4068-ad43-d2200116bb14" alt="violin DIT [0, 200]" align="left" height="auto" width="300">| <img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/dfe4aa34-b504-40cd-983b-c89dd1db8cd9" alt="bar DIT" align="left" height="auto" width="300"> |

### Análises

**Definições:** Para uma mlehor visualização do gráfico de dispersões, foi limitado o eixo de x de alguns deles. Os intervalos poderão ser observados tanto pela escala do eixo quanto pelo título:

-  **RQ 01.** Qual a relação entre a popularidade dos repositórios e as suas características de qualidade?

||||
|:-:|:-:|:-:|
|<img  src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/5866a376-37b1-47d4-9de6-84f53fcefbc5" alt="scatter CBO x Estrelas" align="left" height="auto" width="300">|<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/6e8e023f-5fa4-46b6-9c96-7a1827e0d632" alt="scatter LCOM x Estrelas" align="left" height="auto" width="300">| <img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/5f2e6819-086b-4a2a-87f1-923107c8a26c" alt="scatter DIT [0 - 100] x Estrelas" align="left" height="auto" width="300" >|

A análise dos gráficos revela que não existe uma relação direta entre a qualidade do código e a popularidade. Pelo contrário, nota-se uma convergência dos repositórios em direção à média geral das métricas   
examinadas neste estudo.

- **RQ 02.** Qual a relação entre a maturidade do repositórios e as suas características de qualidade ?

||||
|:-:|:-:|:-:|
|<img  src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/0e87de9d-4ead-4616-82d8-db83379b5ff9" alt="scatter CBO x anos" align="left" height="auto" width="300">|<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/60869094-52be-4f4f-b674-6103780a5c29" alt="scatter LCOM x anos" align="left" height="auto" width="300">| <img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/318abb90-d7f0-4b6b-84ee-bde4728317e0" alt="scatter DIT [0 - 100] x anos" align="left" height="auto" width="300" >|

Da mesma forma que a relação entre as métricas e a popularidade não é óbvia, também não há uma ligação clara entre a maturidade de um projeto e sua qualidade. Os gráficos revelam agrupamentos de projetos recentes, com até 2 anos de idade, que apresentam métricas semelhantes aos projetos com 10 anos ou mais. No entanto, é importante notar que, para o DIT, é possível observar valores mais elevados em projetos mais maduros, o que pode indicar uma possível perda de qualidade. O mesmo padrão se aplica à métrica LCOM, com um número maior de repositórios com mais de 6 anos de idade exibindo uma média relativamente alta na métrica LCOM.

- #### **RQ 03.** Qual a relação entre a atividade dos repositórios e as suas características de qualidade?

||||
|:-:|:-:|:-:|
|<img  src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/de5720fd-74dd-4e98-bd45-c8ca26522cf1" alt="scatter CBO x releases" align="left" height="auto" width="300">|<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/31854c1e-a8c8-4eaa-b3fe-7c710e1bbc07" alt="scatter LCOM x releases" align="left" height="auto" width="300">| <img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/53b38d48-b39b-475d-a054-5e762f734261" alt="scatter DIT [0 - 100] x releases" align="left" height="auto" width="300" >|

Não há uma correlação entre a atividade de um repositório e sua qualidade inicialmente.

- No que diz respeito ao CBO, o gráfico revela que repositórios ativos frequentemente compartilham métricas semelhantes com repositórios menos movimentados. No entanto, este último grupo exibe uma proporção maior de projetos com métricas mais baixas, sugerindo potencialmente uma melhor qualidade em comparação aos mais ativos.

- Quanto ao LCOM, observa-se uma tendência oposta à do CBO. Há uma proporção significativa de repositórios com métricas mais elevadas, indicando falta de coesão nos projetos, especialmente entre aqueles com menor número de lançamentos. No entanto, essa categoria representa uma minoria quando consideramos o panorama completo.

- O comportamento do DIT assemelha-se ao do LCOM.
   

- #### **RQ 04.** Qual a relação entre o tamanho dos repositórios e as suas características de qualidade?

||||
|:-:|:-:|:-:|
|<img  src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/e0482ee2-afc1-4e7d-ab70-87ef92ef05e2" alt="scatter CBO x LOC" align="left" height="auto" width="300">|<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/51252c7e-ae40-484d-887c-a2ce1c12ba91" alt="scatter LCOM x LOC" align="left" height="auto" width="300">| <img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/ba7f1a8d-2b08-4e91-84d8-c3b30628b576" alt="scatter DIT [0 - 100] x LOC" align="left" height="auto" width="300" >|

É possível estabelecer uma associação entre o aumento do número de linhas de código e os valores das métricas no primeiro momento. No entanto, após analisar os repositórios, destacam-se os seguintes pontos:

- CBO: De fato, os repositórios com menor quantidade de linhas de código tendem a ter um CBO menor. Porém, projetos com um CBO mais elevado também mostraram ter uma quantidade pequena de linhas de código em comparação com outros projetos. Além disso, os projetos com a maior quantidade de linhas apresentaram um valor semelhante à média geral.

- O comportamento do LCOM assemelha-se ao do CBO. No entanto, aqui é possível observar alguns projetos com um número de linhas maior do que a média, mas com valores de LCOM relativamente maiores.

- Quanto ao DIT, é possível observar uma tendência de manter-se entre o intervalo de 0 e 20, independentemente da quantidade de linhas.

<a id="conclusao"></a>
## Conslusão

Em suma, os resultados das análises dos repositórios destacam a complexidade das relações entre a atividade, a maturidade e a qualidade do código. Enquanto algumas métricas, como CBO e LCOM, revelam padrões que sugerem uma possível influência do tamanho do código na qualidade, outras, como DIT, mostram uma tendência mais consistente e independente da quantidade de linhas. Essas descobertas ressaltam a importância de uma avaliação abrangente e contextualizada da qualidade do código, levando em consideração não apenas métricas isoladas, mas também o contexto e os objetivos específicos de cada projeto.
