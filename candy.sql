-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 10 2022 г., 03:48
-- Версия сервера: 8.0.19
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `candy`
--
CREATE DATABASE IF NOT EXISTS `candy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `candy`;

-- --------------------------------------------------------

--
-- Структура таблицы `candy`
--

CREATE TABLE `candy` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` blob,
  `type` int NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `candy`
--

INSERT INTO `candy` (`id`, `name`, `image`, `type`, `price`, `description`) VALUES
(1, 'Аленка', 0x696d61676573, 1, '120', 'Маленькие конфеты'),
(2, 'Карамель', 0x696d61676573, 4, '160', 'Очень сладкие'),
(3, 'Птичка', 0x696d61676573, 3, '75', 'Маленькие конфеты'),
(4, 'Медведь', 0x696d61676573, 5, '86', 'Круглые конфеты'),
(5, 'Снегурочка', 0x696d61676573, 2, '35', 'С мандариновой начинкой');

-- --------------------------------------------------------

--
-- Структура таблицы `dispatch`
--

CREATE TABLE `dispatch` (
  `id` int NOT NULL,
  `candy` int NOT NULL,
  `data` datetime NOT NULL,
  `countbox` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `dispatch`
--

INSERT INTO `dispatch` (`id`, `candy`, `data`, `countbox`) VALUES
(1, 1, '2021-10-10 00:00:00', 123),
(2, 2, '2021-09-01 00:00:00', 45),
(3, 3, '2021-03-10 00:00:00', 33),
(4, 4, '2021-12-12 00:00:00', 57),
(5, 5, '2021-10-05 00:00:00', 23);

-- --------------------------------------------------------

--
-- Структура таблицы `receipt`
--

CREATE TABLE `receipt` (
  `id` int NOT NULL,
  `suppliers` int NOT NULL,
  `candy` int NOT NULL,
  `data` datetime NOT NULL,
  `countbox` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `receipt`
--

INSERT INTO `receipt` (`id`, `suppliers`, `candy`, `data`, `countbox`) VALUES
(1, 1, 1, '2021-09-10 00:00:00', 150),
(2, 2, 2, '2021-08-01 00:00:00', 45),
(3, 3, 3, '2021-02-10 00:00:00', 50),
(4, 4, 4, '2021-11-12 00:00:00', 60),
(5, 5, 5, '2021-09-05 00:00:00', 23);

-- --------------------------------------------------------

--
-- Структура таблицы `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `address`) VALUES
(1, 'Слада', 'Тюменская обл., г. Ишим, ул. Советская, д. 18'),
(2, 'BonSapore', 'Россия, Москва, Кольская улица, 2к4'),
(3, 'РОСЬ', 'Россия, Новосибирск, улица Кирова, 113'),
(4, 'Мерлетто', 'Липецкий р-н, с. Косыревка, ул. Новая, д. 16'),
(5, 'Метрополис', 'Россия, Краснодарский край, г. Армавир, ул. К. Маркса, 86');

-- --------------------------------------------------------

--
-- Структура таблицы `type`
--

CREATE TABLE `type` (
  `id` int NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `type`
--

INSERT INTO `type` (`id`, `type`) VALUES
(1, 'Шоколадные'),
(2, 'Карамельные'),
(3, 'Лакричные'),
(4, 'Ирис'),
(5, 'Суфле');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `candy`
--
ALTER TABLE `candy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Индексы таблицы `dispatch`
--
ALTER TABLE `dispatch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candy` (`candy`);

--
-- Индексы таблицы `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suppliers` (`suppliers`),
  ADD KEY `candy` (`candy`);

--
-- Индексы таблицы `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `dispatch`
--
ALTER TABLE `dispatch`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `receipt`
--
ALTER TABLE `receipt`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `type`
--
ALTER TABLE `type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `candy`
--
ALTER TABLE `candy`
  ADD CONSTRAINT `candy_ibfk_1` FOREIGN KEY (`type`) REFERENCES `type` (`id`);

--
-- Ограничения внешнего ключа таблицы `dispatch`
--
ALTER TABLE `dispatch`
  ADD CONSTRAINT `dispatch_ibfk_1` FOREIGN KEY (`candy`) REFERENCES `candy` (`id`);

--
-- Ограничения внешнего ключа таблицы `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`suppliers`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `receipt_ibfk_2` FOREIGN KEY (`candy`) REFERENCES `candy` (`id`);
--
-- База данных: `con`
--
CREATE DATABASE IF NOT EXISTS `con` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `con`;

-- --------------------------------------------------------

--
-- Структура таблицы `candy`
--

CREATE TABLE `candy` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` blob NOT NULL,
  `type` int NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `dispatch`
--

CREATE TABLE `dispatch` (
  `id` int NOT NULL,
  `candy` int NOT NULL,
  `data` datetime NOT NULL,
  `countbox` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `receipt`
--

CREATE TABLE `receipt` (
  `id` int NOT NULL,
  `suppliers` int NOT NULL,
  `candy` int NOT NULL,
  `data` datetime NOT NULL,
  `countbox` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `type`
--

CREATE TABLE `type` (
  `id` int NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `type`
--

INSERT INTO `type` (`id`, `type`) VALUES
(1, 'Шоколадные'),
(2, 'Карамельные'),
(3, 'Лакричные'),
(4, 'Ирис'),
(5, 'Суфле');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `candy`
--
ALTER TABLE `candy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Индексы таблицы `dispatch`
--
ALTER TABLE `dispatch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candy` (`candy`);

--
-- Индексы таблицы `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suppliers` (`suppliers`),
  ADD KEY `candy` (`candy`);

--
-- Индексы таблицы `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `candy`
--
ALTER TABLE `candy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `dispatch`
--
ALTER TABLE `dispatch`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `receipt`
--
ALTER TABLE `receipt`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `type`
--
ALTER TABLE `type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `candy`
--
ALTER TABLE `candy`
  ADD CONSTRAINT `candy_ibfk_1` FOREIGN KEY (`type`) REFERENCES `type` (`id`);

--
-- Ограничения внешнего ключа таблицы `dispatch`
--
ALTER TABLE `dispatch`
  ADD CONSTRAINT `dispatch_ibfk_1` FOREIGN KEY (`candy`) REFERENCES `candy` (`id`);

--
-- Ограничения внешнего ключа таблицы `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`suppliers`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `receipt_ibfk_2` FOREIGN KEY (`candy`) REFERENCES `candy` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
