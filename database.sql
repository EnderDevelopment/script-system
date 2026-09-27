CREATE TABLE IF NOT EXISTS `script_system` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `player_id` int(11) NOT NULL,
    `script_data` text NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `script_system` (`player_id`, `script_data`) VALUES
(1, 'Default script data');