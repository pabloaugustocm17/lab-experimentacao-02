# Relatório

## Introdução

No processo de desenvolvimento de sistemas open-source, em que diversos desenvolvedores contribuem em partes diferentes do código, um dos riscos a serem gerenciados diz respeito à evolução dos seus atributos de qualidade interna. Isto é, ao se adotar uma abordagem colaborativa, corre-se o risco de tornar vulnerável aspectos como modularidade, manutenabilidade, ou legibilidade do software produzido. Para tanto, diversas abordagens modernas buscam aperfeiçoar tal processo, através da adoção de práticas relacionadas à revisão de código ou à análise estática através de ferramentas de CI/CD.

Neste contexto, o objetivo deste laboratório é analisar aspectos da qualidade de repositórios desenvolvidos na linguagem Java, correlacionado-os com características do seu processo de desenvolvimento, sob a perspectiva de métricas de produto calculadas através da ferramenta [CK](https://github.com/mauricioaniche/ck).

## Metodologia

### 1. Seleção de Repositórios

Com o objetivo de analisar repositórios relevantes, escritos na linguagem estudada, coletaremos os top-1.000 repositórios Java mais populares do GitHub, calculando cada uma das métricas definidas na Seção 3.

### 2. Questões de Pesquisa

Desta forma, este laboratório tem o objetivo de responder às seguintes questões de pesquisa:

- **RQ 01.** Qual a relação entre a popularidade dos repositórios e as suas características de qualidade?
- **RQ 02.** Qual a relação entre a maturidade do repositórios e as suas características de qualidade ? 
- **RQ 03.** Qual a relação entre a atividade dos repositórios e as suas características de qualidade?  
- **RQ 04.** Qual a relação entre o tamanho dos repositórios e as suas características de qualidade?  
 

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
 

### 4. Coleta e Análise de Dados

Para análise das métricas de popularidade, atividade e maturidade, serão coletadas informações dos repositórios mais populares em Java, utilizando o GraphQL do GitHub. Para medição dos valores de qualidade, utilizaremos uma ferramenta de análise estática de código anteriormente citada, [CK](https://github.com/mauricioaniche/ck).

Essa ferramenta gera diferentes arquivos .csv, porém para este trabalho será considerado apenas o arquivo *class.csv* que contém as métricas CBO, DIT e LCOM. Além disso, como essas
métricas são para classes e não para o sistema como todo, será utilizado a média dos resultados CBO e LCOM e o maior valor para DIT de cada sistema para as análises.

## Hipóteses informais

- #### **RQ 01.** Qual a relação entre a popularidade dos repositórios e as suas características de qualidade?

- #### **RQ 02.** Qual a relação entre a maturidade do repositórios e as suas características de qualidade ? 

- #### **RQ 03.** Qual a relação entre a atividade dos repositórios e as suas características de qualidade?  

- #### **RQ 04.** Qual a relação entre o tamanho dos repositórios e as suas características de qualidade?  

## Resultados
