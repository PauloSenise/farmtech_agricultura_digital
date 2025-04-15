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
   * `NomeProdutor` **(Varchar)**: Nome do produtor

   ### Cultura
   * `ID_Cultura` **(PK, Integer)**: Identificador único da cultura
   * `NomeCultura` **(Varchar)**: Nome da cultura
   * `DescricaoCultura` **(Varchar)**: Descrição da cultura
   * `UmidadeIdeal` **(Double)**: Valor de referência da umidade ideal para essa cultura
   * `PHideal` **(Double)**: Valor de referência do (PH) ideal para essa cultura
   * `FosforoIdeal` **(Double)**: Valor de referência do (P) ideal para essa cultura
   * `PotassioIdeal` **(Double)**: Valor de referência do (K) ideal para essa cultura

   ### Talhão
   * `ID_Talhao` **(PK, Integer)**: Identificador únido do talhão
   * `NomeTalhao` **(Varchar)**: Nome do talhão
   * `AreaTalhao` **(Double)**: Área do talhão

   ### Sensor
   * `ID_Sensor` **(PK, Integer)**: Identificador único do sensor
   * `TipoSensor` **(Varchar)**: Tipo de sensor S1, S2, S3
   * `MarcaSensor` **(Varchar)**: Fabricante do sensore
   * `ModeloSensor` **(Varchar)**: Modelo do sensor
   * `SerieSensor` **(Integer)**: Número de série do sensor
   * `DataInstalacaoSensor` **(Date)**: Data de instalaçao do sensor

   ### LeituraSensor
   * `ID_Leitura` **(PK, Integer)**: Identificador único da leitura
   * `ID_Sensor` **(FK, Integer)**: Identificador do sensor que realizou a leitura (referência `Sensor`)
   * `ID_Talhao` **(FK, Integer)**: Identificador do talhão onde a leitura foi feita (referencia `Talhao`)
   * `DataHoraLeitura` **(TimeStamp)**: Data e hora da leitura
   * `ValorLeitura` **(Double)**: Valor da leitura (genérico)
   * `ValorUmidade` **(Double, NULLABLE)**: Valor da umidade (`TipoSensor` = 'S1')
   * `ValorpH` **(Double, NULLABLE)**: Valor do pH (`TipoSensor` = 'S2')
   * `ValorFosforo` **(Double, NULLABLE)**: Valor do fósforo (`TipoSensor` = 'S3')
   * `ValorPotassio` **(Double, NULLABLE)**: Valor do potássio (`TipoSensor` = 'S3')

   ### Aplicação de Água
   * `ID_AplicacaoAgua` **(PK, integer)**: Identificador único da aplicação
   * `ID_Talhao` **(FK, integer)**: Identificador do talhão onde a água foi aplicada (referencia `Talhao`)
   * `DataHoraAplicacao` **(timestamp)**: Data e hora da aplicação
   * `QuantidadeAguaAplicada` **(double)**: Quantidade de água aplicada
   
   ### Aplicação de Nutriente
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

   ## Relacionamentos:
   * Um **Produtor** pode ter **muitas** **Culturas** (1:N).
   * Um **Produtor** pode ter **muitos** **Talhões** (1:N).
   * Um **Talhão** pode ter **muitos** **Sensores** (1:N).
   * Um **Sensor** pode gerar **muitas** **LeiturasSensor** (1:N).
   * Uma **LeituraSensor** pertence a **um** **Sensor** (1:1 em relação ao FK).
   * Uma **LeituraSensor** é feita em **um** **Talhão** (1:1 em relação ao FK).
   * Um **Talhão** pode ter **muitas** **Aplicações de Água** (1:N).
   * Uma **Aplicação de Água** é feita em **um** **Talhão** (1:1 em relação ao FK).
   * Um **Talhão** pode ter **muitas** **Aplicações de Nutriente** (1:N).
   * Uma **Aplicação de Nutriente** é feita em **um** **Talhão** (1:1 em relação ao FK).
   * Uma **Cultura** pode estar em **muitos** **Plantios** (1:N).
   * Um **Talhão** pode ter **muitos** **Plantios** (1:N).
   * Um **Plantio** envolve **uma** **Cultura** (1:1 em relação ao FK).
   * Um **Plantio** ocorre em **um** **Talhão** (1:1 em relação ao FK).


