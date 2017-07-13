/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE IF NOT EXISTS `clinic2901` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `clinic2901`;

CREATE TABLE IF NOT EXISTS `agendamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT '0',
  `ProfissionalID` int(11) DEFAULT '0',
  `Data` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `TipoCompromissoID` int(11) DEFAULT '0',
  `StaID` int(11) DEFAULT '0',
  `ValorPlano` float DEFAULT NULL,
  `rdValorPlano` varchar(1) DEFAULT NULL,
  `Notas` text,
  `Falado` varchar(3) DEFAULT NULL,
  `FormaPagto` int(11) DEFAULT '0',
  `LocalID` int(11) DEFAULT NULL,
  `Tempo` varchar(3) DEFAULT NULL,
  `HoraFinal` time DEFAULT NULL,
  `SubtipoProcedimentoID` int(11) DEFAULT NULL,
  `HoraSta` time DEFAULT NULL,
  `ConfEmail` char(1) DEFAULT NULL,
  `ConfSMS` char(1) DEFAULT NULL,
  `Encaixe` int(11) DEFAULT NULL,
  `EquipamentoID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `agendamentoseatendimentos` (
	`id` INT(11) NOT NULL,
	`Data` DATE NULL,
	`HoraInicio` TIME NULL,
	`HoraFim` TIME NULL,
	`ProcedimentoID` INT(11) NULL,
	`ProfissionalID` INT(11) NULL,
	`Obs` MEDIUMTEXT NULL COLLATE 'utf8_general_ci',
	`ValorPlano` FLOAT NULL,
	`rdValorPlano` VARCHAR(1) NULL COLLATE 'utf8_general_ci',
	`PacienteID` INT(11) NULL,
	`Icone` VARCHAR(11) NULL COLLATE 'utf8mb4_general_ci',
	`Tipo` VARCHAR(11) NOT NULL COLLATE 'utf8mb4_general_ci',
	`AgendamentoID` INT(11) NULL
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS `agendamentosrepeticoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AgendamentoID` int(11) DEFAULT NULL,
  `Agendamentos` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `agendamentosrespostas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AgendamentoID` int(11) DEFAULT NULL,
  `Resposta` varchar(500) DEFAULT NULL,
  `DataHora` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `agendaobservacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProfissionalID` int(11) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Observacoes` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `agendaocupacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Data` date DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `HLivres` int(11) DEFAULT NULL,
  `HAgendados` int(11) DEFAULT NULL,
  `HBloqueados` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `arquivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeArquivo` varchar(150) DEFAULT NULL,
  `Descricao` varchar(150) DEFAULT NULL,
  `Tipo` char(1) DEFAULT NULL,
  `PacienteID` int(11) DEFAULT NULL,
  `DataHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `asa_atendimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `DataHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sysUser` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `1` text,
  `2` text,
  `3` text,
  `4` text,
  `5` text,
  `6` text,
  `7` text,
  `8` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=235394 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `assfixalocalxprofissional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DiaSemana` int(11) DEFAULT NULL,
  `HoraDe` time DEFAULT NULL,
  `HoraA` time DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `LocalID` int(11) DEFAULT NULL,
  `Intervalo` int(11) DEFAULT '30',
  `Compartilhada` varchar(1) DEFAULT '',
  `Especialidades` text,
  `Procedimentos` text,
  `Convenios` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `assperiodolocalxprofissional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DataDe` date DEFAULT NULL,
  `DataA` date DEFAULT NULL,
  `HoraDe` time DEFAULT NULL,
  `HoraA` time DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `LocalID` int(11) DEFAULT NULL,
  `Intervalo` int(11) DEFAULT '30',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `atendimentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `AgendamentoID` int(11) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `HoraInicio` time DEFAULT NULL,
  `HoraFim` time DEFAULT NULL,
  `Obs` text,
  `sysUser` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `UsuariosNotificados` varchar(200) DEFAULT NULL,
  `UnidadeID` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `atendimentosmateriais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AtendProcID` int(11) DEFAULT NULL,
  `InfConf` char(1) DEFAULT NULL,
  `ProdutoID` int(11) DEFAULT NULL,
  `ValorUnitario` float DEFAULT NULL,
  `Quantidade` float DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `sysDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `atendimentosprocedimentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AtendimentoID` int(11) NOT NULL DEFAULT '0',
  `ProcedimentoID` int(11) NOT NULL DEFAULT '0',
  `Quantidade` float NOT NULL DEFAULT '1',
  `QuantidadeSolicitada` float NOT NULL DEFAULT '1',
  `QuantidadeAutorizada` float NOT NULL DEFAULT '1',
  `Obs` text,
  `ValorPlano` float DEFAULT NULL,
  `rdValorPlano` varchar(1) DEFAULT NULL,
  `Fator` float DEFAULT '1',
  `ValorFinal` float DEFAULT '0',
  `PlanoTabela` float DEFAULT '0',
  `Ordem` int(11) DEFAULT '0',
  `ItemInvoiceID` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `autorizador_tiss_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Sucesso` tinyint(4) DEFAULT NULL,
  `DataHora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Metodo` varchar(50) NOT NULL,
  `Mensagem` varchar(150) DEFAULT NULL,
  `NumeroGuiaPrestador` int(11) DEFAULT NULL,
  `NumeroGuiaOperadora` int(11) DEFAULT NULL,
  `StatusSolicitacao` int(11) DEFAULT NULL,
  `CodigoGlosa` int(11) DEFAULT NULL,
  `QuantidadeAutorizada` tinyint(4) DEFAULT NULL,
  `GuiaID` int(11) DEFAULT NULL,
  `Endpoint` varchar(150) DEFAULT NULL,
  `sys_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `buicamposforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TipoCampoID` int(11) DEFAULT NULL,
  `NomeCampo` varchar(45) DEFAULT NULL,
  `RotuloCampo` varchar(388) DEFAULT NULL,
  `FormID` int(11) DEFAULT NULL,
  `Ordem` int(11) DEFAULT NULL,
  `ValorPadrao` longtext,
  `Tamanho` int(11) DEFAULT NULL,
  `Largura` varchar(10) DEFAULT NULL,
  `MaxCarac` varchar(10) DEFAULT NULL,
  `Checado` varchar(1) DEFAULT NULL,
  `Obrigatorio` varchar(1) DEFAULT NULL COMMENT 'checkbox do título',
  `Texto` longtext COMMENT 'texto complementar',
  `pTop` int(11) DEFAULT NULL,
  `pLeft` int(11) DEFAULT NULL,
  `Colunas` int(11) DEFAULT NULL,
  `Linhas` int(11) DEFAULT NULL,
  `GrupoID` int(11) DEFAULT '0',
  `AvisoFechamento` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `buicurva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CampoID` int(11) DEFAULT NULL,
  `FormPID` int(11) DEFAULT NULL,
  `PacienteID` int(11) DEFAULT NULL,
  `Meses` int(11) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `Valor2` float DEFAULT NULL,
  `Valor3` float DEFAULT NULL,
  `Valor4` float DEFAULT NULL,
  `sysDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `buiforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  `Especialidade` varchar(350) DEFAULT NULL,
  `Tipo` int(11) DEFAULT NULL,
  `TipoTitulo` varchar(1) DEFAULT NULL,
  `sysActive` int(11) NOT NULL DEFAULT '0',
  `sysUser` int(11) NOT NULL DEFAULT '0',
  `LadoALado` char(1) DEFAULT '',
  `Versao` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `buiformsestilo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ParametroID` int(11) DEFAULT NULL,
  `Valor` varchar(50) DEFAULT NULL,
  `Elemento` varchar(50) DEFAULT NULL,
  `FormID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `buiformslembrarme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `ModeloID` int(11) DEFAULT NULL,
  `FormID` int(11) DEFAULT NULL,
  `CampoID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `buiformsparametros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Parametro` varchar(50) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Descricao` varchar(50) DEFAULT NULL,
  `ValorPadrao-caixa` varchar(50) DEFAULT NULL,
  `ValorPadrao-input` varchar(50) DEFAULT NULL,
  `ValorPadrao-label` varchar(50) DEFAULT NULL,
  `ValorPadrao-caixaGrupo` varchar(50) DEFAULT NULL,
  `ValorPadrao-labelGrupo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `buiformspreenchidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ModeloID` int(11) DEFAULT NULL,
  `FormID` int(11) DEFAULT NULL,
  `PacienteID` int(11) DEFAULT NULL,
  `DataHora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sysUser` int(11) DEFAULT NULL,
  `Autorizados` varchar(300) DEFAULT NULL,
  `ProfissionaisLaudar` varchar(300) DEFAULT NULL,
  `LaudadoEm` datetime DEFAULT NULL,
  `LaudadoPor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `buiinputsmultiplos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CampoID` int(11) DEFAULT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Rotulo` varchar(255) DEFAULT NULL,
  `Valor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `buiopcoescampos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CampoID` int(11) DEFAULT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Valor` varchar(145) DEFAULT NULL,
  `Selecionado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `buipermissoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` char(1) DEFAULT NULL,
  `FormID` int(11) DEFAULT NULL,
  `Grupo` varchar(1000) DEFAULT NULL,
  `Permissoes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `buiregistrosforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `FormID` int(11) DEFAULT NULL,
  `FormPID` int(11) DEFAULT NULL,
  `Data` int(11) DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `buitabelasmodelos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CampoID` int(11) DEFAULT NULL,
  `c1` varchar(100) DEFAULT NULL,
  `c2` varchar(100) DEFAULT NULL,
  `c3` varchar(100) DEFAULT NULL,
  `c4` varchar(100) DEFAULT NULL,
  `c5` varchar(100) DEFAULT NULL,
  `c6` varchar(100) DEFAULT NULL,
  `c7` varchar(100) DEFAULT NULL,
  `c8` varchar(100) DEFAULT NULL,
  `c9` varchar(100) DEFAULT NULL,
  `c10` varchar(100) DEFAULT NULL,
  `c11` varchar(100) DEFAULT NULL,
  `c12` varchar(100) DEFAULT NULL,
  `c13` varchar(100) DEFAULT NULL,
  `c14` varchar(100) DEFAULT NULL,
  `c15` varchar(100) DEFAULT NULL,
  `c16` varchar(100) DEFAULT NULL,
  `c17` varchar(100) DEFAULT NULL,
  `c18` varchar(100) DEFAULT NULL,
  `c19` varchar(100) DEFAULT NULL,
  `c20` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `buitabelastitulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CampoID` int(11) DEFAULT NULL,
  `c1` varchar(100) DEFAULT NULL,
  `c2` varchar(100) DEFAULT NULL,
  `c3` varchar(100) DEFAULT NULL,
  `c4` varchar(100) DEFAULT NULL,
  `c5` varchar(100) DEFAULT NULL,
  `c6` varchar(100) DEFAULT NULL,
  `c7` varchar(100) DEFAULT NULL,
  `c8` varchar(100) DEFAULT NULL,
  `c9` varchar(100) DEFAULT NULL,
  `c10` varchar(100) DEFAULT NULL,
  `c11` varchar(100) DEFAULT NULL,
  `c12` varchar(100) DEFAULT NULL,
  `c13` varchar(100) DEFAULT NULL,
  `c14` varchar(100) DEFAULT NULL,
  `c15` varchar(100) DEFAULT NULL,
  `c16` varchar(100) DEFAULT NULL,
  `c17` varchar(100) DEFAULT NULL,
  `c18` varchar(100) DEFAULT NULL,
  `c19` varchar(100) DEFAULT NULL,
  `c20` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `buitabelasvalores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CampoID` int(11) DEFAULT NULL,
  `FormPreenchidoID` int(11) DEFAULT NULL,
  `c1` varchar(100) DEFAULT NULL,
  `c2` varchar(100) DEFAULT NULL,
  `c3` varchar(100) DEFAULT NULL,
  `c4` varchar(100) DEFAULT NULL,
  `c5` varchar(100) DEFAULT NULL,
  `c6` varchar(100) DEFAULT NULL,
  `c7` varchar(100) DEFAULT NULL,
  `c8` varchar(100) DEFAULT NULL,
  `c9` varchar(100) DEFAULT NULL,
  `c10` varchar(100) DEFAULT NULL,
  `c11` varchar(100) DEFAULT NULL,
  `c12` varchar(100) DEFAULT NULL,
  `c13` varchar(100) DEFAULT NULL,
  `c14` varchar(100) DEFAULT NULL,
  `c15` varchar(100) DEFAULT NULL,
  `c16` varchar(100) DEFAULT NULL,
  `c17` varchar(100) DEFAULT NULL,
  `c18` varchar(100) DEFAULT NULL,
  `c19` varchar(100) DEFAULT NULL,
  `c20` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `buitiposcamposforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TipoCampo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `buitiposforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeTipo` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `caixa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysUser` int(11) DEFAULT NULL,
  `dtAbertura` datetime DEFAULT NULL,
  `dtFechamento` datetime DEFAULT NULL,
  `SaldoInicial` float DEFAULT '0',
  `SaldoFinal` float DEFAULT '0',
  `ContaCorrenteID` int(11) NOT NULL DEFAULT '0',
  `Descricao` varchar(200) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `centrocusto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeCentroCusto` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `chamadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StaID` int(11) DEFAULT '0',
  `sysUserAtend` int(11) DEFAULT NULL,
  `RejeitadaPor` varchar(500) DEFAULT '',
  `DataHora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DataHoraAtend` timestamp NULL DEFAULT NULL,
  `RE` char(1) DEFAULT NULL,
  `Telefone` varchar(50) DEFAULT NULL,
  `Contato` varchar(255) DEFAULT NULL,
  `Resultado` int(11) DEFAULT NULL,
  `Subresultado` int(11) DEFAULT NULL,
  `Notas` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `chamadasagendamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ChamadaID` int(11) DEFAULT NULL,
  `AgendamentoID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `chamadasresultados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RE` char(1) DEFAULT NULL,
  `Pai` int(11) DEFAULT NULL,
  `Descricao` varchar(500) DEFAULT NULL,
  `ScriptID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `chamadasscript` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Texto` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `chatmensagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `De` int(11) DEFAULT NULL,
  `Para` int(11) DEFAULT NULL,
  `Mensagem` varchar(1000) DEFAULT NULL,
  `DataHora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `chequemovimentacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ChequeID` int(11) DEFAULT NULL,
  `MovimentacaoID` int(11) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `sysDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `chequesinvoice` (
	`Valor` FLOAT NULL,
	`InvoiceID` INT(11) NULL,
	`DataPagto` DATE NULL,
	`UnidadeID` INT(11) NULL
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS `chequestatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `compartilhar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Anamneses` varchar(2) DEFAULT '',
  `Evolucoes` varchar(2) DEFAULT '',
  `Laudos` varchar(2) DEFAULT '',
  `Formularios` varchar(2) DEFAULT '',
  `Prescricoes` varchar(2) DEFAULT '',
  `Atestados` varchar(2) DEFAULT '',
  `EmailPaciente` varchar(250) DEFAULT NULL,
  `EmailProfissional` varchar(250) DEFAULT NULL,
  `SenhaWebsite` varchar(250) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `PacienteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `componentesformulas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Substancia` varchar(200) DEFAULT NULL,
  `Quantidade` varchar(200) DEFAULT NULL,
  `FormulaID` int(11) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `compromissos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DataDe` date DEFAULT NULL,
  `DataA` date DEFAULT NULL,
  `HoraDe` time DEFAULT NULL,
  `HoraA` time DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `Titulo` varchar(150) DEFAULT NULL,
  `Descricao` text,
  `Usuario` int(11) DEFAULT NULL,
  `Data` varchar(30) DEFAULT NULL,
  `DiasSemana` varchar(20) DEFAULT NULL,
  `ExibirOutros` varchar(1) DEFAULT NULL,
  `LocalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `conselhosprofissionais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `TISS` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `contatos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeContato` varchar(200) DEFAULT NULL,
  `Sexo` int(11) DEFAULT NULL,
  `Cep` varchar(9) DEFAULT NULL,
  `Cidade` varchar(200) DEFAULT NULL,
  `Estado` varchar(200) DEFAULT NULL,
  `Endereco` varchar(200) DEFAULT NULL,
  `Numero` varchar(200) DEFAULT NULL,
  `Complemento` varchar(200) DEFAULT NULL,
  `Bairro` varchar(200) DEFAULT NULL,
  `Tel1` varchar(200) DEFAULT NULL,
  `Email1` varchar(200) DEFAULT NULL,
  `Observacoes` text,
  `Tel2` varchar(200) DEFAULT NULL,
  `Cel1` varchar(200) DEFAULT NULL,
  `Cel2` varchar(200) DEFAULT NULL,
  `Email2` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `UnidadeID` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `contratadoexterno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeContratado` varchar(200) DEFAULT NULL,
  `CodigoNaOperadora` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `contratadoexternoconvenios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ContratadoExternoID` int(11) DEFAULT NULL,
  `ConvenioID` int(11) DEFAULT NULL,
  `CodigoNaOperadora` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `contratos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `InvoiceID` int(11) DEFAULT NULL,
  `Associacao` int(11) DEFAULT NULL,
  `ContaID` int(11) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `ModeloID` int(11) DEFAULT NULL,
  `Contrato` text,
  `DataHora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `contratosconvenio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ConvenioID` int(11) DEFAULT NULL,
  `Contratado` int(11) DEFAULT NULL,
  `ContaRecebimento` int(11) DEFAULT NULL,
  `CodigoNaOperadora` varchar(50) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  `Prioridades` varchar(300) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `SomenteUnidades` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `contratosmodelos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeModelo` varchar(100) DEFAULT NULL,
  `Conteudo` longtext,
  `AgruparExecutante` char(1) DEFAULT '',
  `AgruparParcela` varchar(1) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `convenios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeConvenio` varchar(200) DEFAULT NULL,
  `Foto` varchar(50) DEFAULT NULL,
  `RazaoSocial` varchar(200) DEFAULT NULL,
  `TelAut` varchar(200) DEFAULT NULL,
  `Contato` varchar(200) DEFAULT NULL,
  `RegistroANS` varchar(200) DEFAULT NULL,
  `CNPJ` varchar(200) DEFAULT NULL,
  `Endereco` varchar(200) DEFAULT NULL,
  `Numero` varchar(200) DEFAULT NULL,
  `Complemento` varchar(200) DEFAULT NULL,
  `Bairro` varchar(200) DEFAULT NULL,
  `Cidade` varchar(200) DEFAULT NULL,
  `Estado` varchar(200) DEFAULT NULL,
  `Cep` varchar(200) DEFAULT NULL,
  `Telefone` varchar(200) DEFAULT NULL,
  `Fax` varchar(200) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `NumeroContrato` varchar(200) DEFAULT NULL,
  `Obs` text,
  `ContaRecebimento` int(11) DEFAULT NULL,
  `RetornoConsulta` varchar(200) DEFAULT NULL,
  `FaturaAtual` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `TabelaPadrao` int(11) DEFAULT NULL,
  `Contratado` int(11) DEFAULT NULL,
  `segundoProcedimento` float DEFAULT '100',
  `terceiroProcedimento` float DEFAULT '100',
  `quartoProcedimento` float DEFAULT '100',
  `versaoTISS` int(11) DEFAULT '30200',
  `tissVerificaElegibilidade` varchar(255) DEFAULT NULL,
  `tissSolicitacaoProcedimento` varchar(255) DEFAULT NULL,
  `tissSolicitacaoStatusAutorizacao` varchar(255) DEFAULT NULL,
  `tissLoteGuias` varchar(255) DEFAULT NULL,
  `tissCancelaGuia` varchar(255) DEFAULT NULL,
  `tissSolicitacaoDemonstrativoRetorno` varchar(255) DEFAULT NULL,
  `NumeroGuiaAtual` varchar(100) DEFAULT '0',
  `MinimoDigitos` int(11) DEFAULT NULL,
  `MaximoDigitos` int(11) DEFAULT NULL,
  `Digito11` tinyint(4) DEFAULT NULL,
  `ObrigarValidade` tinyint(4) DEFAULT NULL,
  `ContratadosPreCadastrados` tinyint(4) DEFAULT NULL,
  `BloquearAlteracoes` tinyint(4) DEFAULT NULL,
  `MesclagemMateriais` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `conveniosplanos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomePlano` varchar(200) DEFAULT NULL,
  `ConvenioID` int(11) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cor` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `corpele` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeCorPele` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeEmpresa` varchar(200) DEFAULT NULL,
  `NomeFantasia` varchar(200) DEFAULT NULL,
  `Cep` varchar(200) DEFAULT NULL,
  `Endereco` varchar(200) DEFAULT NULL,
  `Numero` varchar(200) DEFAULT NULL,
  `Complemento` varchar(200) DEFAULT NULL,
  `Bairro` varchar(200) DEFAULT NULL,
  `Cidade` varchar(200) DEFAULT NULL,
  `Estado` varchar(200) DEFAULT NULL,
  `Tel1` varchar(200) DEFAULT NULL,
  `Tel2` varchar(200) DEFAULT NULL,
  `Cel1` varchar(200) DEFAULT NULL,
  `Obs` text,
  `Email1` varchar(200) DEFAULT NULL,
  `Email2` varchar(200) DEFAULT NULL,
  `CNPJ` varchar(200) DEFAULT NULL,
  `Cel2` varchar(200) DEFAULT NULL,
  `CNES` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `Foto` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `equipamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeEquipamento` varchar(150) DEFAULT NULL,
  `Foto` varchar(150) DEFAULT NULL,
  `Obs` text,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `especialidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `especialidade` varchar(150) DEFAULT NULL,
  `codigo` varchar(8) DEFAULT NULL,
  `codigoTISS` varchar(20) DEFAULT NULL,
  `nomeEspecialidade` varchar(255) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT '0',
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `estadocivil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EstadoCivil` varchar(50) DEFAULT NULL,
  `sysActive` int(11) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `estados` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(120) DEFAULT NULL,
  `sigla` varchar(2) DEFAULT NULL,
  `pais` int(11) DEFAULT NULL,
  `origem` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `estoquelancamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProdutoID` int(11) DEFAULT NULL,
  `EntSai` char(1) DEFAULT NULL,
  `Quantidade` float DEFAULT NULL,
  `TipoUnidade` char(1) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `FornecedorID` int(11) DEFAULT NULL,
  `Lote` varchar(50) DEFAULT NULL,
  `Validade` date DEFAULT NULL,
  `NF` varchar(50) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `UnidadePagto` char(1) DEFAULT NULL,
  `Observacoes` text,
  `Responsavel` varchar(15) DEFAULT NULL,
  `PacienteID` int(11) DEFAULT NULL,
  `Lancar` char(1) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `sysDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `QuantidadeConjunto` float DEFAULT NULL,
  `QuantidadeTotal` float DEFAULT NULL,
  `ItemInvoiceID` int(11) DEFAULT NULL,
  `FuncaoRateioID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `feriados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeFeriado` varchar(255) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `sysDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `filaespera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT '0',
  `ProfissionalID` int(11) DEFAULT '0',
  `TipoCompromissoID` int(11) DEFAULT '0',
  `ValorPlano` float DEFAULT NULL,
  `rdValorPlano` varchar(1) DEFAULT NULL,
  `Notas` text,
  `LocalID` int(11) DEFAULT NULL,
  `Tempo` varchar(3) DEFAULT NULL,
  `SubtipoProcedimentoID` int(11) DEFAULT NULL,
  `sysDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `fornecedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeFornecedor` varchar(200) DEFAULT NULL,
  `Cep` varchar(200) DEFAULT NULL,
  `Endereco` varchar(200) DEFAULT NULL,
  `Numero` varchar(200) DEFAULT NULL,
  `Complemento` varchar(200) DEFAULT NULL,
  `Bairro` varchar(200) DEFAULT NULL,
  `Cidade` varchar(200) DEFAULT NULL,
  `Estado` varchar(200) DEFAULT NULL,
  `Tel1` varchar(200) DEFAULT NULL,
  `Tel2` varchar(200) DEFAULT NULL,
  `Cel1` varchar(200) DEFAULT NULL,
  `Obs` text,
  `Ativo` varchar(200) DEFAULT NULL,
  `Email1` varchar(200) DEFAULT NULL,
  `Email2` varchar(200) DEFAULT NULL,
  `RG` varchar(200) DEFAULT NULL,
  `CPF` varchar(200) DEFAULT NULL,
  `Cel2` varchar(200) DEFAULT NULL,
  `Pais` int(11) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `funcionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeFuncionario` varchar(200) DEFAULT NULL,
  `Foto` varchar(50) DEFAULT NULL,
  `Cep` varchar(200) DEFAULT NULL,
  `Endereco` varchar(200) DEFAULT NULL,
  `Numero` varchar(200) DEFAULT NULL,
  `Complemento` varchar(200) DEFAULT NULL,
  `Bairro` varchar(200) DEFAULT NULL,
  `Cidade` varchar(200) DEFAULT NULL,
  `Estado` varchar(200) DEFAULT NULL,
  `Tel1` varchar(200) DEFAULT NULL,
  `Tel2` varchar(200) DEFAULT NULL,
  `Cel1` varchar(200) DEFAULT NULL,
  `Obs` text,
  `Ativo` varchar(200) DEFAULT NULL,
  `Email1` varchar(200) DEFAULT NULL,
  `Email2` varchar(200) DEFAULT NULL,
  `Sexo` int(11) DEFAULT NULL,
  `RG` varchar(200) DEFAULT NULL,
  `CPF` varchar(200) DEFAULT NULL,
  `Cel2` varchar(200) DEFAULT NULL,
  `Nascimento` date DEFAULT NULL,
  `Pais` int(11) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `Unidades` varchar(255) DEFAULT '|0|',
  `CentroCustoID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `googleagenda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AgendamentoID` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `GoogleID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `grauinstrucao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `GrauInstrucao` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `horarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProfissionalID` int(11) DEFAULT '0',
  `Atende` varchar(1) DEFAULT NULL,
  `Dia` int(11) DEFAULT '0',
  `HoraDe` time DEFAULT NULL,
  `HoraAs` time DEFAULT NULL,
  `Pausa` varchar(1) DEFAULT NULL,
  `PausaDe` time DEFAULT NULL,
  `PausaAs` time DEFAULT NULL,
  `Intervalos` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `impressos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Cabecalho` text,
  `Rodape` text,
  `Prescricoes` text,
  `Atestados` text,
  `PedidosExame` text,
  `Recibos` text,
  `RecibosIntegrados` text,
  `CabecalhoProposta` text,
  `RodapeProposta` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `inativacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `Motivo` text,
  `sysUser` int(11) DEFAULT NULL,
  `DataHora` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `invoicesfixas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  `AssociationAccountID` int(11) DEFAULT NULL,
  `PrimeiroVencto` date DEFAULT NULL,
  `Value` float DEFAULT NULL,
  `Tax` float DEFAULT NULL,
  `Currency` varchar(5) DEFAULT NULL,
  `Description` text,
  `CompanyUnitID` int(11) DEFAULT NULL,
  `Intervalo` int(11) DEFAULT NULL,
  `TipoIntervalo` varchar(4) DEFAULT NULL,
  `CD` char(1) DEFAULT NULL,
  `Sta` char(1) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `FormaID` int(11) DEFAULT '0',
  `ContaRectoID` int(11) DEFAULT '0',
  `sysDate` date DEFAULT NULL,
  `Geradas` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `itensdescontados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ItemID` int(11) DEFAULT NULL,
  `PagamentoID` int(11) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `itensinvoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `InvoiceID` int(11) NOT NULL DEFAULT '0',
  `Tipo` char(1) DEFAULT NULL,
  `Quantidade` float NOT NULL DEFAULT '1',
  `CategoriaID` int(11) DEFAULT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `ValorUnitario` float NOT NULL DEFAULT '0',
  `Desconto` float NOT NULL DEFAULT '0',
  `Descricao` varchar(50) DEFAULT NULL,
  `Executado` char(1) DEFAULT NULL,
  `DataExecucao` date DEFAULT NULL,
  `HoraExecucao` time DEFAULT NULL,
  `GrupoID` int(11) NOT NULL DEFAULT '0',
  `AgendamentoID` int(11) NOT NULL DEFAULT '0',
  `sysUser` int(11) DEFAULT NULL,
  `sysDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ProfissionalID` int(11) DEFAULT NULL,
  `HoraFim` time DEFAULT NULL,
  `Acrescimo` float DEFAULT '0',
  `AtendimentoID` int(11) DEFAULT '0',
  `Associacao` int(11) DEFAULT '5',
  `OdontogramaObj` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12003 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `itensinvoicefixa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `InvoiceID` int(11) NOT NULL DEFAULT '0',
  `Tipo` char(1) DEFAULT NULL,
  `Quantidade` float NOT NULL DEFAULT '1',
  `CategoriaID` int(11) DEFAULT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `ValorUnitario` float NOT NULL DEFAULT '0',
  `Desconto` float NOT NULL DEFAULT '0',
  `Descricao` varchar(50) DEFAULT NULL,
  `Executado` char(1) DEFAULT NULL,
  `DataExecucao` date DEFAULT NULL,
  `HoraExecucao` time DEFAULT NULL,
  `GrupoID` int(11) NOT NULL DEFAULT '0',
  `AgendamentoID` int(11) NOT NULL DEFAULT '0',
  `sysUser` int(11) DEFAULT NULL,
  `sysDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ProfissionalID` int(11) DEFAULT NULL,
  `HoraFim` time DEFAULT NULL,
  `Acrescimo` float DEFAULT '0',
  `AtendimentoID` int(11) DEFAULT '0',
  `Associacao` int(11) DEFAULT '5',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `itensproposta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PropostaID` int(11) NOT NULL DEFAULT '0',
  `Tipo` char(1) DEFAULT NULL,
  `Quantidade` float NOT NULL DEFAULT '1',
  `CategoriaID` int(11) DEFAULT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `ValorUnitario` float NOT NULL DEFAULT '0',
  `Desconto` float NOT NULL DEFAULT '0',
  `Descricao` varchar(50) DEFAULT NULL,
  `Executado` char(1) DEFAULT NULL,
  `DataExecucao` date DEFAULT NULL,
  `HoraExecucao` time DEFAULT NULL,
  `GrupoID` int(11) NOT NULL DEFAULT '0',
  `AgendamentoID` int(11) NOT NULL DEFAULT '0',
  `sysUser` int(11) DEFAULT NULL,
  `sysDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ProfissionalID` int(11) DEFAULT NULL,
  `HoraFim` time DEFAULT NULL,
  `Acrescimo` float DEFAULT '0',
  `OdontogramaObj` text,
  `AtendimentoID` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `locais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeLocal` varchar(200) DEFAULT NULL,
  `d1` int(11) DEFAULT '0',
  `d2` int(11) DEFAULT '0',
  `d3` int(11) DEFAULT '0',
  `d4` int(11) DEFAULT '0',
  `d5` int(11) DEFAULT '0',
  `d6` int(11) DEFAULT '0',
  `d7` int(11) DEFAULT '0',
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `UnidadeID` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `locaisgrupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeGrupo` varchar(200) DEFAULT NULL,
  `Locais` varchar(245) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `logsmarcacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `ProcedimentoID` int(11) DEFAULT NULL,
  `DataHoraFeito` varchar(30) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Sta` int(11) DEFAULT NULL,
  `Usuario` int(11) DEFAULT NULL,
  `Motivo` int(11) DEFAULT NULL,
  `Obs` text,
  `ARX` varchar(1) DEFAULT NULL,
  `ConsultaID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `medcal_atendimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `DataHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sysUser` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `1` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `motivosreagendamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Motivo` varchar(255) DEFAULT NULL,
  `Solicitante` int(11) DEFAULT NULL,
  `ExcRem` int(11) DEFAULT NULL,
  `sysActive` int(11) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `nfe_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `InvoiceID` int(11) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `metodo` varchar(50) NOT NULL,
  `versao` varchar(50) NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sucesso` varchar(5) NOT NULL,
  `situacao` int(11) NOT NULL DEFAULT '0',
  `motivo` varchar(255) NOT NULL,
  `erros` varchar(600) DEFAULT NULL,
  `protocolo` varchar(100) NOT NULL,
  `chave` varchar(150) NOT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `nfe_notasemitidas` (
  `InvoiceID` int(11) DEFAULT NULL,
  `numero` int(18) NOT NULL,
  `datageracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `protocolo` varchar(50) DEFAULT NULL,
  `cnpj` varchar(50) DEFAULT NULL,
  `versao` varchar(5) DEFAULT NULL,
  `sucesso` varchar(10) DEFAULT NULL,
  `modelo` int(11) DEFAULT NULL,
  `situacao` int(11) DEFAULT NULL,
  `dataemissao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `protocolosefaz` varchar(100) DEFAULT NULL,
  `chave` varchar(50) DEFAULT NULL,
  `motivo` varchar(1000) DEFAULT NULL,
  `pdf` text,
  `erro` varchar(100) DEFAULT NULL,
  `serie` int(11) DEFAULT '1',
  PRIMARY KEY (`numero`),
  UNIQUE KEY `InvoiceID` (`InvoiceID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `nfe_origens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CNPJ` varchar(20) DEFAULT NULL,
  `InscricaoEstadual` varchar(50) DEFAULT NULL,
  `InscricaoMunicipal` varchar(50) DEFAULT NULL,
  `CodigoRegimeTributario` tinyint(4) DEFAULT '4',
  `CNAE` varchar(50) DEFAULT NULL,
  `IncentivoFiscal` tinyint(4) DEFAULT '2',
  `PagaISS` tinyint(4) DEFAULT '1',
  `SituacaoTributariaPIS` int(11) DEFAULT '1',
  `AliquotaPIS` tinyint(4) DEFAULT NULL,
  `AliquotaISS` tinyint(4) DEFAULT '2',
  `ServicoLCP116` varchar(5) DEFAULT '04.01',
  `DFeTokenApp` varchar(30) DEFAULT '0',
  `NotaInicio` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `CNPJ` (`CNPJ`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `obrigacampos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(20) DEFAULT NULL,
  `Recurso` varchar(50) DEFAULT NULL,
  `Grupo` varchar(1000) DEFAULT NULL,
  `Obrigar` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `odontograma_estagio_inicial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DataHora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PacienteID` int(11) DEFAULT NULL,
  `SituacaoID` int(11) DEFAULT NULL,
  `DenteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `odontograma_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Item` int(11) DEFAULT NULL,
  `OdontogramaObj` text,
  `ProcedimentoID` int(11) DEFAULT NULL,
  `CodigoProcedimento` int(11) DEFAULT NULL,
  `PacienteID` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `Associacao` int(11) DEFAULT NULL,
  `Quantidade` float DEFAULT '1',
  `ValorUnitario` float DEFAULT NULL,
  `Desconto` float DEFAULT NULL,
  `Acrescimo` float DEFAULT NULL,
  `Executado` char(1) DEFAULT NULL,
  `DataExecucao` date DEFAULT NULL,
  `HoraExecucao` time DEFAULT NULL,
  `HoraFim` time DEFAULT NULL,
  `Descricao` varchar(50) DEFAULT NULL,
  `sysDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `omissaocampos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` char(1) DEFAULT NULL,
  `Recurso` varchar(50) DEFAULT NULL,
  `Grupo` varchar(1000) DEFAULT NULL,
  `Omitir` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `origens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Origem` varchar(255) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `sysActive` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pacientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomePaciente` varchar(200) DEFAULT NULL,
  `Nascimento` date DEFAULT NULL,
  `Sexo` int(11) DEFAULT NULL,
  `Cep` varchar(9) DEFAULT NULL,
  `Cidade` varchar(200) DEFAULT NULL,
  `Estado` varchar(200) DEFAULT NULL,
  `Endereco` varchar(200) DEFAULT NULL,
  `Numero` varchar(200) DEFAULT NULL,
  `Complemento` varchar(200) DEFAULT NULL,
  `Bairro` varchar(200) DEFAULT NULL,
  `EstadoCivil` int(11) DEFAULT NULL,
  `CorPele` int(11) DEFAULT NULL,
  `GrauInstrucao` int(11) DEFAULT NULL,
  `Profissao` varchar(200) DEFAULT NULL,
  `Naturalidade` varchar(200) DEFAULT NULL,
  `Tel1` varchar(200) DEFAULT NULL,
  `Documento` varchar(200) DEFAULT NULL,
  `Origem` varchar(200) DEFAULT NULL,
  `Email1` varchar(200) DEFAULT NULL,
  `CPF` varchar(20) DEFAULT NULL,
  `Tabela` int(11) DEFAULT NULL,
  `Peso` varchar(200) DEFAULT NULL,
  `Altura` varchar(200) DEFAULT NULL,
  `IMC` varchar(200) DEFAULT NULL,
  `Observacoes` text,
  `Pendencias` text,
  `Foto` varchar(100) DEFAULT NULL,
  `Religiao` varchar(200) DEFAULT NULL,
  `Tel2` varchar(200) DEFAULT NULL,
  `Cel1` varchar(200) DEFAULT NULL,
  `Cel2` varchar(200) DEFAULT NULL,
  `Email2` varchar(200) DEFAULT NULL,
  `Pais` int(11) DEFAULT NULL,
  `IndicadoPor` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `sysDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CNS` varchar(50) DEFAULT NULL,
  `lembrarPendencias` varchar(250) DEFAULT '',
  `ConvenioID1` int(11) DEFAULT NULL,
  `ConvenioID2` int(11) DEFAULT NULL,
  `ConvenioID3` int(11) DEFAULT NULL,
  `PlanoID1` int(11) DEFAULT NULL,
  `PlanoID2` int(11) DEFAULT NULL,
  `PlanoID3` int(11) DEFAULT NULL,
  `Matricula1` varchar(100) DEFAULT NULL,
  `Matricula2` varchar(100) DEFAULT NULL,
  `Matricula3` varchar(100) DEFAULT NULL,
  `Titular1` varchar(100) DEFAULT NULL,
  `Titular2` varchar(100) DEFAULT NULL,
  `Titular3` varchar(100) DEFAULT NULL,
  `Validade1` date DEFAULT NULL,
  `Validade2` date DEFAULT NULL,
  `Validade3` date DEFAULT NULL,
  `idImportado` int(11) DEFAULT NULL,
  `ConstatusID` int(11) DEFAULT '1',
  `Interesses` varchar(150) DEFAULT NULL,
  `ValorInteresses` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=66557 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `pacientesatestados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sysUser` int(11) DEFAULT NULL,
  `PacienteID` int(11) DEFAULT NULL,
  `Atestado` longtext,
  `Titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `pacientesatestadostextos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeAtestado` varchar(255) DEFAULT NULL,
  `TituloAtestado` varchar(255) DEFAULT NULL,
  `TextoAtestado` text,
  `sysActive` varchar(1) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `pacientesdiagnosticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `CidID` int(11) DEFAULT NULL,
  `Descricao` varchar(500) DEFAULT NULL,
  `DataHora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pacientesformulas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) DEFAULT NULL,
  `Uso` varchar(55) DEFAULT NULL,
  `Quantidade` varchar(55) DEFAULT NULL,
  `Grupo` varchar(50) DEFAULT NULL,
  `Prescricao` text,
  `Observacoes` text,
  `sysUser` int(11) DEFAULT NULL,
  `sysActive` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pacientesmedicamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Medicamento` varchar(255) DEFAULT NULL,
  `Apresentacao` varchar(255) DEFAULT NULL,
  `Grupo` varchar(50) DEFAULT NULL,
  `Uso` varchar(255) DEFAULT NULL,
  `Quantidade` varchar(25) DEFAULT NULL,
  `Prescricao` text,
  `Observacoes` text,
  `sysActive` varchar(1) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pacientespedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sysUser` int(11) DEFAULT NULL,
  `PacienteID` int(11) DEFAULT NULL,
  `PedidoExame` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pacientespedidostextos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomePedido` varchar(255) DEFAULT NULL,
  `TituloPedido` varchar(255) DEFAULT NULL,
  `TextoPedido` text,
  `sysActive` varchar(1) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pacientesprescricoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sysUser` int(11) DEFAULT NULL,
  `PacienteID` int(11) DEFAULT NULL,
  `Prescricao` text,
  `ControleEspecial` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pacientespropostasformas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PropostaID` int(11) NOT NULL DEFAULT '0',
  `Descricao` text,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `pacientespropostasoutros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PropostaID` int(11) NOT NULL DEFAULT '0',
  `Descricao` text,
  `Valor` varchar(255) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `pacientesrelativos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(200) DEFAULT NULL,
  `Relacionamento` varchar(200) DEFAULT NULL,
  `PacienteID` int(11) DEFAULT NULL,
  `Dependente` varchar(1) DEFAULT NULL,
  `NomeID` int(11) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pacientesretornos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Data` date DEFAULT NULL,
  `Motivo` varchar(200) DEFAULT NULL,
  `Usuario` varchar(200) DEFAULT NULL,
  `PacienteID` int(11) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pacotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomePacote` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pacotesitens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcedimentoID` int(11) DEFAULT NULL,
  `ValorUnitario` float DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `PacoteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `paises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomePais` varchar(50) DEFAULT NULL,
  `sysActive` int(11) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `papeltimbrado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeModelo` varchar(200) DEFAULT NULL,
  `Cabecalho` text,
  `Rodape` text,
  `Profissionais` varchar(300) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `ponto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UsuarioID` int(11) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Inicio` time DEFAULT NULL,
  `Fim` time DEFAULT NULL,
  `Tipo` varchar(10) DEFAULT NULL COMMENT 'Chegada TI, Almoco AI, Almoco Fim AF, Saida TF',
  `IP` varchar(45) DEFAULT NULL,
  `Device` varchar(45) DEFAULT NULL,
  `Just` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1474 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `procedimentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeProcedimento` varchar(200) DEFAULT NULL,
  `TipoProcedimentoID` int(11) DEFAULT NULL,
  `Valor` float DEFAULT '0',
  `Obs` text,
  `ObrigarTempo` varchar(200) DEFAULT NULL,
  `OpcoesAgenda` int(11) DEFAULT NULL,
  `TempoProcedimento` varchar(200) DEFAULT NULL,
  `MaximoAgendamentos` varchar(200) DEFAULT '1',
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `AvisoAgenda` text,
  `TextoEmail` longtext,
  `TextoSMS` varchar(200) DEFAULT NULL,
  `MensagemDiferenciada` char(1) DEFAULT NULL,
  `DiasRetorno` int(11) DEFAULT NULL,
  `TextoPedido` text,
  `Codigo` varchar(20) DEFAULT NULL,
  `Sigla` varchar(20) DEFAULT NULL,
  `EquipamentoPadrao` int(11) DEFAULT NULL,
  `GrupoID` int(11) DEFAULT NULL,
  `SomenteConvenios` varchar(1000) DEFAULT NULL,
  `SolIC` char(1) DEFAULT '',
  `SomenteProfissionais` text,
  `SomenteEspecialidades` text,
  `SomenteLocais` text,
  `Cor` varchar(10) DEFAULT NULL,
  `RegiaoUnitaria` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2301 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `procedimentosequipeconvenio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcedimentoID` int(11) DEFAULT NULL,
  `Funcao` int(11) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `TipoValor` varchar(1) DEFAULT NULL,
  `ContaPadrao` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `procedimentosequipeparticular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcedimentoID` int(11) DEFAULT NULL,
  `Funcao` varchar(50) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `TipoValor` varchar(1) DEFAULT NULL,
  `ContaPadrao` varchar(10) DEFAULT NULL,
  `TabelasPermitidas` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `procedimentosgrupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeGrupo` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `procedimentoskits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `KitID` int(1) DEFAULT NULL,
  `ProcedimentoID` int(1) DEFAULT NULL,
  `Casos` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `procedimentosopcoesagenda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Opcao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `procedimentosvalores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Unidades` varchar(400) DEFAULT NULL,
  `TabelasParticulares` varchar(400) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeProduto` varchar(200) DEFAULT NULL,
  `Foto` varchar(50) DEFAULT NULL,
  `Codigo` varchar(200) DEFAULT NULL,
  `CategoriaID` int(11) DEFAULT NULL,
  `FabricanteID` int(11) DEFAULT NULL,
  `LocalizacaoID` int(11) DEFAULT NULL,
  `ApresentacaoNome` varchar(200) DEFAULT NULL,
  `ApresentacaoQuantidade` float DEFAULT NULL,
  `ApresentacaoUnidade` int(11) DEFAULT NULL,
  `EstoqueMinimo` float DEFAULT NULL,
  `PrecoCompra` float DEFAULT NULL,
  `PrecoVenda` float DEFAULT NULL,
  `TipoCompra` varchar(200) DEFAULT NULL,
  `TipoVenda` varchar(200) DEFAULT NULL,
  `Obs` text,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `AutorizacaoEmpresa` varchar(50) DEFAULT NULL,
  `RegistroANVISA` varchar(50) DEFAULT NULL,
  `CD` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10809 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `produtoscategorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeCategoria` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `produtosdokit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProdutoID` int(11) DEFAULT NULL,
  `KitID` int(11) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `Codigo` varchar(50) DEFAULT NULL,
  `Variavel` varchar(1) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `Quantidade` float DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `produtosfabricantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeFabricante` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `produtoskits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeKit` varchar(150) DEFAULT NULL,
  `TabelaID` int(11) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `produtoslocalizacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeLocalizacao` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `profissionais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TratamentoID` int(11) DEFAULT NULL,
  `Foto` varchar(50) DEFAULT NULL,
  `NomeProfissional` varchar(200) DEFAULT NULL,
  `EspecialidadeID` int(11) DEFAULT NULL,
  `Nascimento` date DEFAULT NULL,
  `Cor` varchar(200) DEFAULT NULL,
  `Ativo` varchar(200) DEFAULT NULL,
  `Sexo` int(11) DEFAULT NULL,
  `CPF` varchar(200) DEFAULT NULL,
  `DocumentoProfissional` varchar(200) DEFAULT NULL,
  `DocumentoConselho` varchar(200) DEFAULT NULL,
  `Conselho` varchar(40) DEFAULT NULL,
  `UFConselho` varchar(2) DEFAULT NULL,
  `Cep` varchar(10) DEFAULT NULL,
  `Endereco` varchar(200) DEFAULT NULL,
  `Numero` varchar(200) DEFAULT NULL,
  `Complemento` varchar(200) DEFAULT NULL,
  `Bairro` varchar(200) DEFAULT NULL,
  `Cidade` varchar(200) DEFAULT NULL,
  `Estado` varchar(200) DEFAULT NULL,
  `Tel1` varchar(200) DEFAULT NULL,
  `Pais` int(11) DEFAULT NULL,
  `Tel2` varchar(200) DEFAULT NULL,
  `Cel1` varchar(200) DEFAULT NULL,
  `Cel2` varchar(200) DEFAULT NULL,
  `Obs` text,
  `ObsAgenda` text,
  `Email1` varchar(200) DEFAULT NULL,
  `Email2` varchar(200) DEFAULT NULL,
  `CNEs` varchar(200) DEFAULT NULL,
  `IBGE` varchar(200) DEFAULT NULL,
  `CBOS` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `GrauPadrao` int(11) DEFAULT '0',
  `Unidades` varchar(255) DEFAULT '|0|',
  `GoogleCalendar` varchar(255) DEFAULT '',
  `MaximoEncaixes` int(11) DEFAULT NULL,
  `AnamnesePadrao` int(11) DEFAULT NULL,
  `EvolucaoPadrao` int(11) DEFAULT NULL,
  `SomenteConvenios` varchar(800) DEFAULT NULL,
  `CentroCustoID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `profissionaisespecialidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProfissionalID` int(11) DEFAULT NULL,
  `EspecialidadeID` int(11) DEFAULT NULL,
  `Conselho` varchar(40) DEFAULT NULL,
  `UFConselho` varchar(20) DEFAULT NULL,
  `DocumentoConselho` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `profissionalexterno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ContratadoExternoID` int(11) DEFAULT NULL,
  `NomeProfissional` varchar(200) DEFAULT NULL,
  `Conselho` varchar(200) DEFAULT NULL,
  `UFConselho` varchar(200) DEFAULT NULL,
  `DocumentoConselho` varchar(200) DEFAULT NULL,
  `EspecialidadeID` int(11) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `TratamentoID` int(11) DEFAULT NULL,
  `Foto` varchar(50) DEFAULT NULL,
  `Nascimento` date DEFAULT NULL,
  `Cor` varchar(200) DEFAULT NULL,
  `Sexo` int(11) DEFAULT NULL,
  `CPF` varchar(50) DEFAULT NULL,
  `DocumentoProfissional` varchar(50) DEFAULT NULL,
  `Cep` varchar(10) DEFAULT NULL,
  `Endereco` varchar(200) DEFAULT NULL,
  `Numero` varchar(50) DEFAULT NULL,
  `Complemento` varchar(50) DEFAULT NULL,
  `Bairro` varchar(50) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `Tel1` varchar(50) DEFAULT NULL,
  `Pais` varchar(50) DEFAULT NULL,
  `Tel2` varchar(50) DEFAULT NULL,
  `Cel1` varchar(50) DEFAULT NULL,
  `Cel2` varchar(50) DEFAULT NULL,
  `Obs` text,
  `Email1` varchar(200) DEFAULT NULL,
  `Email2` varchar(200) DEFAULT NULL,
  `CNEs` varchar(20) DEFAULT NULL,
  `IBGE` varchar(20) DEFAULT NULL,
  `CBOS` varchar(20) DEFAULT NULL,
  `Login` varchar(50) DEFAULT NULL,
  `Senha` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `propostas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `UnidadeID` int(11) DEFAULT NULL,
  `StaID` int(11) DEFAULT NULL,
  `TituloItens` varchar(255) DEFAULT NULL,
  `TituloOutros` varchar(255) DEFAULT NULL,
  `TituloPagamento` varchar(255) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `DataProposta` date DEFAULT NULL,
  `Internas` text,
  `ObservacoesProposta` text,
  `Cabecalho` text,
  `InvoiceID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `propostasformas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeForma` varchar(150) DEFAULT NULL,
  `Descricao` text,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `propostasoutros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeDespesa` varchar(150) DEFAULT NULL,
  `Descricao` text,
  `Valor` text,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `propostasstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeStatus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `quadro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Intervalo` int(11) NOT NULL DEFAULT '30',
  `HoraDe` time NOT NULL DEFAULT '07:00:00',
  `HoraAte` time NOT NULL DEFAULT '19:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `rateiodominios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomeDominio` varchar(255) DEFAULT NULL,
  `Tipo` varchar(30) DEFAULT NULL,
  `Procedimentos` varchar(700) DEFAULT NULL,
  `Profissionais` varchar(700) DEFAULT NULL,
  `Formas` varchar(700) DEFAULT NULL,
  `dominioSuperior` int(11) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `sysActive` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `rateiofuncoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Funcao` varchar(50) DEFAULT NULL,
  `DominioID` int(11) DEFAULT NULL,
  `tipoValor` varchar(1) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `ContaPadrao` varchar(20) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `Sobre` int(11) DEFAULT '0',
  `FM` char(1) DEFAULT NULL,
  `ProdutoID` int(11) DEFAULT '0',
  `ValorUnitario` float DEFAULT '0',
  `Quantidade` float DEFAULT '0',
  `sysActive` int(11) DEFAULT '0',
  `Variavel` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `rateiorateios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ItemInvoiceID` int(11) DEFAULT NULL,
  `ItemGuiaID` int(11) DEFAULT NULL,
  `Funcao` varchar(255) DEFAULT NULL,
  `TipoValor` varchar(1) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `ContaCredito` varchar(15) DEFAULT NULL,
  `vencimento` varchar(8) DEFAULT NULL,
  `sta` varchar(1) DEFAULT NULL,
  `movimentacaoID` int(11) DEFAULT NULL,
  `sysDate` date DEFAULT NULL,
  `parcela` int(11) DEFAULT NULL,
  `ItemContaAPagar` int(11) DEFAULT NULL,
  `FormaID` int(11) DEFAULT '0',
  `Sobre` int(11) DEFAULT '0',
  `FM` char(1) DEFAULT 'F',
  `ProdutoID` int(11) DEFAULT '0',
  `ValorUnitario` float DEFAULT '0',
  `Quantidade` float DEFAULT '0',
  `sysUser` int(11) DEFAULT NULL,
  `FuncaoID` int(11) DEFAULT NULL,
  `Resto` int(11) DEFAULT '0',
  `Temp` tinyint(4) DEFAULT '0',
  `Variavel` varchar(1) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `rateiotipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) DEFAULT NULL,
  `nomeColuna` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `recibos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(150) DEFAULT NULL,
  `Emitente` int(11) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `Texto` text,
  `Servicos` varchar(255) DEFAULT NULL,
  `PacienteID` int(11) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `sysDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `regraspermissoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Regra` varchar(50) DEFAULT NULL,
  `Permissoes` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `relatorios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Ct` varchar(15) DEFAULT NULL,
  `Relatorio` varchar(50) DEFAULT NULL,
  `Arquivo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `remarcacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UsuarioID` int(11) DEFAULT NULL,
  `ConsultaID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `repassesdescontos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MetodoID` int(11) DEFAULT NULL,
  `Contas` varchar(150) DEFAULT NULL,
  `Desconto` float DEFAULT NULL,
  `tipoValor` varchar(1) DEFAULT NULL,
  `De` int(11) DEFAULT NULL,
  `Ate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sexo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeSexo` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `solicitante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Solicitante` varchar(20) DEFAULT NULL,
  `Ativo` varchar(1) DEFAULT NULL,
  `Usuario` int(11) DEFAULT NULL,
  `Data` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `staconsulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StaConsulta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_chamadaporvoz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Texto` varchar(500) DEFAULT NULL,
  `Sexo` int(11) DEFAULT NULL,
  `Usuarios` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DefaultCurrency` char(3) DEFAULT NULL,
  `OtherCurrencies` varchar(300) DEFAULT NULL,
  `Rate` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_financialaccountsassociation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AssociationName` varchar(50) DEFAULT NULL,
  `table` varchar(50) DEFAULT NULL,
  `column` varchar(50) DEFAULT NULL,
  `sql` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `sys_financialaccounttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AccountType` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `sys_financialbanks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BankName` varchar(200) DEFAULT NULL,
  `BankNumber` varchar(50) DEFAULT '0',
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `sys_financialcompanyunits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UnitName` varchar(200) DEFAULT NULL,
  `NomeFantasia` varchar(200) DEFAULT NULL,
  `Cep` varchar(200) DEFAULT NULL,
  `Endereco` varchar(200) DEFAULT NULL,
  `Numero` varchar(50) DEFAULT NULL,
  `Complemento` varchar(50) DEFAULT NULL,
  `Bairro` varchar(100) DEFAULT NULL,
  `Cidade` varchar(100) DEFAULT NULL,
  `Estado` varchar(2) DEFAULT NULL,
  `Tel1` varchar(40) DEFAULT NULL,
  `Tel2` varchar(40) DEFAULT NULL,
  `Cel1` varchar(200) DEFAULT NULL,
  `Obs` text,
  `Email1` varchar(200) DEFAULT NULL,
  `Email2` varchar(200) DEFAULT NULL,
  `CNPJ` varchar(200) DEFAULT NULL,
  `Cel2` varchar(200) DEFAULT NULL,
  `CNES` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_financialcreditcardpaymentinstallments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DateToPay` date DEFAULT NULL,
  `Value` float DEFAULT NULL,
  `TransactionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_financialcreditcardreceiptinstallments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DateToReceive` date DEFAULT NULL,
  `Fee` float DEFAULT NULL,
  `Value` float DEFAULT NULL,
  `TransactionID` int(11) DEFAULT NULL,
  `InvoiceReceiptID` int(11) DEFAULT NULL COMMENT 'only if received',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_financialcreditcardtransaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TransactionNumber` varchar(50) DEFAULT NULL,
  `AuthorizationNumber` varchar(50) DEFAULT NULL,
  `MovementID` int(11) DEFAULT NULL,
  `Parcelas` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_financialcurrencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Parity` varchar(50) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Active` varchar(1) DEFAULT NULL,
  `Symbol` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_financialcurrentaccounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AccountName` varchar(200) DEFAULT NULL,
  `AccountType` int(11) DEFAULT NULL,
  `Holder` varchar(200) DEFAULT NULL,
  `Document` varchar(200) DEFAULT NULL,
  `Bank` int(11) DEFAULT NULL,
  `Branch` varchar(10) DEFAULT NULL,
  `CurrentAccount` varchar(20) DEFAULT NULL,
  `CreditAccount` int(11) DEFAULT NULL,
  `DaysForCredit` varchar(3) DEFAULT '0',
  `PercentageDeducted` float DEFAULT '0',
  `Currency` varchar(5) DEFAULT NULL,
  `DueDay` varchar(2) DEFAULT NULL,
  `BestDay` varchar(2) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `Empresa` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_financialdiscountpayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `InstallmentID` int(11) DEFAULT NULL,
  `MovementID` int(11) DEFAULT NULL,
  `DiscountedValue` float DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_financialexpensetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `Category` int(11) DEFAULT '0',
  `Ordem` int(11) DEFAULT '0',
  `Rateio` tinyint(4) DEFAULT '0',
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_financialincometype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `Category` int(11) DEFAULT '0',
  `Ordem` int(11) DEFAULT '0',
  `Rateio` tinyint(4) DEFAULT '0',
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_financialinvoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  `AssociationAccountID` int(11) DEFAULT NULL,
  `Value` float DEFAULT NULL,
  `Tax` float DEFAULT NULL,
  `Currency` varchar(5) DEFAULT NULL,
  `Description` text,
  `AccountPlanID` int(11) DEFAULT NULL,
  `CompanyUnitID` int(11) DEFAULT NULL,
  `Recurrence` int(11) DEFAULT NULL,
  `RecurrenceType` varchar(4) DEFAULT NULL,
  `CD` char(1) DEFAULT NULL,
  `Sta` char(1) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `FormaID` int(11) DEFAULT '0',
  `ContaRectoID` int(11) DEFAULT '0',
  `sysDate` date DEFAULT NULL,
  `CaixaID` int(11) DEFAULT NULL,
  `FixaID` int(11) DEFAULT NULL,
  `FixaNumero` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_financialissuedchecks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CheckNumber` varchar(20) DEFAULT NULL,
  `CheckDate` date DEFAULT NULL,
  `Cashed` tinyint(4) DEFAULT NULL,
  `AccountAssociationID` int(11) DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  `MovementID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_financialmovement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `AccountAssociationIDCredit` int(11) DEFAULT NULL,
  `AccountIDCredit` int(11) DEFAULT NULL,
  `AccountAssociationIDDebit` int(11) DEFAULT NULL,
  `AccountIDDebit` int(11) DEFAULT NULL,
  `PaymentMethodID` int(11) DEFAULT NULL,
  `Value` float DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `CD` char(1) DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  `Obs` varchar(255) DEFAULT NULL,
  `Currency` varchar(5) DEFAULT NULL,
  `Rate` float DEFAULT NULL,
  `MovementAssociatedID` int(11) DEFAULT NULL COMMENT 'only to highlight on mouse hover',
  `InvoiceID` int(11) DEFAULT NULL,
  `InstallmentNumber` int(11) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `ValorPago` float DEFAULT NULL,
  `CaixaID` int(11) DEFAULT NULL,
  `ChequeID` int(11) DEFAULT NULL,
  `UnidadeID` int(11) DEFAULT NULL,
  `sysDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_financialpaymentmethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `TextD` varchar(80) DEFAULT NULL,
  `TextC` varchar(80) DEFAULT NULL,
  `AccountTypesD` varchar(50) DEFAULT NULL,
  `AccountTypesC` varchar(50) DEFAULT NULL,
  `ExtraD` text,
  `ExtraC` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `sys_financialreceivedchecks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BankID` int(11) DEFAULT NULL,
  `CheckNumber` varchar(20) DEFAULT NULL,
  `Holder` varchar(50) DEFAULT NULL,
  `Document` varchar(20) DEFAULT NULL,
  `CheckDate` date DEFAULT NULL,
  `Cashed` tinyint(4) DEFAULT NULL,
  `AccountAssociationID` int(11) DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  `MovementID` int(11) DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL,
  `BorderoID` int(11) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_financialtransactiontype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TransactionName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `sys_formasrecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MetodoID` int(11) DEFAULT NULL,
  `Contas` varchar(500) DEFAULT NULL,
  `ParcelasDe` int(11) DEFAULT '1',
  `ParcelasAte` int(11) DEFAULT '1',
  `Acrescimo` float DEFAULT '0',
  `tipoAcrescimo` char(1) DEFAULT 'P',
  `Desconto` float DEFAULT '0',
  `tipoDesconto` char(1) DEFAULT 'P',
  `Procedimentos` text,
  `Unidades` varchar(10) DEFAULT '|ALL|',
  `UnidadesExcecao` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) DEFAULT NULL,
  `Link` varchar(100) DEFAULT NULL,
  `Superior` int(11) DEFAULT NULL,
  `Icon` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `sys_permissoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Acao` varchar(80) DEFAULT NULL,
  `Nome` varchar(30) DEFAULT NULL,
  `Categoria` varchar(35) DEFAULT NULL,
  `Visualizar` varchar(1) DEFAULT NULL,
  `Inserir` varchar(1) DEFAULT NULL,
  `Alterar` varchar(1) DEFAULT NULL,
  `Excluir` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `sys_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `tableName` varchar(50) DEFAULT NULL,
  `showInMenu` int(11) NOT NULL DEFAULT '0',
  `showInQuickSearch` int(11) NOT NULL DEFAULT '0',
  `categorieID` int(11) DEFAULT '0',
  `description` varchar(100) DEFAULT NULL,
  `initialOrder` varchar(50) DEFAULT NULL,
  `plugin` varchar(50) DEFAULT NULL,
  `mainForm` int(11) DEFAULT '0',
  `mainFormColumn` varchar(50) DEFAULT NULL,
  `sqlSelectQuickSearch` varchar(200) DEFAULT NULL,
  `Pers` varchar(6) DEFAULT NULL,
  `othersToAddSelectInsert` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `sys_resourcesfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resourceID` int(11) DEFAULT NULL,
  `label` varchar(200) DEFAULT NULL,
  `columnName` varchar(80) DEFAULT NULL,
  `defaultValue` varchar(200) DEFAULT NULL,
  `placeholder` varchar(200) DEFAULT NULL,
  `showInList` tinyint(4) NOT NULL DEFAULT '0',
  `showInForm` tinyint(4) DEFAULT '1',
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `fieldTypeID` int(11) NOT NULL DEFAULT '0',
  `rowNumber` int(11) NOT NULL DEFAULT '0',
  `selectSQL` varchar(300) DEFAULT NULL,
  `selectColumnToShow` varchar(50) DEFAULT NULL,
  `responsibleColumnHidden` varchar(50) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=490 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `sys_resourcesfieldtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) DEFAULT NULL,
  `sql` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `sys_smsemail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AtivoEmail` varchar(2) DEFAULT NULL,
  `AtivoSMS` varchar(2) DEFAULT NULL,
  `TextoEmail` text,
  `TextoSMS` text,
  `ConfirmarPorEmail` varchar(1) DEFAULT NULL,
  `ConfirmarPorSMS` varchar(1) DEFAULT NULL,
  `TempoAntesEmail` time DEFAULT NULL,
  `TempoAntesSMS` time DEFAULT NULL,
  `HAntesSMS` int(11) DEFAULT '24',
  `HAntesEmail` int(11) DEFAULT '24',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_users` (
  `id` int(11) NOT NULL DEFAULT '0',
  `Table` varchar(50) DEFAULT NULL,
  `NameColumn` varchar(50) DEFAULT NULL,
  `idInTable` int(11) DEFAULT NULL,
  `OrdemListaEspera` varchar(50) DEFAULT NULL,
  `chamar` varchar(50) DEFAULT NULL,
  `Permissoes` text,
  `novasmsgs` varchar(150) DEFAULT NULL,
  `notiftarefas` text,
  `UsuariosNotificar` varchar(200) DEFAULT NULL,
  `notiflanctos` varchar(200) DEFAULT '',
  `UltRef` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `QuadrosAbertos` varchar(250) DEFAULT NULL,
  `UnidadeID` int(11) DEFAULT '0',
  `UltRefDevice` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UltPac` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sys_userstables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Table` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tabelaparticular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomeTabela` varchar(200) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tarefas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `De` int(11) DEFAULT '0',
  `Para` int(11) DEFAULT '0',
  `DtAbertura` date DEFAULT NULL,
  `HrAbertura` time DEFAULT NULL,
  `DtPrazo` date DEFAULT NULL,
  `HrPrazo` time DEFAULT NULL,
  `Titulo` varchar(240) DEFAULT NULL,
  `ta` text,
  `staDe` varchar(10) DEFAULT NULL,
  `staPara` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tarefasmsgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TarefaID` int(11) DEFAULT '0',
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `desession` int(11) DEFAULT '0',
  `para` int(11) DEFAULT '0',
  `msg` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tempagenda` (
  `Hora` time DEFAULT NULL,
  `UsuarioID` int(11) DEFAULT NULL,
  `ConsultaID` int(11) DEFAULT NULL,
  `VCIB` varchar(1) DEFAULT NULL,
  `LocalID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tempfaturamento` (
  `sysUser` int(11) DEFAULT NULL,
  `ProcedimentoID` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `ConvenioID` int(11) DEFAULT NULL,
  `Valor` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tempinvoice` (
  `autoid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `InvoiceID` int(11) NOT NULL DEFAULT '0',
  `Tipo` char(1) DEFAULT NULL,
  `Quantidade` float NOT NULL DEFAULT '1',
  `CategoriaID` int(11) DEFAULT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `ValorUnitario` float NOT NULL DEFAULT '0',
  `Desconto` float NOT NULL DEFAULT '0',
  `Descricao` varchar(50) DEFAULT NULL,
  `Executado` char(1) DEFAULT NULL,
  `DataExecucao` date DEFAULT NULL,
  `HoraExecucao` time DEFAULT NULL,
  `GrupoID` int(11) NOT NULL DEFAULT '0',
  `AgendamentoID` int(11) NOT NULL DEFAULT '0',
  `sysUser` int(11) DEFAULT NULL,
  `sysDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ProfissionalID` int(11) DEFAULT NULL,
  `HoraFim` time DEFAULT NULL,
  `Acrescimo` float NOT NULL DEFAULT '0',
  `AtendimentoID` int(11) DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `tempparcelas` (
  `autoid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `AccountAssociationIDCredit` int(11) DEFAULT NULL,
  `AccountIDCredit` int(11) DEFAULT NULL,
  `AccountAssociationIDDebit` int(11) DEFAULT NULL,
  `AccountIDDebit` int(11) DEFAULT NULL,
  `Value` float DEFAULT '0',
  `Date` date DEFAULT NULL,
  `CD` char(1) DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  `Currency` varchar(5) DEFAULT NULL,
  `Rate` float DEFAULT NULL,
  `InvoiceID` int(11) DEFAULT NULL,
  `InstallmentNumber` int(11) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `ValorPago` float DEFAULT NULL,
  `CaixaID` int(11) DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tempperfil` (
  `Grafico` varchar(100) DEFAULT NULL,
  `Valor` varchar(200) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tempquadis` (
  `Hora` time DEFAULT NULL,
  `UsuarioID` int(11) DEFAULT NULL,
  `ConsultaID` int(11) DEFAULT NULL,
  `VCPB` varchar(1) DEFAULT NULL,
  `LocalID` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `Tempo` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `temprateiorateios` (
  `autoid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `autoItemInvoiceID` int(11) DEFAULT NULL,
  `ItemInvoiceID` int(11) DEFAULT NULL,
  `ItemGuiaID` int(11) DEFAULT NULL,
  `Funcao` varchar(255) DEFAULT NULL,
  `TipoValor` varchar(1) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `ContaCredito` varchar(15) DEFAULT NULL,
  `vencimento` varchar(8) DEFAULT NULL,
  `sta` varchar(1) DEFAULT NULL,
  `movimentacaoID` int(11) DEFAULT NULL,
  `sysDate` date DEFAULT NULL,
  `parcela` int(11) DEFAULT NULL,
  `ItemContaAPagar` int(11) DEFAULT NULL,
  `FormaID` int(11) DEFAULT '0',
  `Sobre` int(11) DEFAULT '0',
  `FM` char(1) DEFAULT 'F',
  `ProdutoID` int(11) DEFAULT '0',
  `ValorUnitario` float DEFAULT '0',
  `Quantidade` float DEFAULT '0',
  `sysUser` int(11) DEFAULT NULL,
  `sysUserTemp` int(11) DEFAULT NULL,
  `FuncaoID` int(11) DEFAULT NULL,
  PRIMARY KEY (`autoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `tipodocumento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TipoDocumento` varchar(50) DEFAULT NULL,
  `Paciente` int(11) DEFAULT NULL,
  `sysActive` int(11) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `tiposprocedimentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TipoProcedimento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `tisscarateratendimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `tisscd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `tissgrauparticipacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` char(2) DEFAULT NULL,
  `Descricao` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `tissguiaanexa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `GuiaID` int(11) DEFAULT NULL,
  `CD` int(11) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `HoraInicio` time DEFAULT NULL,
  `HoraFim` time DEFAULT NULL,
  `TabelaProdutoID` int(11) DEFAULT NULL,
  `ProdutoID` int(11) DEFAULT NULL,
  `CodigoProduto` varchar(50) DEFAULT NULL,
  `Quantidade` float DEFAULT NULL,
  `UnidadeMedidaID` int(11) DEFAULT NULL,
  `Fator` float DEFAULT NULL,
  `ValorUnitario` float DEFAULT NULL,
  `ValorTotal` float DEFAULT NULL,
  `RegistroANVISA` varchar(50) DEFAULT NULL,
  `CodigoNoFabricante` varchar(50) DEFAULT NULL,
  `AutorizacaoEmpresa` varchar(50) DEFAULT NULL,
  `Descricao` varchar(255) DEFAULT NULL,
  `ProcGSID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tissguiaconsulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `CNS` varchar(40) DEFAULT NULL,
  `NumeroCarteira` varchar(40) DEFAULT NULL,
  `ValidadeCarteira` date DEFAULT NULL,
  `AtendimentoRN` char(1) DEFAULT NULL,
  `ConvenioID` int(11) DEFAULT NULL,
  `RegistroANS` varchar(15) DEFAULT NULL,
  `NGuiaPrestador` varchar(40) DEFAULT NULL,
  `NGuiaOperadora` varchar(40) DEFAULT NULL,
  `Contratado` int(11) DEFAULT NULL,
  `CodigoNaOperadora` varchar(40) DEFAULT NULL,
  `CodigoCNES` varchar(20) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `Conselho` int(11) DEFAULT NULL,
  `DocumentoConselho` varchar(20) DEFAULT NULL,
  `UFConselho` varchar(20) DEFAULT NULL,
  `CodigoCBO` varchar(20) DEFAULT NULL,
  `IndicacaoAcidenteID` int(11) DEFAULT NULL,
  `DataAtendimento` date DEFAULT NULL,
  `TipoConsultaID` int(11) DEFAULT NULL,
  `ProcedimentoID` int(11) DEFAULT NULL,
  `TabelaID` int(11) DEFAULT NULL,
  `CodigoProcedimento` varchar(20) DEFAULT NULL,
  `ValorProcedimento` float DEFAULT NULL,
  `Observacoes` text,
  `LoteID` int(11) DEFAULT '0',
  `sysUser` int(11) DEFAULT NULL,
  `ProfissionalEfetivoID` int(11) DEFAULT NULL,
  `sysActive` int(11) DEFAULT NULL,
  `sysDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `AgendamentoID` int(11) DEFAULT '0',
  `PlanoID` int(11) DEFAULT '0',
  `AtendimentoID` int(11) DEFAULT '0',
  `UnidadeID` int(11) DEFAULT '0',
  `ValorPago` float DEFAULT NULL,
  `Glosado` tinyint(4) DEFAULT '0',
  `MotivoGlosa` varchar(50) DEFAULT NULL,
  `identificadorBeneficiario` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tissguiahonorarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `CNS` varchar(40) DEFAULT NULL,
  `ConvenioID` int(11) DEFAULT NULL,
  `PlanoID` int(11) DEFAULT '0',
  `RegistroANS` varchar(15) DEFAULT NULL,
  `NGuiaPrestador` varchar(40) DEFAULT NULL,
  `NGuiaOperadora` varchar(40) DEFAULT NULL,
  `Senha` varchar(40) DEFAULT NULL,
  `NumeroCarteira` varchar(40) DEFAULT NULL,
  `AtendimentoRN` char(1) DEFAULT NULL,
  `NGuiaSolicitacaoInternacao` varchar(40) DEFAULT NULL,
  `Contratado` int(11) DEFAULT NULL,
  `CodigoNaOperadora` varchar(40) DEFAULT NULL,
  `CodigoCNES` varchar(20) DEFAULT NULL,
  `ContratadoLocalCodigoNaOperadora` varchar(40) DEFAULT NULL,
  `ContratadoLocalNome` varchar(40) DEFAULT NULL,
  `ContratadoLocalCNES` varchar(10) DEFAULT NULL,
  `DataInicioFaturamento` date DEFAULT NULL,
  `DataFimFaturamento` date DEFAULT NULL,
  `Observacoes` text,
  `LoteID` int(11) DEFAULT '0',
  `Procedimentos` float DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `sysActive` int(11) DEFAULT NULL,
  `sysDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DataEmissao` date DEFAULT NULL,
  `UnidadeID` int(11) DEFAULT '0',
  `ValorPago` float DEFAULT NULL,
  `Glosado` tinyint(4) DEFAULT '0',
  `MotivoGlosa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `tissguiasadt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `CNS` varchar(40) DEFAULT NULL,
  `NumeroCarteira` varchar(40) DEFAULT NULL,
  `ValidadeCarteira` date DEFAULT NULL,
  `AtendimentoRN` char(1) DEFAULT NULL,
  `ConvenioID` int(11) DEFAULT NULL,
  `RegistroANS` varchar(15) DEFAULT NULL,
  `NGuiaPrestador` varchar(40) DEFAULT NULL,
  `NGuiaOperadora` varchar(40) DEFAULT NULL,
  `Contratado` int(11) DEFAULT NULL,
  `CodigoNaOperadora` varchar(40) DEFAULT NULL,
  `CodigoCNES` varchar(20) DEFAULT NULL,
  `IndicacaoAcidenteID` int(11) DEFAULT NULL,
  `TipoConsultaID` int(11) DEFAULT NULL,
  `Observacoes` text,
  `LoteID` int(11) DEFAULT '0',
  `NGuiaPrincipal` varchar(40) DEFAULT NULL,
  `DataAutorizacao` date DEFAULT NULL,
  `Senha` varchar(50) DEFAULT NULL,
  `DataValidadeSenha` date DEFAULT NULL,
  `ContratadoSolicitanteID` int(11) DEFAULT NULL,
  `ContratadoSolicitanteCodigoNaOperadora` varchar(50) DEFAULT NULL,
  `ProfissionalSolicitanteID` int(11) DEFAULT NULL,
  `ConselhoProfissionalSolicitanteID` int(11) DEFAULT NULL,
  `NumeroNoConselhoSolicitante` varchar(50) DEFAULT NULL,
  `UFConselhoSolicitante` varchar(2) DEFAULT NULL,
  `CodigoCBOSolicitante` varchar(40) DEFAULT NULL,
  `CaraterAtendimentoID` int(11) DEFAULT NULL,
  `DataSolicitacao` date DEFAULT NULL,
  `IndicacaoClinica` varchar(500) DEFAULT NULL,
  `TipoAtendimentoID` int(11) DEFAULT NULL,
  `MotivoEncerramentoID` int(11) DEFAULT NULL,
  `DataSerie01` date DEFAULT NULL,
  `DataSerie02` date DEFAULT NULL,
  `DataSerie03` date DEFAULT NULL,
  `DataSerie04` date DEFAULT NULL,
  `DataSerie05` date DEFAULT NULL,
  `DataSerie06` date DEFAULT NULL,
  `DataSerie07` date DEFAULT NULL,
  `DataSerie08` date DEFAULT NULL,
  `DataSerie09` date DEFAULT NULL,
  `DataSerie10` date DEFAULT NULL,
  `Procedimentos` float DEFAULT NULL,
  `TaxasEAlugueis` float DEFAULT NULL,
  `Materiais` float DEFAULT NULL,
  `OPME` float DEFAULT NULL,
  `Medicamentos` float DEFAULT NULL,
  `GasesMedicinais` float DEFAULT NULL,
  `TotalGeral` float DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `sysActive` int(11) DEFAULT NULL,
  `sysDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `AtendimentoID` int(11) DEFAULT '0',
  `AgendamentoID` int(11) DEFAULT '0',
  `PlanoID` int(11) DEFAULT '0',
  `tipoContratadoSolicitante` char(1) DEFAULT 'I',
  `tipoProfissionalSolicitante` char(1) DEFAULT 'I',
  `UnidadeID` int(11) DEFAULT '0',
  `ValorPago` float DEFAULT NULL,
  `Glosado` tinyint(4) DEFAULT '0',
  `MotivoGlosa` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tissindicacaoacidente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `tisslotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ConvenioID` int(11) NOT NULL DEFAULT '0',
  `Lote` int(11) NOT NULL DEFAULT '0',
  `Mes` int(11) DEFAULT NULL,
  `Ano` int(11) DEFAULT NULL,
  `Ordem` varchar(50) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Protocolo` varchar(50) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `sysDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Enviado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tissmotivoencerramento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `tissprocedimentoshonorarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `GuiaID` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `HoraInicio` time DEFAULT NULL,
  `HoraFim` time DEFAULT NULL,
  `ProcedimentoID` int(11) DEFAULT NULL,
  `TabelaID` int(11) DEFAULT NULL,
  `CodigoProcedimento` varchar(50) DEFAULT NULL,
  `Descricao` varchar(200) DEFAULT NULL,
  `Quantidade` varchar(20) DEFAULT NULL,
  `ViaID` int(11) DEFAULT NULL,
  `TecnicaID` int(11) DEFAULT NULL,
  `Fator` float DEFAULT NULL,
  `ValorUnitario` float DEFAULT NULL,
  `ValorTotal` float DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `sysDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `AgendamentoID` int(11) DEFAULT '0',
  `AtendimentoID` int(11) DEFAULT '0',
  `quantidadeAutorizada` int(11) DEFAULT '0',
  `statusAutorizacao` int(11) DEFAULT '0',
  `motivoNegativa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tissprocedimentossadt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `GuiaID` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `HoraInicio` time DEFAULT NULL,
  `HoraFim` time DEFAULT NULL,
  `ProcedimentoID` int(11) DEFAULT NULL,
  `TabelaID` int(11) DEFAULT NULL,
  `CodigoProcedimento` varchar(50) DEFAULT NULL,
  `Descricao` varchar(200) DEFAULT NULL,
  `Quantidade` varchar(20) DEFAULT NULL,
  `ViaID` int(11) DEFAULT NULL,
  `TecnicaID` int(11) DEFAULT NULL,
  `Fator` float DEFAULT NULL,
  `ValorUnitario` float DEFAULT NULL,
  `ValorTotal` float DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `sysDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `AgendamentoID` int(11) DEFAULT '0',
  `AtendimentoID` int(11) DEFAULT '0',
  `quantidadeAutorizada` int(11) DEFAULT '0',
  `statusAutorizacao` int(11) DEFAULT '0',
  `motivoNegativa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tissprocedimentostabela` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(20) DEFAULT NULL,
  `Descricao` varchar(300) DEFAULT NULL,
  `TabelaID` int(11) DEFAULT NULL,
  `sysActive` int(11) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tissprocedimentosvalores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcedimentoID` int(11) DEFAULT NULL,
  `ConvenioID` int(11) DEFAULT NULL,
  `ProcedimentoTabelaID` int(11) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `TecnicaID` int(11) DEFAULT NULL,
  `NaoCobre` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tissprocedimentosvaloresplanos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AssociacaoID` int(11) DEFAULT NULL,
  `PlanoID` int(11) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `NaoCobre` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tissprodutosprocedimentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProdutoValorID` int(11) NOT NULL DEFAULT '0',
  `AssociacaoID` int(11) NOT NULL DEFAULT '0',
  `Quantidade` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tissprodutostabela` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(20) DEFAULT NULL,
  `ProdutoID` int(11) DEFAULT NULL,
  `TabelaID` int(11) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `sysActive` int(11) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tissprodutosvalores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProdutoTabelaID` int(11) DEFAULT NULL,
  `ConvenioID` int(11) DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tissprofissionaishonorarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `GuiaID` int(11) DEFAULT NULL,
  `Sequencial` int(11) DEFAULT NULL,
  `GrauParticipacaoID` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `CodigoNaOperadoraOuCPF` varchar(20) DEFAULT NULL,
  `ConselhoID` int(11) DEFAULT NULL,
  `DocumentoConselho` varchar(50) DEFAULT NULL,
  `UFConselho` varchar(20) DEFAULT NULL,
  `CodigoCBO` varchar(20) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `sysDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tissprofissionaissadt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `GuiaID` int(11) DEFAULT NULL,
  `Sequencial` int(11) DEFAULT NULL,
  `GrauParticipacaoID` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `CodigoNaOperadoraOuCPF` varchar(20) DEFAULT NULL,
  `ConselhoID` int(11) DEFAULT NULL,
  `DocumentoConselho` varchar(50) DEFAULT NULL,
  `UFConselho` varchar(20) DEFAULT NULL,
  `CodigoCBO` varchar(20) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `sysDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tisstabelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `tisstecnica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` char(2) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `tisstipoatendimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `tisstipoconsulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `tissunidademedida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `tissvia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` char(2) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `tratamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tratamento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='sistema';

CREATE TABLE IF NOT EXISTS `_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `DataHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sysUser` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `1` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5101 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `_10` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `DataHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sysUser` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `185` varchar(150) DEFAULT NULL,
  `186` varchar(150) DEFAULT NULL,
  `187` varchar(150) DEFAULT NULL,
  `188` varchar(150) DEFAULT NULL,
  `189` varchar(150) DEFAULT NULL,
  `190` varchar(150) DEFAULT NULL,
  `191` varchar(150) DEFAULT NULL,
  `193` varchar(150) DEFAULT NULL,
  `194` varchar(150) DEFAULT NULL,
  `196` varchar(150) DEFAULT NULL,
  `197` varchar(150) DEFAULT NULL,
  `198` varchar(150) DEFAULT NULL,
  `199` varchar(150) DEFAULT NULL,
  `200` varchar(150) DEFAULT NULL,
  `201` varchar(50) DEFAULT NULL,
  `202` varchar(150) DEFAULT NULL,
  `203` varchar(150) DEFAULT NULL,
  `204` varchar(150) DEFAULT NULL,
  `205` varchar(150) DEFAULT NULL,
  `206` varchar(150) DEFAULT NULL,
  `207` varchar(150) DEFAULT NULL,
  `208` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7667 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `DataHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sysUser` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `1` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `_3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `DataHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sysUser` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `1` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `_4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `DataHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sysUser` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `1` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `_5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `DataHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sysUser` int(11) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  `1` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `_9` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PacienteID` int(11) DEFAULT NULL,
  `DataHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sysUser` int(11) DEFAULT NULL,
  `98` text,
  `99` text,
  `100` text,
  `101` text,
  `102` text,
  `106` text,
  `107` text,
  `108` text,
  `109` text,
  `110` text,
  `111` text,
  `112` text,
  `113` text,
  `114` text,
  `115` text,
  `116` text,
  `117` text,
  `118` text,
  `119` text,
  `120` text,
  `121` text,
  `122` varchar(150) DEFAULT NULL,
  `123` text,
  `125` varchar(50) DEFAULT NULL,
  `126` text,
  `128` varchar(50) DEFAULT NULL,
  `129` text,
  `130` varchar(50) DEFAULT NULL,
  `131` text,
  `132` varchar(50) DEFAULT NULL,
  `133` text,
  `134` varchar(50) DEFAULT NULL,
  `135` text,
  `136` varchar(50) DEFAULT NULL,
  `138` text,
  `139` text,
  `140` text,
  `141` text,
  `142` varchar(150) DEFAULT NULL,
  `143` text,
  `144` varchar(150) DEFAULT NULL,
  `147` text,
  `148` varchar(150) DEFAULT NULL,
  `150` text,
  `151` varchar(150) DEFAULT NULL,
  `152` text,
  `154` text,
  `160` varchar(150) DEFAULT NULL,
  `161` text,
  `163` text,
  `164` text,
  `165` text,
  `166` text,
  `168` text,
  `169` text,
  `170` text,
  `171` varchar(150) DEFAULT NULL,
  `173` text,
  `174` text,
  `175` text,
  `176` text,
  `178` varchar(10) DEFAULT NULL,
  `179` varchar(10) DEFAULT NULL,
  `180` varchar(150) DEFAULT NULL,
  `181` varchar(50) DEFAULT NULL,
  `182` varchar(150) DEFAULT NULL,
  `ProfissionalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3667 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `_itensinvoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `InvoiceID` int(11) NOT NULL DEFAULT '0',
  `Tipo` char(1) DEFAULT NULL,
  `Quantidade` float NOT NULL DEFAULT '1',
  `CategoriaID` int(11) DEFAULT NULL,
  `ItemID` int(11) DEFAULT NULL,
  `ValorUnitario` float NOT NULL DEFAULT '0',
  `Desconto` float NOT NULL DEFAULT '0',
  `Descricao` varchar(50) DEFAULT NULL,
  `Executado` char(1) DEFAULT NULL,
  `DataExecucao` date DEFAULT NULL,
  `HoraExecucao` time DEFAULT NULL,
  `GrupoID` int(11) NOT NULL DEFAULT '0',
  `AgendamentoID` int(11) NOT NULL DEFAULT '0',
  `sysUser` int(11) DEFAULT NULL,
  `sysDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ProfissionalID` int(11) DEFAULT NULL,
  `HoraFim` time DEFAULT NULL,
  `Acrescimo` float DEFAULT '0',
  `AtendimentoID` int(11) DEFAULT '0',
  `Associacao` int(11) DEFAULT '5',
  `OdontogramaObj` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13327 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `_sys_financialinvoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  `AssociationAccountID` int(11) DEFAULT NULL,
  `Value` float DEFAULT NULL,
  `Tax` float DEFAULT NULL,
  `Currency` varchar(5) DEFAULT NULL,
  `Description` text,
  `AccountPlanID` int(11) DEFAULT NULL,
  `CompanyUnitID` int(11) DEFAULT NULL,
  `Recurrence` int(11) DEFAULT NULL,
  `RecurrenceType` varchar(4) DEFAULT NULL,
  `CD` char(1) DEFAULT NULL,
  `Sta` char(1) DEFAULT NULL,
  `sysActive` tinyint(4) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `FormaID` int(11) DEFAULT '0',
  `ContaRectoID` int(11) DEFAULT '0',
  `sysDate` date DEFAULT NULL,
  `CaixaID` int(11) DEFAULT NULL,
  `FixaID` int(11) DEFAULT NULL,
  `FixaNumero` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13327 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `_sys_financialmovement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `AccountAssociationIDCredit` int(11) DEFAULT NULL,
  `AccountIDCredit` int(11) DEFAULT NULL,
  `AccountAssociationIDDebit` int(11) DEFAULT NULL,
  `AccountIDDebit` int(11) DEFAULT NULL,
  `PaymentMethodID` int(11) DEFAULT NULL,
  `Value` float DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `CD` char(1) DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  `Obs` varchar(255) DEFAULT NULL,
  `Currency` varchar(5) DEFAULT NULL,
  `Rate` float DEFAULT NULL,
  `MovementAssociatedID` int(11) DEFAULT NULL COMMENT 'only to highlight on mouse hover',
  `InvoiceID` int(11) DEFAULT NULL,
  `InstallmentNumber` int(11) DEFAULT NULL,
  `sysUser` int(11) DEFAULT NULL,
  `ValorPago` float DEFAULT NULL,
  `CaixaID` int(11) DEFAULT NULL,
  `ChequeID` int(11) DEFAULT NULL,
  `UnidadeID` int(11) DEFAULT NULL,
  `sysDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `agendamentoseatendimentos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `agendamentoseatendimentos` AS select `ag`.`id` AS `id`,`ag`.`Data` AS `Data`,`ag`.`Hora` AS `HoraInicio`,`ag`.`HoraFinal` AS `HoraFim`,`ag`.`TipoCompromissoID` AS `ProcedimentoID`,`ag`.`ProfissionalID` AS `ProfissionalID`,`ag`.`Notas` AS `Obs`,`ag`.`ValorPlano` AS `ValorPlano`,`ag`.`rdValorPlano` AS `rdValorPlano`,`ag`.`PacienteID` AS `PacienteID`,`ag`.`StaID` AS `Icone`,'agendamento' AS `Tipo`,`ag`.`id` AS `AgendamentoID` from `agendamentos` `ag` union all select `ap`.`id` AS `id`,`at`.`Data` AS `Data`,`at`.`HoraInicio` AS `HoraInicio`,`at`.`HoraFim` AS `HoraFim`,`ap`.`ProcedimentoID` AS `ProcedimentoID`,`u`.`idInTable` AS `ProfissionalID`,`ap`.`Obs` AS `Obs`,`ap`.`ValorPlano` AS `ValorPlano`,`ap`.`rdValorPlano` AS `rdValorPlano`,`at`.`PacienteID` AS `PacienteID`,'executado' AS `executado`,'executado' AS `executado`,`at`.`AgendamentoID` AS `AgendamentoID` from ((`atendimentosprocedimentos` `ap` left join `atendimentos` `at` on((`at`.`id` = `ap`.`AtendimentoID`))) left join `sys_users` `u` on((`u`.`id` = `at`.`sysUser`))) order by `Data` desc,`HoraInicio` desc,`HoraFim` desc;

DROP TABLE IF EXISTS `chequesinvoice`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chequesinvoice` AS select `m`.`Value` AS `Valor`,`parcs`.`InvoiceID` AS `InvoiceID`,`m`.`Date` AS `DataPagto`,`m`.`UnidadeID` AS `UnidadeID` from ((`sys_financialdiscountpayments` `dp` left join `sys_financialmovement` `m` on((`m`.`id` = `dp`.`MovementID`))) left join `sys_financialmovement` `parcs` on((`parcs`.`id` = `dp`.`InstallmentID`))) where ((`m`.`PaymentMethodID` = 2) and (`m`.`Type` = 'Pay'));

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
