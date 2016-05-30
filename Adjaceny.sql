CREATE TABLE  `topic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE  `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE  `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(2048) NULL,
  `parent_id` INT NULL,
  `topic_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_comment_idx` (`parent_id` ASC),
  INDEX `fk_comment_topic_idx` (`topic_id` ASC),
  INDEX `fk_comment_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_comment_comment`
    FOREIGN KEY (`parent_id`)
    REFERENCES `comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_author1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `topic` (`id`, `title`) VALUES (1, '话题：瑞士男子自称“想被吃”杀人犯带句子调料上门');

INSERT INTO `user` (`id`, `name`) VALUES (1, '赵一');
INSERT INTO `user` (`id`, `name`) VALUES (2, '钱二');
INSERT INTO `user` (`id`, `name`) VALUES (3, '孙三');
INSERT INTO `user` (`id`, `name`) VALUES (4, '李四');
INSERT INTO `user` (`id`, `name`) VALUES (5, '周五');
INSERT INTO `user` (`id`, `name`) VALUES (6, '武六');
INSERT INTO `user` (`id`, `name`) VALUES (7, '郑七');
INSERT INTO `user` (`id`, `name`) VALUES (8, '王八');

INSERT INTO `comment` (`id`, `value`, `parent_id`, `topic_id`, `user_id`) VALUES (1, '(1)请问大神，人肉怎么烹饪最好吃？加哪些佐料最好吃？', NULL, 1, 1);
INSERT INTO `comment` (`id`, `value`, `parent_id`, `topic_id`, `user_id`) VALUES (2, '(2)年纪大的肉有点酸，年轻的肉比较嫩，吃的时候最好不要有伤口，放血的肉就没有甜味，不好吃，闷死是最好的方法，不会破坏肉质。最好的部位应该是大腿，那里的肉比较有口感，不肥不瘦刚刚好。好了不说了，该上刑场了！', 1, 1, 2);
INSERT INTO `comment` (`id`, `value`, `parent_id`, `topic_id`, `user_id`) VALUES (3, '(3)酸的话其实可以考虑放点酱油.', 2, 1, 3);
INSERT INTO `comment` (`id`, `value`, `parent_id`, `topic_id`, `user_id`) VALUES (4, '(4)莆田餐馆，你值得拥有。', 1, 1, 4);
INSERT INTO `comment` (`id`, `value`, `parent_id`, `topic_id`, `user_id`) VALUES (5, '(5)莆你蚂', 4, 1, 5);
INSERT INTO `comment` (`id`, `value`, `parent_id`, `topic_id`, `user_id`) VALUES (6, '(6)穷屌丝一边去！下面有请来自广东的易友谈谈吃法！', 4, 1, 6);
INSERT INTO `comment` (`id`, `value`, `parent_id`, `topic_id`, `user_id`) VALUES (7, '(7)二楼得罪人了，你摊上大事儿了！', 5, 1, 7);
INSERT INTO `comment` (`id`, `value`, `parent_id`, `topic_id`, `user_id`) VALUES (8, '(8)丢雷老谋', 6, 1, 8);
INSERT INTO `comment` (`id`, `value`, `parent_id`, `topic_id`, `user_id`) VALUES (9, '(9)自己约的食人魔，含泪也要被吃掉啊！', 8, 1, 6);
