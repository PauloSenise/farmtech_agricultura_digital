## 🌱**1. Farmtech Solutions - Agricultura Digital - Modelagem de Banco de dados** 🤖

A Farmtech Solutions está desenvolvendo um projeto voltado à Agricultura Digital, cujo objetivo é modelar um banco de dados relacional para o
monitoramento inteligente de plantações, com auxílio de sensores para coleta de dados, tais como: umidade, pH, nutrientes (fósforo F e potássio K) do solo.
Este repositório contém todos os artefatos relacionados à modelagem do sistema, incluindo o MER, DER, scripts SQL e a documentação técnica.

## 👁️**2. Cenário**

Um produtor rural utiliza sensores para aplicar a quantidade certa de água e nutrientes em diferentes culturas. 
O sistema registra dados em tempo real e sugere ajustes para otimizar os recursos e aumentar a produtividade.

## **3. Informações Relevantes e Dados Necessários para o MER**
   
   | Informações Relevantes | Dados Necessários |
   |:-----------------------|:------------------|
   | Qual cultura plantada em cada área e quando.| Nome da cultura, data da plantação, área de plantio Identificador do plantio (para vincular outras informações).|
   | Quantidade de H2O aplicada em cada plantio por mês.| Data e hora da aplicação de água, quantidade de água Identificador do plantio.|
   | Variação do nível de PH do solo ao longo do tempo do plantio.| Data e hora da leitura do sensor de ph, valor do ph registrado, Itendificador do plantio.|
   | Variação dos níveis de nutrientes (P e K) ao longo do tempo.| Data e hora da leitura do sensor de nutrientes, valor do (P), valor do (K), Identificador do plantio.|
   | Dados brutos coletados pelos sensores de umidade para cada plantio.| Identificador do sensor (S1), data e hora da leitura, valor da leitura da umidade (%), Identificador do plantio.|
   | Dados brutos coletados pelos sensores de ph para cada plantio.| Identificador do sensor (S2), data e hora da leitura, valor da leitura, Identificador do plantio.|
   | Dados brutos coletados pelos sensores de nutrientes (NPK) para cada plantio. OBS: P = Fósforo / K = Potássio.| Identificador do sensor (S3), data e hora da leitura, valor da leitura do potássio, valor da leitura do fósforo, Identificador do plantio.|
   | Informações sobre diferentes culturas plantadas (características gerais).| Nome da cultura, descrição da cultura, requisitos de umidade ideais, requisitos de ph ideais, requisitos de nutrientes (P e K) ideais.|
   | Informações das características dos sensores utilizados.| Identificador do sensor, tipo de sensor (S1), (S2), (S3) marca do sensor, modelo do sensor, n° de série do sensor data de instalação.|
   | Informações sobre a aplicação de H2O realizadas em cada plantio.| Identificador da aplicação de H2O, data e hora da aplicação, quantidade de H2O aplicada, metodo de aplicação, Identificador do plantio.|
   | Informações sobre a aplicação dos nutrientes em cada plantio.| Identificador da aplicação de nutrientes, data e hora da aplicação, quantidade de (P), quantidade de (K), tipo de fertilizante,Identificador de palntio.|

   ## 4. Modelo Entidade-Relacionamento (MER) - Projeto Farmtech Solutions
   Este documento descreve o Modelo Entidade-Relacionamento (MER) para o sistema de agricultura digital da FarmTech Solutions, modelando o armazenamento e análise de dados de sensores.
   ## Criação das Entidades e Atributos MER 

   ### Produtor
   * `ID_Produtor` **(PK, Integer)**: Identificador único do produtor
   * `NomeProdutor` **(VARCHAR)**: Nome do produtor

   ### Cultura
   * `ID_Cultura` **(PK, INTEGER)**: Identificador único da cultura
   * `NomeCultura` **(VARCHAR)**: Nome da cultura
   * `DescricaoCultura` **(VARCHAR)**: Descrição da cultura
   * `UmidadeIdeal` **(DOUBLE)**: Valor de referência da umidade ideal para essa cultura
   * `PHideal` **(DOUBLE)**: Valor de referência do (PH) ideal para essa cultura
   * `Pideal` **(DOUBLE)**: Valor de referência do (P) ideal para essa cultura
   * `Kideal` **(DOUBLE)**: Valor de referência do (K) ideal para essa cultura

   ### Talhão
