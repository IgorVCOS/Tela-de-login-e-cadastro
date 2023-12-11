-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/12/2023 às 20:20
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pessoa`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro`
--

CREATE TABLE `cadastro` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `Senha` varchar(20) NOT NULL,
  `idade` int(11) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `Cidade` varchar(20) DEFAULT NULL,
  `CPF` bigint(15) NOT NULL,
  `RG` bigint(30) DEFAULT NULL,
  `Estado_civil` varchar(25) DEFAULT NULL,
  `Ano_nascimento` year(4) NOT NULL,
  `CEP` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cadastro`
--

INSERT INTO `cadastro` (`id`, `nome`, `Senha`, `idade`, `uf`, `Cidade`, `CPF`, `RG`, `Estado_civil`, `Ano_nascimento`, `CEP`) VALUES
(1, 'Igor', 'igordodbd123', 19, 'PE', 'Paulista', 45676545676, 1045654765, 'Casado', '2004', 53427300),
(2, 'Maria Clara', 'mariadolol123', 20, 'PE', 'Paulista', 43543565767, 1123454678, 'Casada', '2003', 53429230),
(3, 'Wellington', 'LonelyNight', 31, 'AM', 'Manaus', 36259322020, 455657567, 'Viuvo', '1991', 69015450),
(4, 'Marcelo', 'gordaofoguetes', 19, 'PE', 'Paulista', 21720720010, 355640442, 'Solteiro', '2004', 53409055),
(5, 'Muniz', 'doidovarrido', 19, 'PE', 'Paulista', 86915954007, 177281881, 'Solteiro', '2004', 53433580),
(6, 'Jonatan', 'maluco', 32, 'PB', 'João pessoa', 33933618053, 491414407, 'Divorciado', '1990', 58046374),
(7, 'Menina', 'menina', 46, 'RJ', 'Niterói', 98153326007, 148204119, 'Casada ', '1977', 24130345);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cadastro`
--
ALTER TABLE `cadastro`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cadastro`
--
ALTER TABLE `cadastro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
