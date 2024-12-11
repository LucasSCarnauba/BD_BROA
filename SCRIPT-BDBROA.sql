USE [master]
GO
/****** Object:  Database [BROA]    Script Date: 09/12/2024 12:33:13 ******/
CREATE DATABASE [BROA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BROA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BROA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BROA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BROA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BROA] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BROA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BROA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BROA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BROA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BROA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BROA] SET ARITHABORT OFF 
GO
ALTER DATABASE [BROA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BROA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BROA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BROA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BROA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BROA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BROA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BROA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BROA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BROA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BROA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BROA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BROA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BROA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BROA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BROA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BROA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BROA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BROA] SET  MULTI_USER 
GO
ALTER DATABASE [BROA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BROA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BROA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BROA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BROA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BROA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BROA] SET QUERY_STORE = ON
GO
ALTER DATABASE [BROA] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BROA]
GO
/****** Object:  Table [dbo].[adicionar]    Script Date: 09/12/2024 12:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adicionar](
	[fk_Produto_Idproduto] [int] NOT NULL,
	[fk_Mercado_idMercado] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[adquirir]    Script Date: 09/12/2024 12:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adquirir](
	[fk_carrinho_idCarrinho] [int] NOT NULL,
	[fk_Pedido_idPedido] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aplicar]    Script Date: 09/12/2024 12:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aplicar](
	[fk_Promocao_idPromocao] [int] NOT NULL,
	[fk_Venda_IdVenda] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[armazenar]    Script Date: 09/12/2024 12:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[armazenar](
	[fk_Estoque_IdEstoque] [int] NOT NULL,
	[fk_Produto_Idproduto] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[associar]    Script Date: 09/12/2024 12:33:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[associar](
	[fk_Venda_IdVenda] [int] NOT NULL,
	[fk_Pedido_idPedido] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Atendimento]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atendimento](
	[idAtendimento] [int] IDENTITY(1,1) NOT NULL,
	[idFuncionario] [int] NOT NULL,
	[dataAbertura] [date] NOT NULL,
	[dataEncerramento] [date] NOT NULL,
	[statusAtendimento] [varchar](50) NOT NULL,
	[descricao] [varchar](100) NOT NULL,
	[feedbackAtendimento] [varchar](50) NOT NULL,
	[nomeCliente] [varchar](40) NOT NULL,
	[idCliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAtendimento] ASC,
	[idFuncionario] ASC,
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[idFuncionario] ASC,
	[idAtendimento] ASC,
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[avaliar]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[avaliar](
	[fk_Produto_Idproduto] [int] NOT NULL,
	[fk_Feedback_idFeedback] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carrinho]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carrinho](
	[idCarrinho] [int] IDENTITY(1,1) NOT NULL,
	[idProduto] [int] NOT NULL,
	[status_carrinho] [varchar](1) NOT NULL,
	[preco] [varchar](1) NOT NULL,
	[idColeta] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[quantidade] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCarrinho] ASC,
	[idCliente] ASC,
	[idColeta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[idProduto] ASC,
	[idCarrinho] ASC,
	[idColeta] ASC,
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](1) NOT NULL,
	[email] [varchar](1) NOT NULL,
	[fk_telefoneCliente_telefoneCliente_PK] [varchar](20) NOT NULL,
	[senha] [varchar](1) NOT NULL,
	[dataRegistro] [date] NOT NULL,
	[cep] [varchar](1) NOT NULL,
	[rua] [varchar](1) NOT NULL,
	[numero] [varchar](1) NOT NULL,
	[complemento] [varchar](1) NOT NULL,
	[bairro] [varchar](1) NOT NULL,
	[cidade] [varchar](1) NOT NULL,
	[estado] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coleta]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coleta](
	[IdColeta] [int] IDENTITY(1,1) NOT NULL,
	[hora] [time](7) NOT NULL,
	[data_coleta] [date] NOT NULL,
	[idCliente] [int] NOT NULL,
	[idPedido] [int] NOT NULL,
	[tipoColeta] [varchar](1) NOT NULL,
	[status_coleta] [varchar](1) NOT NULL,
	[local_coleta] [varchar](1) NOT NULL,
	[observacoes] [varchar](1) NOT NULL,
	[cep] [varchar](1) NOT NULL,
	[estado] [varchar](1) NOT NULL,
	[complemento] [varchar](1) NOT NULL,
	[numero] [varchar](1) NOT NULL,
	[cidade] [varchar](1) NOT NULL,
	[bairro] [varchar](1) NOT NULL,
	[rua] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdColeta] ASC,
	[idCliente] ASC,
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[IdColeta] ASC,
	[idCliente] ASC,
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[criar]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[criar](
	[fk_Feedback_idFeedback] [int] NOT NULL,
	[fk_Cliente_idCliente] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[designar]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[designar](
	[fk_Cliente_idCliente] [int] NOT NULL,
	[fk_Coleta_IdColeta] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[disponibilizar]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[disponibilizar](
	[fk_Doacao_IdDoacao] [int] NOT NULL,
	[fk_Mercado_idMercado] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doacao]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doacao](
	[Quantidade] [numeric](18, 0) NOT NULL,
	[PrazoRetirada] [date] NOT NULL,
	[RetiradaEndereco] [varchar](100) NOT NULL,
	[Tipo] [varchar](100) NULL,
	[DataValidade] [date] NULL,
	[IdDoacao] [int] IDENTITY(1,1) NOT NULL,
	[Doacoes] [varchar](50) NULL,
	[DiaRetirada] [date] NULL,
	[ProdutoProprio] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDoacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[efetuar]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[efetuar](
	[fk_Venda_IdVenda] [int] NOT NULL,
	[fk_Pagamento_idPagamento] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[envolver]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[envolver](
	[fk_Pagamento_idPagamento] [int] NOT NULL,
	[fk_Pedido_idPedido] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estoque]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estoque](
	[Esgotado] [varchar](20) NOT NULL,
	[IdEstoque] [int] IDENTITY(1,1) NOT NULL,
	[idProduto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstoque] ASC,
	[idProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[idProduto] ASC,
	[IdEstoque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[idFeedback] [int] IDENTITY(1,1) NOT NULL,
	[dataFeedback] [date] NOT NULL,
	[avaliacao] [varchar](50) NOT NULL,
	[comentario] [varchar](100) NOT NULL,
	[idCliente] [int] NOT NULL,
	[idProduto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idFeedback] ASC,
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[idCliente] ASC,
	[idFeedback] ASC,
	[idProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fornecer]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fornecer](
	[fk_Mercado_idMercado] [int] NOT NULL,
	[fk_Coleta_IdColeta] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FuncionarioPlataforma]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuncionarioPlataforma](
	[idFuncionarioPlataforma] [int] IDENTITY(1,1) NOT NULL,
	[tipoFuncionarioPlataforma] [varchar](30) NULL,
	[cpf] [varchar](20) NULL,
	[fk_telefoneFuncionario_telefoneFuncionario_PK] [int] NULL,
	[nome] [varchar](40) NULL,
	[email] [varchar](40) NULL,
	[dataDeNascimento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idFuncionarioPlataforma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gerar]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gerar](
	[fk_Cliente_idCliente] [int] NOT NULL,
	[fk_Pedido_idPedido] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoricoPedido]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoricoPedido](
	[idHistoricoPedido] [int] IDENTITY(1,1) NOT NULL,
	[pedidoRecente] [varchar](1) NOT NULL,
	[idPedido] [int] NOT NULL,
	[dataPedido] [date] NOT NULL,
	[statusNovo] [varchar](1) NOT NULL,
	[statusAntigo] [varchar](1) NOT NULL,
	[idFeedback] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idHistoricoPedido] ASC,
	[idPedido] ASC,
	[idFeedback] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[idPedido] ASC,
	[idFeedback] ASC,
	[idHistoricoPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inserir]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inserir](
	[fk_Produto_Idproduto] [int] NOT NULL,
	[fk_carrinho_idCarrinho] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstituicaoParceira]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstituicaoParceira](
	[idInstituicao] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](1) NOT NULL,
	[fk_telefoneInstituicao_telefoneInstituicao_PK] [varchar](20) NOT NULL,
	[email] [varchar](1) NOT NULL,
	[descricao] [varchar](1) NOT NULL,
	[cnpj] [varchar](1) NOT NULL,
	[nomeRepresentante] [varchar](1) NOT NULL,
	[dataInicioParceiro] [date] NULL,
	[observacoes] [varchar](1) NULL,
	[dataDeFundacao] [date] NULL,
	[cep] [varchar](1) NULL,
	[cidade] [varchar](1) NULL,
	[estado] [varchar](1) NULL,
	[numero] [varchar](1) NULL,
	[rua] [varchar](1) NULL,
	[complemento] [varchar](1) NULL,
	[bairro] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[idInstituicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mercado]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mercado](
	[idMercado] [int] IDENTITY(1,1) NOT NULL,
	[nomeMercado] [varchar](1) NOT NULL,
	[email] [varchar](1) NOT NULL,
	[CNPJ] [varchar](1) NOT NULL,
	[dataCadastro] [date] NOT NULL,
	[Descriccao] [varchar](1) NOT NULL,
	[proprietario] [varchar](1) NOT NULL,
	[fk_telefoneMercado_telefoneMercado_PK] [varchar](20) NOT NULL,
	[fk_telefoneProprietario_telefoneProprietario_PK] [varchar](20) NOT NULL,
	[bairro] [varchar](1) NOT NULL,
	[complemento] [varchar](1) NOT NULL,
	[cidade] [varchar](1) NOT NULL,
	[numero] [varchar](1) NOT NULL,
	[cep] [varchar](1) NOT NULL,
	[rua] [varchar](1) NOT NULL,
	[estado] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMercado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[negociar]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[negociar](
	[fk_InstituicaoParceira_idInstituicao] [int] NOT NULL,
	[fk_Mercado_idMercado] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[obter]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[obter](
	[fk_Mercado_idMercado] [int] NOT NULL,
	[fk_Atendimento_idAtendimento] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagamento]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagamento](
	[idPagamento] [int] IDENTITY(1,1) NOT NULL,
	[dataCompra] [date] NULL,
	[debito] [varchar](1) NULL,
	[credito] [varchar](1) NULL,
	[dinheiro] [varchar](1) NULL,
	[pix] [varchar](1) NULL,
	[valorCompra] [numeric](18, 0) NULL,
	[desconto] [numeric](18, 0) NULL,
	[idPedido] [int] NOT NULL,
	[status] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPagamento] ASC,
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[idPedido] [int] IDENTITY(1,1) NOT NULL,
	[dataCompra] [date] NOT NULL,
	[valorTotal] [varchar](1) NOT NULL,
	[metodoPagamento] [varchar](1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[idCarrinho] [int] NOT NULL,
	[status] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC,
	[idCliente] ASC,
	[idCarrinho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[idCliente] ASC,
	[idPedido] ASC,
	[idCarrinho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[possuir]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[possuir](
	[fk_Cliente_idCliente] [int] NOT NULL,
	[fk_carrinho_idCarrinho] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produto]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produto](
	[Idproduto] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](1) NOT NULL,
	[descricao] [varchar](1) NOT NULL,
	[categoria] [varchar](1) NOT NULL,
	[preco] [numeric](18, 0) NOT NULL,
	[dataValidade] [date] NOT NULL,
	[status] [varchar](1) NOT NULL,
	[estoque] [numeric](18, 0) NOT NULL,
	[imagem] [varbinary](max) NOT NULL,
	[idMercado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Idproduto] ASC,
	[idMercado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[idMercado] ASC,
	[Idproduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promocao]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promocao](
	[idPromocao] [int] IDENTITY(1,1) NOT NULL,
	[desconto] [varchar](1) NOT NULL,
	[dataInicio] [date] NOT NULL,
	[dataOferta] [date] NOT NULL,
	[precoFinal] [varchar](1) NOT NULL,
	[IdProduto] [int] NOT NULL,
	[idMercado] [int] NOT NULL,
	[descricao] [varchar](1) NOT NULL,
	[status] [varchar](1) NOT NULL,
	[condicoes] [varchar](1) NOT NULL,
	[nomePromocao] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPromocao] ASC,
	[IdProduto] ASC,
	[idMercado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[idPromocao] ASC,
	[IdProduto] ASC,
	[idMercado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[realizar]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[realizar](
	[fk_Atendimento_idAtendimento] [int] NOT NULL,
	[fk_FuncionarioPlataforma_idFuncionarioPlataforma] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[receber]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[receber](
	[fk_Promocao_idPromocao] [int] NOT NULL,
	[fk_Produto_Idproduto] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registrar]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registrar](
	[fk_Pedido_idPedido] [int] NOT NULL,
	[fk_HistoricoPedido_idHistoricoPedido] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[solicitar]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[solicitar](
	[fk_Cliente_idCliente] [int] NOT NULL,
	[fk_Atendimento_idAtendimento] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefoneCliente]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefoneCliente](
	[telefoneCliente_PK] [int] IDENTITY(1,1) NOT NULL,
	[telefoneCliente] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[telefoneCliente_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefoneFuncionario]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefoneFuncionario](
	[telefoneFuncionario_PK] [int] IDENTITY(1,1) NOT NULL,
	[telefoneFuncionario] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[telefoneFuncionario_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefoneInstituicao]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefoneInstituicao](
	[telefoneInstituicao_PK] [int] IDENTITY(1,1) NOT NULL,
	[telefoneInstituicao] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[telefoneInstituicao_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefoneMercado]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefoneMercado](
	[telefoneMercado_PK] [int] IDENTITY(1,1) NOT NULL,
	[telefoneMercado] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[telefoneMercado_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefoneProprietario]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefoneProprietario](
	[telefoneProprietario_PK] [int] IDENTITY(1,1) NOT NULL,
	[telefoneProprietario] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[telefoneProprietario_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venda]    Script Date: 09/12/2024 12:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venda](
	[categoriaProduto] [varchar](30) NOT NULL,
	[IdVenda] [int] IDENTITY(1,1) NOT NULL,
	[Desconto] [float] NOT NULL,
	[quantidadeVenda] [numeric](18, 0) NOT NULL,
	[valorAdquirido] [numeric](18, 0) NOT NULL,
	[porcentagemDada] [numeric](18, 0) NOT NULL,
	[Valor] [float] NOT NULL,
	[tipoVenda] [varchar](30) NOT NULL,
	[dataVenda] [date] NOT NULL,
	[idPagamento] [int] NOT NULL,
	[idPedido] [int] NOT NULL,
	[idPromocao] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenda] ASC,
	[idPagamento] ASC,
	[idPedido] ASC,
	[idCliente] ASC,
	[idPromocao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[IdVenda] ASC,
	[idPagamento] ASC,
	[idPedido] ASC,
	[idPromocao] ASC,
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[adicionar]  WITH CHECK ADD  CONSTRAINT [FK_adicionar_1] FOREIGN KEY([fk_Produto_Idproduto], [fk_Mercado_idMercado])
REFERENCES [dbo].[Produto] ([Idproduto], [idMercado])
GO
ALTER TABLE [dbo].[adicionar] CHECK CONSTRAINT [FK_adicionar_1]
GO
ALTER TABLE [dbo].[armazenar]  WITH CHECK ADD  CONSTRAINT [FK_armazenar_1] FOREIGN KEY([fk_Estoque_IdEstoque], [fk_Produto_Idproduto])
REFERENCES [dbo].[Estoque] ([IdEstoque], [idProduto])
GO
ALTER TABLE [dbo].[armazenar] CHECK CONSTRAINT [FK_armazenar_1]
GO
ALTER TABLE [dbo].[fornecer]  WITH CHECK ADD  CONSTRAINT [FK_fornecer_1] FOREIGN KEY([fk_Mercado_idMercado])
REFERENCES [dbo].[Mercado] ([idMercado])
GO
ALTER TABLE [dbo].[fornecer] CHECK CONSTRAINT [FK_fornecer_1]
GO
ALTER TABLE [dbo].[negociar]  WITH CHECK ADD  CONSTRAINT [FK_negociar_1] FOREIGN KEY([fk_InstituicaoParceira_idInstituicao])
REFERENCES [dbo].[InstituicaoParceira] ([idInstituicao])
GO
ALTER TABLE [dbo].[negociar] CHECK CONSTRAINT [FK_negociar_1]
GO
ALTER TABLE [dbo].[negociar]  WITH CHECK ADD  CONSTRAINT [FK_negociar_2] FOREIGN KEY([fk_Mercado_idMercado])
REFERENCES [dbo].[Mercado] ([idMercado])
GO
ALTER TABLE [dbo].[negociar] CHECK CONSTRAINT [FK_negociar_2]
GO
ALTER TABLE [dbo].[obter]  WITH CHECK ADD  CONSTRAINT [FK_obter_1] FOREIGN KEY([fk_Mercado_idMercado])
REFERENCES [dbo].[Mercado] ([idMercado])
GO
ALTER TABLE [dbo].[obter] CHECK CONSTRAINT [FK_obter_1]
GO
ALTER TABLE [dbo].[possuir]  WITH CHECK ADD  CONSTRAINT [FK_possuir_1] FOREIGN KEY([fk_Cliente_idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[possuir] CHECK CONSTRAINT [FK_possuir_1]
GO
ALTER TABLE [dbo].[realizar]  WITH CHECK ADD  CONSTRAINT [FK_realizar_2] FOREIGN KEY([fk_FuncionarioPlataforma_idFuncionarioPlataforma])
REFERENCES [dbo].[FuncionarioPlataforma] ([idFuncionarioPlataforma])
GO
ALTER TABLE [dbo].[realizar] CHECK CONSTRAINT [FK_realizar_2]
GO
ALTER TABLE [dbo].[solicitar]  WITH CHECK ADD  CONSTRAINT [FK_solicitar_1] FOREIGN KEY([fk_Cliente_idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[solicitar] CHECK CONSTRAINT [FK_solicitar_1]
GO
USE [master]
GO
ALTER DATABASE [BROA] SET  READ_WRITE 
GO
