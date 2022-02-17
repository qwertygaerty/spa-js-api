-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 17 2022 г., 04:31
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `laravel`
--

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2021_03_23_142356_create_roles_table', 1),
(4, '2021_03_23_143222_create_users_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `registrations`
--

CREATE TABLE `registrations` (
  `id` int(11) NOT NULL,
  `url` text DEFAULT NULL,
  `name` text NOT NULL,
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `position` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `registrations`
--

INSERT INTO `registrations` (`id`, `url`, `name`, `price`, `description`, `img`, `position`) VALUES
(1, 'https://moyka.com/wash', 'qq', 111, 'weqwe', '', 'qwe'),
(2, 'https://caring', 'caring', 1234, 'caring caringcaringcaringcaring v  caring caring caring', NULL, 'Berlin'),
(3, 'https://qweqwe', 'VIDUV KHUZOVA', 4321, 'qwe qwe qw eqw eqwe qwe qw eqw eq', NULL, 'Riga'),
(11, 'https://moyka.com/wash', 'pomut MASHINU', 4000, 'dsf usdf ho9sd fu80sdf u90sdf', '', '8'),
(12, 'https://caring', 'OBDUV', 1234, 'caring caringcaringcaringcaring v  caring caring caring', NULL, 'Berlin'),
(13, 'https://qweqwe', 'VIDUV KOLOSA', 4321, 'qwe qwe qw eqw eqwe qwe qw eqw eq', NULL, 'Riga'),
(14, 'https://moyka.com/wash', 'pomut BIBIKU', 4000, 'dsf usdf ho9sd fu80sdf u90sdf', '', '8'),
(15, 'https://caring', 'POMIT STECLO', 1234, 'caring caringcaringcaringcaring v  caring caring caring', NULL, 'Berlin');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `code`) VALUES
(1, 'Администратор', 'admin'),
(2, 'Официант', 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patronymic` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('working','fired') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'working',
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `patronymic`, `login`, `password`, `photo_file`, `api_token`, `status`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 'Hosea', 'Cecile', 'Carmen', 'admin', 'admin', NULL, 'BXORHgsJHc', 'working', 1, '2021-04-03 04:23:07', '2022-02-16 20:09:22'),
(2, 'Trace', 'Tremayne', 'Austin', 'waiter', 'waiter', NULL, 'hSEiv2X51l', 'working', 2, '2021-04-03 04:23:07', '2021-11-19 05:49:21'),
(4, 'name', NULL, NULL, 'Reagan_Luettgen4', 'password', NULL, NULL, 'working', 2, '2021-11-19 05:59:30', '2021-11-19 05:59:30'),
(5, 'name', NULL, NULL, 'Braden54', 'password', NULL, NULL, 'working', 2, '2021-11-20 08:57:29', '2021-11-20 08:57:29'),
(6, 'name', 'surname', 'patronymic', 'Frederick54', 'password', NULL, NULL, 'working', 2, '2021-11-20 08:57:33', '2021-11-20 08:57:33'),
(7, 'name', 'surname', 'patronymic', 'Erica_Mraz72', 'password', NULL, NULL, 'working', 2, '2021-11-20 08:57:53', '2021-11-20 08:57:53'),
(8, 'name', 'surname', 'patronymic', 'Hillary.Wyman60', 'password', NULL, 'pNU4nsb232', 'working', 2, '2021-11-20 08:58:01', '2021-11-20 08:58:21'),
(9, 'name', NULL, NULL, 'Darwin_Trantow', 'password', NULL, NULL, 'working', 1, '2021-11-20 08:59:17', '2021-11-20 08:59:17'),
(10, 'name', NULL, NULL, 'Marisa_Ullrich76', 'password', 'C:\\xampp1\\tmp\\php8098.tmp', NULL, 'working', 1, '2021-11-20 09:00:09', '2021-11-20 09:00:09');

-- --------------------------------------------------------

--
-- Структура таблицы `user_registrations`
--

CREATE TABLE `user_registrations` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `registration_id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `user_registrations`
--

INSERT INTO `user_registrations` (`id`, `user_id`, `registration_id`, `status`) VALUES
(1, 1, 1, 1),
(2, 1, 3, 1),
(3, 1, 2, 1),
(79, 1, 3, 1),
(80, 1, 1, 1),
(81, 1, 2, 1),
(82, 1, 3, 1),
(83, 1, 1, 1),
(86, 1, 1, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_code_unique` (`code`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_login_unique` (`login`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `user_registrations`
--
ALTER TABLE `user_registrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_user` (`user_id`),
  ADD KEY `id_registration` (`registration_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `user_registrations`
--
ALTER TABLE `user_registrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_registrations`
--
ALTER TABLE `user_registrations`
  ADD CONSTRAINT `user_registrations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_registrations_ibfk_2` FOREIGN KEY (`registration_id`) REFERENCES `registrations` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
