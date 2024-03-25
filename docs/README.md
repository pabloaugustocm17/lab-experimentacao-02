# Relatório

#### Sumário:

- [Introdução](#introducao)
- [Metodologia](#metodologia)
- [Definiçãs de métricas](#metricas)
- [Coleta e Análise de Dados](#coletaDados)
- [Hipóteses informais](#hipoteses)
- [Resultados](#resultados)

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

Essa ferramenta gera diferentes arquivos .csv, porém para este trabalho será considerado apenas o arquivo *class.csv* que contém as métricas CBO, DIT e LCOM. Além disso, como essas
métricas são para classes e não para o sistema como todo, será utilizado a média dos resultados CBO e LCOM e o maior valor para DIT de cada sistema para as análises.

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

### Tem que explicar o descarte dos 12% e os motivos disso

-  **RQ 01.** Qual a relação entre a popularidade dos repositórios e as suas características de qualidade?

<div style="display: flex;">
  <img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/5866a376-37b1-47d4-9de6-84f53fcefbc5" alt="scatter CBO x Estrelas" style="width: 40%; height: auto;">
  <img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/40cf124b-7897-4c03-a47f-de02b28295dc" alt="scatter LCOM x Estrelas" style="width: 40%; height: auto;">
</div>




- **RQ 02.** Qual a relação entre a maturidade do repositórios e as suas características de qualidade ?

- #### **RQ 03.** Qual a relação entre a atividade dos repositórios e as suas características de qualidade?

- #### **RQ 04.** Qual a relação entre o tamanho dos repositórios e as suas características de qualidade?


