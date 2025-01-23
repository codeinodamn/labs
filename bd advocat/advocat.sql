-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 21 2024 г., 12:01
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `advocat`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Cases`
--

CREATE TABLE `Cases` (
  `case_id` bigint UNSIGNED NOT NULL,
  `case_name` varchar(255) NOT NULL,
  `description` text,
  `status` varchar(50) DEFAULT NULL,
  `open_date` date DEFAULT NULL,
  `client_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Cases`
--

INSERT INTO `Cases` (`case_id`, `case_name`, `description`, `status`, `open_date`, `client_id`) VALUES
(1, 'Развод между Ивановыми', 'Разрешение спора о разделе имущества', 'В процессе', '2024-06-20', 1),
(2, 'Уголовное дело против Сидорова', 'Оскорбление чести и достоинства', 'Завершено', '2024-06-25', 2),
(3, 'Гражданское дело', 'Новое', 'Открыто', '2024-06-22', 3),
(4, 'Спор о возврате займа между Обществом с ограниченной ответственностью \"Партнеры\" и гражданином Петровым', 'Спор о возврате суммы 1 000 000 рублей, выданной в долг', 'Открыто', '2024-06-18', 4),
(5, 'Наследственное дело по делу о завещании умершего гражданина Смирнова', 'Разрешение спора между наследниками', 'В процессе', '2024-06-22', 5),
(6, 'Дело о правах потребителей', 'Защита прав потребителей в суде', 'Новое', '2024-07-01', 6),
(7, 'Административное дело', 'Открыто', 'Рассмотрение', '2024-06-30', 7),
(8, 'Трудовое дело сотрудника Компании \"Прогресс\"', 'Защита прав нарушенных трудовых прав', 'Рассмотрение', '2024-06-28', 8),
(9, 'Спор между соседями по дачному участку', 'Раздел земельного участка', 'В процессе', '2024-06-27', 9),
(10, 'Экономическое дело против компании \"Финансы\"', 'Спор о несостоятельности', 'Новое', '2024-06-26', 10),
(11, 'Спор о защите прав потребителей', 'Защита прав в суде по вопросам потребительских прав', 'В процессе', '2024-06-30', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `Clients`
--

CREATE TABLE `Clients` (
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `registration_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Clients`
--

INSERT INTO `Clients` (`client_id`, `name`, `phone`, `address`, `email`, `registration_date`) VALUES
(1, 'Иванов Иван Иванович', '+7 (999) 123-45-67', 'г. Москва, ул. Пушкина, д. 10', 'ivanov@example.com', '2024-06-22'),
(2, 'Петрова Мария Ивановна', '+7 (999) 234-56-78', 'г. Санкт-Петербург, ул. Ленина, д. 15', 'petrova@example.com', '2024-06-22'),
(3, 'Кузнецов Игорь Петрович', '+7 999 432 10 98', 'г. Воронеж, ул. Ленина, д. 25', 'kuznetsov@example.com', '2022-09-05'),
(4, 'Сидоров Василий Павлович', '+7 (999) 345-67-89', 'г. Москва, ул. Гагарина, д. 5', 'sidorov@example.com', '2022-09-05'),
(5, 'Козлова Ольга Владимировна', '+7 (999) 456-78-90', 'г. Новосибирск, ул. Ленина, д. 100, кв. 25', 'kozlova@example.com', '2023-12-15'),
(6, 'Иванова Елена Николаевна', '9991234567', 'г. Екатеринбург, ул. Победы, д. 20', 'ivanova@example.com', '2022-08-05'),
(7, 'Смирнов Павел Викторович', '+7 (999) 987-65-43', 'Москва, ул. Пролетарская, д. 30, кв. 50', 'smirnov@example.com', '2023-05-10'),
(8, 'Григорьева Анастасия Валерьевна', '+7 (999) 876-54-32', 'Санкт-Петербург, пр. Невский, д. 50', 'grigoryeva@example.com', '2022-11-20'),
(9, 'Новиков Дмитрий Станиславович', '+7 (999) 765-43-21', 'Санкт-Петербург, пр. Крутой, д. 52', 'novikov@example.com', '2023-03-30'),
(10, 'Федорова Татьяна Васильевна', '+7 (999) 654-32-10', 'г. Ростов-на-Дону, ул. Пушкина, д. 5, корпус № 2', 'fedorova@example.com', '2022-07-15');

-- --------------------------------------------------------

--
-- Структура таблицы `Courts`
--

CREATE TABLE `Courts` (
  `court_id` bigint UNSIGNED NOT NULL,
  `court_name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Courts`
--

INSERT INTO `Courts` (`court_id`, `court_name`, `address`, `phone`) VALUES
(1, 'Городской суд Центрального района', 'ул. Ленина, д. 10, г. Москва', '+7 (495) 123-45-67'),
(2, 'Районный суд Южного округа', 'пр. Победы, д. 25, г. Санкт-Петербург', '+7 (812) 987-65-43'),
(3, 'Арбитражный суд Северо-Западного региона', 'ул. Профсоюзная, д. 50, г. Новосибирск', '+7 (383) 234-56-78'),
(4, 'Городской суд Восточного округа', 'пл. Советская, д. 15, г. Екатеринбург', '+7 (343) 345-67-89'),
(5, 'Районный суд Западной части', 'ул. Кирова, д. 30, г. Казань', '+7 (843) 456-78-90'),
(6, 'Апелляционный суд Центрального округа', 'пр. Ленина, д. 5, г. Волгоград', '+7 (844) 567-89-01'),
(7, 'Городской суд Северной части', 'ул. Мира, д. 20, г. Ростов-на-Дону', '+7 (863) 678-90-12'),
(8, 'Районный суд Юго-Западного района', 'пл. Победы, д. 3, г. Уфа', '+7 (347) 789-01-23'),
(9, 'Арбитражный суд Сибирского края', 'ул. Советская, д. 40, г. Иркутск', '+7 (395) 890-12-34'),
(10, 'Городской суд Юго-Восточного округа', 'ул. Пушкина, д. 12, г. Владивосток', '+7 (423) 901-23-45');

-- --------------------------------------------------------

--
-- Структура таблицы `Court_Hearings`
--

CREATE TABLE `Court_Hearings` (
  `hearing_id` bigint UNSIGNED NOT NULL,
  `datetime` timestamp NULL DEFAULT NULL,
  `case_id` int DEFAULT NULL,
  `court_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Court_Hearings`
--

INSERT INTO `Court_Hearings` (`hearing_id`, `datetime`, `case_id`, `court_id`) VALUES
(1, '2024-07-10 07:00:00', 1, 1),
(2, '2024-07-11 08:30:00', 2, 2),
(3, '2024-07-12 06:00:00', 3, 3),
(4, '2024-07-13 11:00:00', 4, 4),
(5, '2024-07-14 10:15:00', 5, 5),
(6, '2024-07-15 13:30:00', 6, 6),
(7, '2024-07-16 05:45:00', 7, 7),
(8, '2024-07-17 09:00:00', 8, 8),
(9, '2024-07-18 12:00:00', 9, 9),
(10, '2024-07-19 14:00:00', 10, 10);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `currentcasesview`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `currentcasesview` (
`case_id` bigint unsigned
,`case_name` varchar(255)
,`description` text
,`status` varchar(50)
,`open_date` date
,`client_name` varchar(100)
,`client_phone` varchar(20)
);

-- --------------------------------------------------------

--
-- Структура таблицы `Documents`
--

CREATE TABLE `Documents` (
  `document_id` bigint UNSIGNED NOT NULL,
  `document_name` varchar(255) NOT NULL,
  `content` text,
  `creation_date` date DEFAULT NULL,
  `case_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Documents`
--

INSERT INTO `Documents` (`document_id`, `document_name`, `content`, `creation_date`, `case_id`) VALUES
(1, 'Договор аренды', 'Текст договора...', '2024-06-20', 1),
(2, 'Справка о состоянии здоровья', 'Текст справки...', '2024-06-21', 2),
(3, 'Протокол судебного заседания', 'Текст протокола...', '2024-06-22', 3),
(4, 'Заявление о признании права', 'Текст заявления...', '2024-06-23', 4),
(6, 'Договор купли-продажи', 'Текст договора...', '2024-06-25', 6),
(7, 'Жалоба в прокуратуру', 'Текст жалобы...', '2024-06-26', 7),
(8, 'Финансовый отчет', 'Текст отчета...', '2024-06-27', 8),
(9, 'Доверенность', 'Текст доверенности...', '2024-06-28', 9),
(10, 'Устав организации', 'Текст устава...', '2024-06-29', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `Employees`
--

CREATE TABLE `Employees` (
  `employee_id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `position` varchar(100) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Employees`
--

INSERT INTO `Employees` (`employee_id`, `name`, `position`, `hire_date`, `salary`, `department`) VALUES
(1, 'Иванов Иван Иванович', 'Юрист', '2023-05-10', '70000.00', 'Юридический отдел'),
(2, 'Петров Петр Петрович', 'Финансовый аналитик', '2023-04-15', '80000.00', 'Финансовый отдел'),
(3, 'Сидорова Анна Николаевна', 'IT специалист', '2023-06-20', '75000.00', 'IT отдел'),
(4, 'Козлова Елена Игоревна', 'Менеджер по продажам', '2023-05-05', '60000.00', 'Отдел продаж'),
(5, 'Новиков Игорь Владимирович', 'HR специалист', '2023-04-30', '65000.00', 'Отдел кадров'),
(6, 'Морозов Алексей Дмитриевич', 'Администратор систем', '2023-06-30', '72000.00', 'IT отдел'),
(7, 'Васильева Ольга Владимировна', 'Бухгалтер', '2023-06-28', '58000.00', 'Финансовый отдел'),
(8, 'Кузнецов Дмитрий Александрович', 'Адвокат', '2023-06-27', '78000.00', 'Юридический отдел'),
(9, 'Соколова Екатерина Ивановна', 'Маркетолог', '2023-06-23', '53000.00', 'Маркетинговый отдел'),
(10, 'Григорьев Артем Сергеевич', 'Аналитик данных', '2023-06-26', '69000.00', 'Аналитический отдел');

-- --------------------------------------------------------

--
-- Структура таблицы `Payments`
--

CREATE TABLE `Payments` (
  `payment_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `description` text,
  `client_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Payments`
--

INSERT INTO `Payments` (`payment_id`, `amount`, `payment_date`, `description`, `client_id`) VALUES
(1, '5000.00', '2024-07-01', 'За консультацию по налоговому праву', 1),
(2, '10000.00', '2024-07-02', 'Аванс на выполнение юридических услуг', 2),
(3, '7500.00', '2024-07-03', 'Оплата за составление договора', 3),
(4, '3000.00', '2024-07-04', 'За представление интересов в суде', 4),
(5, '12000.00', '2024-07-05', 'Полная оплата услуг по наследственному праву', 5),
(6, '6000.00', '2024-07-06', 'За консультацию по корпоративному праву', 6),
(7, '8500.00', '2024-07-07', 'Оплата за юридический анализ договора', 7),
(8, '4000.00', '2024-07-08', 'За услуги по трудовому праву', 8),
(9, '9500.00', '2024-07-09', 'Оплата за представление в арбитражном суде', 9),
(10, '2000.00', '2024-07-10', 'За консультацию по иммиграционному праву', 10);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `recentpaymentsreport`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `recentpaymentsreport` (
`payment_id` bigint unsigned
,`amount` decimal(10,2)
,`payment_date` date
,`description` text
,`client_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE `Users` (
  `user_id` bigint UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`user_id`, `username`, `password`, `role`) VALUES
(1, 'alice_smith', 'password123', 'admin'),
(2, 'john_doe', 'securepass', 'user'),
(3, 'jane_miller', 'qwerty789', 'user'),
(4, 'sam_jackson', 'pass1234', 'admin'),
(5, 'emily_wilson', 'letmein', 'user'),
(6, 'mike_anderson', 'password456', 'user'),
(7, 'sara_jones', 'securepassword', 'admin'),
(8, 'peter_smith', 'mypassword', 'user'),
(9, 'linda_brown', 'password789', 'admin'),
(10, 'alex_turner', 'pass789', 'user');

-- --------------------------------------------------------

--
-- Структура для представления `currentcasesview`
--
DROP TABLE IF EXISTS `currentcasesview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `currentcasesview`  AS SELECT `c`.`case_id` AS `case_id`, `c`.`case_name` AS `case_name`, `c`.`description` AS `description`, `c`.`status` AS `status`, `c`.`open_date` AS `open_date`, `cl`.`name` AS `client_name`, `cl`.`phone` AS `client_phone` FROM (`cases` `c` join `clients` `cl` on((`c`.`client_id` = `cl`.`client_id`)))  ;

-- --------------------------------------------------------

--
-- Структура для представления `recentpaymentsreport`
--
DROP TABLE IF EXISTS `recentpaymentsreport`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `recentpaymentsreport`  AS SELECT `p`.`payment_id` AS `payment_id`, `p`.`amount` AS `amount`, `p`.`payment_date` AS `payment_date`, `p`.`description` AS `description`, `cl`.`name` AS `client_name` FROM (`payments` `p` join `clients` `cl` on((`p`.`client_id` = `cl`.`client_id`))) WHERE (`p`.`payment_date` >= (curdate() - interval 1 month))  ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Cases`
--
ALTER TABLE `Cases`
  ADD PRIMARY KEY (`case_id`),
  ADD UNIQUE KEY `case_id` (`case_id`);

--
-- Индексы таблицы `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`client_id`),
  ADD UNIQUE KEY `client_id` (`client_id`);

--
-- Индексы таблицы `Courts`
--
ALTER TABLE `Courts`
  ADD PRIMARY KEY (`court_id`),
  ADD UNIQUE KEY `court_id` (`court_id`);

--
-- Индексы таблицы `Court_Hearings`
--
ALTER TABLE `Court_Hearings`
  ADD PRIMARY KEY (`hearing_id`),
  ADD UNIQUE KEY `hearing_id` (`hearing_id`);

--
-- Индексы таблицы `Documents`
--
ALTER TABLE `Documents`
  ADD PRIMARY KEY (`document_id`),
  ADD UNIQUE KEY `document_id` (`document_id`);

--
-- Индексы таблицы `Employees`
--
ALTER TABLE `Employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- Индексы таблицы `Payments`
--
ALTER TABLE `Payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `payment_id` (`payment_id`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Cases`
--
ALTER TABLE `Cases`
  MODIFY `case_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `Clients`
--
ALTER TABLE `Clients`
  MODIFY `client_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Courts`
--
ALTER TABLE `Courts`
  MODIFY `court_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Court_Hearings`
--
ALTER TABLE `Court_Hearings`
  MODIFY `hearing_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Documents`
--
ALTER TABLE `Documents`
  MODIFY `document_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Employees`
--
ALTER TABLE `Employees`
  MODIFY `employee_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Payments`
--
ALTER TABLE `Payments`
  MODIFY `payment_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
