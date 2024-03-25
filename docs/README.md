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

Dos 1000 repositórios obtidos, 88% apresentaram valores satisfatórios e foram considerados para as análises subsequentes. Cerca de 9% correspondiam a recursos educacionais, tutoriais ou conteúdos similares, e, portanto, não continham códigos a serem avaliados. Por fim, os 11% restantes foram identificados com falhas na execução da ferramenta CK. Esses potenciais erros são exemplificados a seguir:

| **tipo** | **Descrição** |
|-------------|-------------|
| Erros de sintaxe no código-fonte: | Se o código-fonte contiver erros de sintaxe que a ferramenta CK não consegue analisar corretamente, isso pode impedir a extração de informações significativas para serem incluídas no arquivo CSV. Por exemplo, se houver blocos de código mal formados, erros de indentação, ou caracteres especiais que não são reconhecidos pela ferramenta, isso pode resultar na interrupção da análise e na geração de um arquivo CSV vazio.|
| Problemas de integração com outras ferramentas: | A ferramenta CK pode depender de outras ferramentas ou bibliotecas para analisar o código-fonte e calcular as métricas de complexidade. Se houver problemas de integração com essas ferramentas, como versões incompatíveis, configurações incorretas ou falhas durante a execução, isso pode impedir a geração dos dados necessários para preencher o arquivo CSV. |
| Problemas de configuração do projeto: |  Se o projeto não estiver configurado corretamente para ser analisado pela ferramenta CK, isso pode levar a problemas durante a análise do código-fonte e à geração de um arquivo CSV vazio. Por exemplo, se as configurações de caminho para o código-fonte ou para as ferramentas auxiliares estiverem incorretas, a ferramenta CK pode não conseguir acessar os arquivos necessários para realizar a análise. |
| Limitações da ferramenta CK: |  Em alguns casos, a própria ferramenta CK pode ter limitações ou bugs que podem causar problemas durante a análise do código-fonte e levar à geração de um arquivo CSV vazio. Nesses casos, pode ser necessário atualizar para uma versão mais recente da ferramenta ou procurar por soluções alternativas. |

### Gráficos auxiliares

-  **RQ 01.** Qual a relação entre a popularidade dos repositórios e as suas características de qualidade?

<div align="center" style="display: flex;">
<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/5866a376-37b1-47d4-9de6-84f53fcefbc5" alt="scatter CBO x Estrelas" style="width: 40%; height: auto;">
<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/40cf124b-7897-4c03-a47f-de02b28295dc" alt="scatter LCOM x Estrelas" style="width: 40%; height: auto;">
<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/53eb280b-e3ad-47f5-9f96-d6b4f24b05cb" alt="scatter DIT x Estrelas" style="width: 40%; height: auto;">
<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/5f2e6819-086b-4a2a-87f1-923107c8a26c" alt="scatter DIT [0 - 100] x Estrelas" style="width: 40%; height: auto;">
</div>

- **RQ 02.** Qual a relação entre a maturidade do repositórios e as suas características de qualidade ?

<div align="center">
<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/0e87de9d-4ead-4616-82d8-db83379b5ff9" alt="scatter CBO x Estrelas" style="width: 40%; height: auto;">
<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/c1dc3b34-c3d9-43df-8a9c-435b473541b3" alt="scatter LCOM x Estrelas" style="width: 40%; height: auto;">
<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/f079ab99-b1d7-41e6-850a-94388d109fe3" alt="scatter DIT x Estrelas" style="width: 40%; height: auto;">
<img src="https://github.com/pabloaugustocm17/lab-experimentacao-02/assets/90854173/318abb90-d7f0-4b6b-84ee-bde4728317e0" alt="scatter DIT [0 - 100] x Estrelas" style="width: 40%; height: auto;">
</div>


- #### **RQ 03.** Qual a relação entre a atividade dos repositórios e as suas características de qualidade?

- #### **RQ 04.** Qual a relação entre o tamanho dos repositórios e as suas características de qualidade?


