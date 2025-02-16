![9](https://github.com/anacartola/FeVias-Stellantis/assets/136506553/cc891ea1-6105-4490-bb3b-f76a98e22b7f)
# FeVias Stellantis


[![Build Status](https://img.shields.io/badge/build-passing-brightgreen)](https://github.com/anacartola/FeVias-Stellantis/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Table of Contents
- [English](#english)
  - [Introduction](#introduction)
  - [Solution Video](#solution-video)
  - [Project Development in Oracle SQL](#project-development-in-oracle-sql)
  - [Project Files](#project-files)
  - [Data Dictionary](#database-tables-description)
  - [Setup Instructions](#setup-instructions)
  - [License](#license)
  - [Contact](#contact)
- [Português](#português)
  - [Introdução](#introdução)
  - [Vídeo da Solução](#vídeo-da-solução)
  - [Desenvolvimento do Projeto em Oracle SQL](#desenvolvimento-do-projeto-em-oracle-sql)
  - [Arquivos do Projeto](#arquivos-do-projeto)
  - [Instruções de Configuração](#instruções-de-configuração)
  - [Licença](#licença)
  - [Contato](#contato)

## English

### Introduction

The Stellantis group, a leader in sustainable solutions, posed a challenge to FIAP students: **"How can technology and innovation contribute to the issue of mobility, creating new solutions to increase efficiency, reduce accidents, allow greater access for populations, and foster a true smart society and smart mobility?"**

In response, this project presents the FeVias Monitoring Database (FerroVias), which harnesses Japanese Biotechnology combined with data from Brazilian railways. The aim is to revitalize the railway system using clean energy and rechargeable batteries, offering a sustainable and innovative solution to modern transportation challenges.

### Solution Video

Click the image below to watch our project video, which provides a comprehensive overview of our solution:

[![Project FeVias](https://img.youtube.com/vi/n5WVaHOHnvI/0.jpg)](https://www.youtube.com/watch?v=n5WVaHOHnvI)

### Project Development in Oracle SQL

This project is built using Oracle SQL. Below is a glimpse into the database construction:

![image](https://github.com/anacartola/FeVias-Stellantis/assets/136506553/39e54253-7e39-44df-a513-c788df7e8400)

### Project Files

- **DDL_FeVias.sql**: This script includes the creation of database objects. It outlines the normalized structure and includes necessary constraints for the database.
- **DDL_Drop.sql**: This file is used to completely remove the database, including all constraints, allowing for a fresh setup or removal.
- **DML_FeVias.sql**: These scripts populate the tables with both real data (for existing railway lines) and fictional data (for proposed lines as part of the solution).

## Database Tables Description

This section provides a detailed description of each table in the FeVias Monitoring Database, outlining their purpose and key attributes.

### Tables

- **t_sif_bateria**
  - **Description**: Stores information about batteries.
  - **Columns**:
    - `id_bateria`: Unique identifier for each battery.
    - `id_bateria_carreg`: Identifier for the battery charging process.
    - `ds_bateria`: Description of the battery.

- **t_sif_bateria_carreg**
  - **Description**: Contains details about battery charging processes.
  - **Columns**:
    - `id_bateria_carreg`: Unique identifier for each charging process.
    - `ds_bateria_carreg`: Description of the charging process.
    - `perc_carga_bateria`: Percentage of battery charge.

- **t_sif_bateria_estacao**
  - **Description**: Records battery transfers to stations.
  - **Columns**:
    - `id_estacao`: Identifier of the station.
    - `id_bateria`: Identifier of the battery.
    - `dt_transferencia`: Date and time of battery transfer to the station.

- **t_sif_cidade**
  - **Description**: Stores city information.
  - **Columns**:
    - `id_cidade`: Unique identifier for each city.
    - `sg_estado`: State abbreviation.
    - `nm_cidade`: Name of the city.

- **t_sif_concessionaria**
  - **Description**: Contains information about railway concessionaires.
  - **Columns**:
    - `id_concessionaria`: Unique identifier for each concessionaire.
    - `nm_concessionaria`: Name of the concessionaire.

- **t_sif_empresa**
  - **Description**: Stores company information.
  - **Columns**:
    - `id_empresa`: Unique identifier for each company.
    - `nm_razao_social`: Company name.
    - `cd_cnpj`: Company CNPJ (Tax ID in Brazil).

- **t_sif_estacao**
  - **Description**: Contains information about railway stations.
  - **Columns**:
    - `id_estacao`: Unique identifier for each station.
    - `id_trecho`: Identifier of the railway section.
    - `id_loc_estacao`: Identifier of the station location.
    - `nm_estacao`: Name of the station.
    - `vr_carrega_bateria`: Indicates if the station can charge batteries ('S' for Yes, 'N' for No).

- **t_sif_estado**
  - **Description**: Stores state information.
  - **Columns**:
    - `sg_estado`: State abbreviation.
    - `nm_estado`: Name of the state.

- **t_sif_linha**
  - **Description**: Details about railway lines.
  - **Columns**:
    - `id_linha`: Unique identifier for each line.
    - `id_concessionaria`: Identifier of the concessionaire.
    - `nm_linha`: Name of the line.

- **t_sif_loc_bateria**
  - **Description**: Records battery transfers to locomotives.
  - **Columns**:
    - `id_locomotiva`: Identifier of the locomotive.
    - `id_bateria`: Identifier of the battery.
    - `dt_transferencia`: Date and time of battery transfer to the locomotive.

- **t_sif_loc_vagao**
  - **Description**: Details about locomotive-wagon relationships and weights.
  - **Columns**:
    - `id_locomotiva`: Identifier of the locomotive.
    - `id_vagao`: Identifier of the wagon.
    - `vl_peso`: Weight of the wagon.
    - `dt_atualizacao_peso`: Date and time of the weight update.

- **t_sif_localiza_estacao**
  - **Description**: Information about station locations.
  - **Columns**:
    - `id_loc_estacao`: Unique identifier for each station location.
    - `id_cidade`: Identifier of the city.
    - `nm_localizacao`: Name of the location (city/state).

- **t_sif_locomotiva**
  - **Description**: Stores information about locomotives.
  - **Columns**:
    - `id_locomotiva`: Unique identifier for each locomotive.
    - `nm_locomotiva`: Name of the locomotive.
    - `nr_vagoes`: Number of wagons attached to the locomotive.

- **t_sif_registro**
  - **Description**: Records details of locomotive trips.
  - **Columns**:
    - `id_registro`: Unique identifier for each trip record.
    - `id_locomotiva`: Identifier of the locomotive.
    - `id_estacao`: Identifier of the station.
    - `ds_registro`: Description of the trip.
    - `hr_saida`: Departure time.
    - `hr_chegada`: Arrival time.
    - `cd_cidade_saida`: Departure city code.
    - `cd_cidade_chegada`: Arrival city code.

- **t_sif_trecho**
  - **Description**: Details about railway sections.
  - **Columns**:
    - `id_trecho`: Unique identifier for each section.
    - `t_sif_linha_id_linha`: Identifier of the railway line.
    - `nm_trecho`: Name of the section.
    - `nr_tamanhokm`: Length of the section in kilometers.

- **t_sif_vagao**
  - **Description**: Stores information about wagons.
  - **Columns**:
    - `id_vagao`: Unique identifier for each wagon.
    - `tp_vagao`: Type of wagon ('P' for passengers, 'O' for objects).
    - `vl_peso_vagao`: Weight of the wagon.

- **t_sif_vagao_empresa**
  - **Description**: Links companies with locomotives and wagons.
  - **Columns**:
    - `id_empresa`: Identifier of the company.
    - `id_locomotiva`: Identifier of the locomotive.
    - `id_vagao`: Identifier of the wagon.



### Setup Instructions

1. **Clone the Repository**: `git clone https://github.com/anacartola/FeVias-Stellantis.git`
2. **Install Oracle SQL**: Ensure Oracle SQL is installed and configured.
3. **Run the Scripts**: Execute the DDL and DML scripts in Oracle SQL to set up the database.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Contact

For questions or support, please contact [anacarolina.cartola@gmail.com](mailto:anacarolina.cartola@gmail.com).

## Português

### Introdução

O grupo Stellantis, referência em soluções sustentáveis, desafiou os alunos da FIAP: **"Como a tecnologia e a inovação podem contribuir para a questão da mobilidade, criando novas soluções para aumentar a eficiência, reduzir os acidentes, permitir maior acesso das populações e criar uma verdadeira smart society e smart mobility?"**

Como resposta, este projeto apresenta o Banco de Monitoramento FeVias (FerroVias), que utiliza Biotecnologia Japonesa combinada com dados das ferrovias brasileiras. O objetivo é revitalizar o sistema ferroviário utilizando energia limpa e baterias recarregáveis, oferecendo uma solução sustentável e inovadora para os desafios do transporte moderno.

### Vídeo da Solução

Clique na imagem abaixo para assistir ao vídeo do nosso projeto, que fornece uma visão geral abrangente da nossa solução:

[![Project FeVias](https://img.youtube.com/vi/n5WVaHOHnvI/0.jpg)](https://www.youtube.com/watch?v=n5WVaHOHnvI)

### Desenvolvimento do Projeto em Oracle SQL

Este projeto foi desenvolvido usando Oracle SQL. Abaixo está uma visão da construção do banco de dados:

![image](https://github.com/anacartola/FeVias-Stellantis/assets/136506553/39e54253-7e39-44df-a513-c788df7e8400)

### Arquivos do Projeto

- **DDL_FeVias.sql**: Scripts de criação das objetos de seu banco de dados. Aqui está inclusa a construção do Banco, normalizado e com as devidas constraints.
- **DDL_Drop.sql**: Arquivo para apagar o Banco em sua totalidade, assim como as constraints.
- **DML_FeVias.sql**: Scripts de população das tabelas. Estão inclusos dados reais (para linhas ferroviárias já existentes) e fictícios (para linhas que seriam criadas com a solução).

### Instruções de Configuração

1. **Clone o Repositório**: `git clone https://github.com/anacartola/FeVias-Stellantis.git`
2. **Instale o Oracle SQL**: Certifique-se de que o Oracle SQL está instalado e configurado.
3. **Execute os Scripts**: Execute os scripts DDL e DML no Oracle SQL para configurar o banco de dados.

### Licença

Este projeto é licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

### Contato

Para perguntas ou suporte, entre em contato com [anacarolina.cartola@gmail.com](mailto:anacarolina.cartola@gmail.com).
