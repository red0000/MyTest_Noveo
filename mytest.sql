-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Окт 25 2016 г., 00:44
-- Версия сервера: 10.1.16-MariaDB
-- Версия PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mytest`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`, `updated_at`) VALUES
('administrator', 1, 1477147125, 1477147125),
('administrator', 3, 1477267009, NULL),
('groupCreate', 23, 1477346177, NULL),
('groupManage', 4, 1477305978, NULL),
('groupPermissions', 23, 1477346169, NULL),
('groupView', 4, 1477305987, NULL),
('moderator', 2, 1477147125, 1477147125),
('userPermissions', 4, 1477305962, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('administrator', 1, 'Administrator', NULL, NULL, 1477147125, 1477147125),
('groupCreate', 2, 'Creating groups', NULL, NULL, 1477147125, 1477147125),
('groupDelete', 2, 'Deleting groups', NULL, NULL, 1477147125, 1477147125),
('groupManage', 2, 'Browse list of groups', NULL, NULL, 1477147125, 1477147125),
('groupPermissions', 2, 'Manage rights of groups', NULL, NULL, 1477147125, 1477147125),
('groupUpdate', 2, 'Editing groups', NULL, NULL, 1477147125, 1477147125),
('groupView', 2, 'Viewing group information', NULL, NULL, 1477147125, 1477147125),
('moderator', 1, 'Moderator', NULL, NULL, 1477147125, 1477147125),
('rbacManage', 2, 'Management RBAC structure', NULL, NULL, 1477147125, 1477147125),
('userCreate', 2, 'Creating users', NULL, NULL, 1477147125, 1477147125),
('userDelete', 2, 'Deleting users', NULL, NULL, 1477147125, 1477147125),
('userManage', 2, 'Browse list of users', NULL, NULL, 1477147125, 1477147125),
('userPermissions', 2, 'User rights management', NULL, NULL, 1477147125, 1477147125),
('userUpdate', 2, 'Editing users', NULL, NULL, 1477147125, 1477147125),
('userUpdateNoElderRank', 2, 'Editing users with equal or lower rank', 'noElderRank', NULL, 1477147125, 1477147125),
('userView', 2, 'Viewing user information', NULL, NULL, 1477147125, 1477147125);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('administrator', 'groupCreate'),
('administrator', 'groupDelete'),
('administrator', 'groupManage'),
('administrator', 'groupPermissions'),
('administrator', 'groupUpdate'),
('administrator', 'groupView'),
('administrator', 'moderator'),
('administrator', 'rbacManage'),
('administrator', 'userCreate'),
('administrator', 'userDelete'),
('administrator', 'userPermissions'),
('administrator', 'userUpdate'),
('moderator', 'groupManage'),
('moderator', 'groupView'),
('moderator', 'userManage'),
('moderator', 'userUpdateNoElderRank'),
('moderator', 'userView'),
('userUpdateNoElderRank', 'userUpdate');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_rule`
--

INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('noElderRank', 'O:34:"budyaga\\users\\rbac\\NoElderRankRule":3:{s:4:"name";s:11:"noElderRank";s:9:"createdAt";N;s:9:"updatedAt";i:1431880756;}', 1477147125, 1477147125);

-- --------------------------------------------------------

--
-- Структура таблицы `group`
--

CREATE TABLE `group` (
  `id` int(11) UNSIGNED NOT NULL,
  `groupname` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `group`
--

INSERT INTO `group` (`id`, `groupname`) VALUES
(1, 'ИТ отдел'),
(2, 'Администрация'),
(3, 'Тестеры');

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1477147098),
('m130524_201442_init', 1477147125);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` smallint(6) NOT NULL DEFAULT '1',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `email`, `photo`, `sex`, `status`, `group_id`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '2RLQkBuZlDiFz3t5zRPnwsjo93f8YYaP', '$2y$13$2rD03bmL6qtbvLxm0dq7mOlQQgEspCXaHdU.n.Ny/wpqHKnJEo8JW', 'administrator@example.com', NULL, 1, 2, 1, 1477147125, 1477147125),
(2, 'Moderator', 'y_1e9WuisgHVbyJT5yCPTzT2zzge3buT', '$2y$13$76v6wU3QilQbV1Os8zmHxOl0BSpDcyC/3YzF4Utl//jQp.eChy3SC', 'moderator@example.com', NULL, 1, 2, 1, 1477147125, 1477147125),
(3, 'serge', '', '', 'cat_of_march@ngs.ru', '', 1, 1, 2, 1477266984, 1477267158),
(4, 'sdfsfsf', '', '', 'sdfsdfsd@dfadas.ru', '', 1, 1, 3, 1477305946, 1477305946),
(22, 'sdfsfsfaefda', '', '', 'asfASF@skjhfsj.ru', '', 1, 1, 3, 1477346067, 1477346067),
(23, 'dfghdfg', '', '', 'dfgd@jskdfsj.com', '', 1, 1, 2, 1477346140, 1477346191),
(24, 'hdssfhg', '', '', 'sdgdfg@jkdhf.ru', '', 1, 1, 3, 1477346220, 1477346220),
(25, 'tyujdtrudrttywsyt', '', '', 'sdrtgd@jskdfsj.ru', '', 1, 1, 2, 1477346246, 1477346256);

-- --------------------------------------------------------

--
-- Структура таблицы `user_email_confirm_token`
--

CREATE TABLE `user_email_confirm_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `old_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_email_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_email_confirm` smallint(6) DEFAULT '0',
  `new_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `new_email_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `new_email_confirm` smallint(6) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user_oauth_key`
--

CREATE TABLE `user_oauth_key` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `provider_user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user_password_reset_token`
--

CREATE TABLE `user_password_reset_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `auth_assignment_user_id_fk` (`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `auth_item_rule_name_fk` (`rule_name`),
  ADD KEY `auth_item_type_index` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `auth_item_child_child_fk` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_group` (`group_id`);

--
-- Индексы таблицы `user_email_confirm_token`
--
ALTER TABLE `user_email_confirm_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_email_confirm_token_user_id_fk` (`user_id`);

--
-- Индексы таблицы `user_oauth_key`
--
ALTER TABLE `user_oauth_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_oauth_key_user_id_fk` (`user_id`);

--
-- Индексы таблицы `user_password_reset_token`
--
ALTER TABLE `user_password_reset_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_password_reset_token_user_id_fk` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT для таблицы `user_email_confirm_token`
--
ALTER TABLE `user_email_confirm_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `user_oauth_key`
--
ALTER TABLE `user_oauth_key`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `user_password_reset_token`
--
ALTER TABLE `user_password_reset_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_item_name_fk` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_assignment_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_rule_name_fk` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_child_fk` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_parent_fk` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_email_confirm_token`
--
ALTER TABLE `user_email_confirm_token`
  ADD CONSTRAINT `user_email_confirm_token_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_oauth_key`
--
ALTER TABLE `user_oauth_key`
  ADD CONSTRAINT `user_oauth_key_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_password_reset_token`
--
ALTER TABLE `user_password_reset_token`
  ADD CONSTRAINT `user_password_reset_token_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
