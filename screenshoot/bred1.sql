-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 25 2017 г., 20:26
-- Версия сервера: 5.7.14
-- Версия PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bred1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `appointments`
--

INSERT INTO `appointments` (`id`, `patient_id`, `doctor_id`, `appointment_date`, `created`, `modified`) VALUES
(1, 1, 1, '2017-02-25 14:50:00', '2017-02-25 14:50:13', '2017-02-25 14:50:13');

-- --------------------------------------------------------

--
-- Структура таблицы `carriers`
--

CREATE TABLE `carriers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `carrier_code` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `carriers`
--

INSERT INTO `carriers` (`id`, `name`, `carrier_code`, `created`, `modified`) VALUES
(1, 'bred2', 'br2', '2017-02-25 09:53:33', '2017-02-25 09:53:00'),
(2, 'Carrier2', 'bbbb', '2017-02-25 11:10:03', '2017-02-25 11:09:00'),
(3, 'Test2', 'code12', '2017-02-25 11:16:17', '2017-02-25 11:16:00'),
(4, 'own19922', 'bbbb33', '2017-02-25 14:16:20', '2017-02-25 14:12:00');

-- --------------------------------------------------------

--
-- Структура таблицы `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `accepting_patient` tinyint(4) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `accepting_patient`, `created`, `modified`) VALUES
(1, 'Doctor1', 1, '2017-02-25 14:49:24', '2017-02-25 14:49:24'),
(2, 'Doctor2', 1, '2017-02-25 14:49:46', '2017-02-25 14:49:46');

-- --------------------------------------------------------

--
-- Структура таблицы `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `services` varchar(255) NOT NULL,
  `due` date NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `invoices`
--

INSERT INTO `invoices` (`id`, `patient_id`, `amount`, `services`, `due`, `created`, `modified`) VALUES
(1, 1, '9', '333', '2017-02-25', '2017-02-25 15:08:16', '2017-02-25 15:08:16');

-- --------------------------------------------------------

--
-- Структура таблицы `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `carrier_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `patients`
--

INSERT INTO `patients` (`id`, `carrier_id`, `name`, `street`, `city`, `state`, `zipcode`, `email`, `phone`, `created`, `modified`) VALUES
(1, 3, 'Jhon doe', 'somehwere', 'Somecity', 'MD', 'm9000', 'test@test.com', '373', '2017-02-25 11:19:02', '2017-02-25 11:17:00');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created`, `modified`) VALUES
(5, 'Jhon doe', 'jhon@due.com', '$2y$10$IiWKcME2b8v55OmTNFx6aujtm3EGHovEXxuHyuiuN5MDPD6mLOzG6', '2017-02-25 16:11:41', '2017-02-25 16:11:41'),
(3, 'username', 'test@test.com', ')JIIpjgEbPT^iW9ypL', '2017-02-25 16:04:16', '2017-02-25 16:04:16'),
(4, 'encrypted', 'root@root.mail', '$2y$10$L74SgPpasaKXrDe63qUmmuGzGnru1BbcIqIT9CyrMqjcJppLylm/m', '2017-02-25 16:10:32', '2017-02-25 16:10:32'),
(6, 'test', 'test23@gmail.com', '$2y$10$mLprCJfcuNxJQNtMCLGO7O8EDqYUd39yLCLIfGkxOjo/fcoUnEsV6', '2017-02-25 20:06:59', '2017-02-25 20:06:59');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `carriers`
--
ALTER TABLE `carriers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `carriers`
--
ALTER TABLE `carriers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
