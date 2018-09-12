CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `login` varchar(255) NOT NULL UNIQUE,
  `password_hash` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `created_at` datetime NOT NULL,
  `user_id` int,
  `login` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `succeeded` tinyint NOT NULL
) DEFAULT CHARSET=utf8;

create index user_id_id on login_log (user_id, id);
create index ip_id on login_log (ip, id);

create table if not exists `ip_failed` (
  `ip` varchar(255) NOT NULL PRIMARY KEY,
  `count` bigint NOT NULL
);

create table if not exists `user_failed` (
  `id` int NOT NULL PRIMARY KEY,
  `count` bigint NOT NULL,
  FOREIGN KEY (id) REFERENCES users(id)
);
