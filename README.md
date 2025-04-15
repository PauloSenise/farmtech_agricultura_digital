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
   * `FosforoIdeal` **(DOUBLE)**: Valor de referência do (P) ideal para essa cultura
   * `PotassioIdeal` **(DOUBLE)**: Valor de referência do (K) ideal para essa cultura

   ### Talhão
   * `ID_Talhao` **(PK, INTEGER)**: Identificador únido do talhão
   * `NomeTalhao` **(VARCHAR)**: Nome do talhão
   * `AreaTalhao` **(DOUBLE)**: Área do talhão

   ### Sensor
   * `ID_Sensor` **(PK, INTEGER)**: Identificador único do sensor
   * `TipoSensor` **(VARCHAR)**: Tipo de sensor S1, S2, S3
   * `MarcaSensor` **(VARCHAR)**: Fabricante do sensore
   * `ModeloSensor` **(VARCHAR)**: Modelo do sensor
   * `SerieSensor` **(INTEGER)**: Número de série do sensor
   * `DataInstalacaoSensor` **(DATE)**: Data de instalaçao do sensor

   ### LeituraSensor
   * `ID_Leitura` **(PK, INTEGER)**: Identificador único da leitura
   * `ID_Sensor` **(FK, INTEGER)**: Identificador do sensor que realizou a leitura (referência `Sensor`)
   * `ID_Talhao` **(FK, INTEGER)**: Identificador do talhão onde a leitura foi feita (referencia `Talhao`)
   * `DataHoraLeitura` **(TIMESTAMP)**: Data e hora da leitura
   * `ValorLeitura` **(DOUBLE)**: Valor da leitura (genérico)
   * `ValorUmidade` **(DOUBLE, NULLABLE)**: Valor da umidade (`TipoSensor` = 'S1')
   * `ValorpH` **(DOUBLE, NULLABLE)**: Valor do pH (`TipoSensor` = 'S2')
   * `ValorFosforo` **(DOUBLE, NULLABLE)**: Valor do fósforo (`TipoSensor` = 'S3')
   * `ValorPotassio` **(DOUBLE, NULLABLE)**: Valor do potássio (`TipoSensor` = 'S3')

   ### Aplicacao Agua
   * `ID_AplicacaoAgua` **(PK, integer)**: Identificador único da aplicação
   * `ID_Talhao` **(FK, integer)**: Identificador do talhão onde a água foi aplicada (referencia `Talhao`)
   * `DataHoraAplicacao` **(timestamp)**: Data e hora da aplicação
   * `QuantidadeAguaAplicada` **(double)**: Quantidade de água aplicada
   
   ### AplicacaoNutriente
   * `ID_AplicacaoNutriente` **(PK, integer)**: Identificador único da aplicação
   * `ID_Talhao` **(FK, integer)**: Identificador do talhão onde os nutrientes foram aplicados (referencia `Talhao`)
   * `DataHoraAplicacao` **(timestamp)**: Data e hora da aplicação
   * `QuantidadeFosforo` **(double)**: Quantidade de fósforo aplicada
   * `QuantidadePotassio` **(double)**: Quantidade de potássio aplicada
   * `QuantidadeNitrogenio` **(double, NULLABLE)**: Quantidade de nitrogênio aplicada
   
   ### Plantio (Tabela de Ligação)
   * `ID_Plantio` **(PK, integer)**: Identificador único do plantio
   * `ID_Cultura` **(FK, integer)**: Identificador da cultura plantada (referencia `Cultura`)
   * `ID_Talhao` **(FK, integer)**: Identificador do talhão onde a cultura foi plantada (referencia `Talhao`)
   * `DataInicioPlantio` **(date)**: Data de início do plantio
   * `DataFimPlantio` **(date, NULLABLE)**: Data de fim do plantio
























   

   ### Plantio 
   `ID_Plantio` **(PK, INTEGER)**: Identificador único do plantio
   
