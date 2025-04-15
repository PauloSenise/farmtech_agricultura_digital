1. 🌱 Farmtech Solutions - Agricultura Digital - Modelagem de Banco de dados 🤖

A Farmtech Solutions está desenvolvendo um projeto voltado à Agricultura Digital, cujo objetivo é modelar um banco de dados relacional para o
monitoramento inteligente de plantações, com auxílio de sensores para coleta de dados, tais como: umidade, pH, nutrientes (fósforo F e potássio K) do solo.
Este repositório contém todos os artefatos relacionados à modelagem do sistema, incluindo o MER, DER, scripts SQL e a documentação técnica.

2. 👁️ Cenário

Um produtor rural utiliza sensores para aplicar a quantidade certa de água e nutrientes em diferentes culturas. 
O sistema registra dados em tempo real e sugere ajustes para otimizar os recursos e aumentar a produtividade.

3. Informações Relevantes e Dados Necessários para o MER
   
   |          Informações Relevantes         |                    Dados Necessários                        |
   |-----------------------------------------|-------------------------------------------------------------|
   | Qual cultura plantada em cada área      | Nome da cultura, data da plantação, área de plantio         |
   | e quando.                               | Identificador do plantio (para vincular outras informações).|
   |-----------------------------------------|-------------------------------------------------------------|
   | Quantidade de H2O aplicada em cada      | Data e hora da aplicação de água, quantidade de água        |
   | plantio por mês.                        | Identificador do plantio.                                   |
   |-----------------------------------------|-------------------------------------------------------------|
   | Variação do nível de PH do solo ao      | Data e hora da leitura do sensor de ph, valor do ph         |
   | longo do tempo do plantio.              | registrado, Itendificador do plantio.                       |
   |-----------------------------------------|-------------------------------------------------------------|
   | Variação dos níveis de nutrientes       | Data e hora da leitura do sensor de nutrientes,             |
   | (P e K) ao longo do tempo.              | valor do (P), valor do (K), Identificador do plantio.       |
   |-----------------------------------------|-------------------------------------------------------------|
   | Dados brutos coletados pelos sensores   | Identificador do sensor (S1), data e hora da leitura,       |
   | de umidade para cada plantio.           | valor da leitura da umidade (%), Identificador do plantio.  |
   |-----------------------------------------|-------------------------------------------------------------|
   | Dados brutos coletados pelos sensores   | Identificador do sensor (S2), data e hora da leitura,       |
   | de ph para cada plantio.                | valor da leitura, Identificador do plantio.                 |
   |-----------------------------------------|-------------------------------------------------------------|
   | Dados brutos coletados pelos sensores   | Identificador do sensor (S3), data e hora da leitura,       |
   | de nutrientes (NPK) para cada plantio.  | valor da leitura do potássio, valor da leitura do fósforo,  |
   | OBS: P = Fósforo / K = Potássio.        | Identificador do plantio.                                   |
   |-----------------------------------------|-------------------------------------------------------------|
   | Informações sobre diferentes culturas   | Nome da cultura, descrição da cultura, requisitos de umidade|
   | plantadas (características gerais).     | ideais, requisitos de ph ideais, requisitos de nutrientes   |
   |                                         | (P e K) ideais.                                             |
   |-----------------------------------------|-------------------------------------------------------------|
   | Informações das características dos     | Identificador do sensor, tipo de sensor (S1), (S2), (S3)    |
   | sensores utilizados.                    | marca do sensor, modelo do sensor, n° de série do sensor    |
   |                                         | data de instalação.                                         |
   |-----------------------------------------|-------------------------------------------------------------|
   | Informações sobre a aplicação de H2O    | Identificador da aplicação de H2O, data e hora da aplicação,|
   | realizadas em cada plantio.             | quantidade de H2O aplicada, metodo de aplicação,            |
   |                                         | Identificador do plantio.                                   |
   |-----------------------------------------|-------------------------------------------------------------|
   | Informações sobre a aplicação dos       | Identificador da aplicação de nutrientes, data e hora da    |
   | nutrientes em cada plantio.             | aplicação, quantidade de (P) aplicada, quantidade de (K)    |
   |                                         | aplicada, tipo de fertilizante, Identificador de palntio.   |
   |-----------------------------------------|-------------------------------------------------------------|


