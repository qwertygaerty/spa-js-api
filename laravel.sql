-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 14 2022 г., 15:11
-- Версия сервера: 10.4.20-MariaDB
-- Версия PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(1, '2021_03_23_141635_create_tables_table', 1),
(2, '2021_03_23_142356_create_roles_table', 1),
(3, '2021_03_23_142815_create_menu_categories_table', 1),
(4, '2021_03_23_143222_create_users_table', 1),
(5, '2021_03_23_152629_create_work_shifts_table', 1),
(6, '2021_03_23_153122_create_shift_workers_table', 1),
(7, '2021_03_23_154221_create_menus_table', 1),
(8, '2021_03_23_154834_create_status_orders_table', 1),
(9, '2021_03_23_154955_create_orders_table', 1),
(10, '2021_03_23_155313_create_order_menus_table', 1);

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
(1, 'Hosea', 'Cecile', 'Carmen', 'admin', 'admin', NULL, 'wCmzEBbMkS', 'working', 1, '2021-04-03 04:23:07', '2022-02-14 05:31:41'),
(2, 'Trace', 'Tremayne', 'Austin', 'waiter', 'waiter', NULL, 'hSEiv2X51l', 'working', 2, '2021-04-03 04:23:07', '2021-11-19 05:49:21'),
(4, 'name', NULL, NULL, 'Reagan_Luettgen4', 'password', NULL, NULL, 'working', 2, '2021-11-19 05:59:30', '2021-11-19 05:59:30'),
(5, 'name', NULL, NULL, 'Braden54', 'password', NULL, NULL, 'working', 2, '2021-11-20 08:57:29', '2021-11-20 08:57:29'),
(6, 'name', 'surname', 'patronymic', 'Frederick54', 'password', NULL, NULL, 'working', 2, '2021-11-20 08:57:33', '2021-11-20 08:57:33'),
(7, 'name', 'surname', 'patronymic', 'Erica_Mraz72', 'password', NULL, NULL, 'working', 2, '2021-11-20 08:57:53', '2021-11-20 08:57:53'),
(8, 'name', 'surname', 'patronymic', 'Hillary.Wyman60', 'password', NULL, 'pNU4nsb232', 'working', 2, '2021-11-20 08:58:01', '2021-11-20 08:58:21'),
(9, 'name', NULL, NULL, 'Darwin_Trantow', 'password', NULL, NULL, 'working', 1, '2021-11-20 08:59:17', '2021-11-20 08:59:17'),
(10, 'name', NULL, NULL, 'Marisa_Ullrich76', 'password', 'C:\\xampp1\\tmp\\php8098.tmp', NULL, 'working', 1, '2021-11-20 09:00:09', '2021-11-20 09:00:09');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
