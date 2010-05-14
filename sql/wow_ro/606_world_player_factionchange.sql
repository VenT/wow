SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `player_changefaction_reputations`
-- ----------------------------
DROP TABLE IF EXISTS `player_changefaction_reputations`;
CREATE TABLE `player_changefaction_reputations` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_changefaction_reputations
-- ----------------------------

-- ----------------------------
-- Table structure for `player_changefaction_spells`
-- ----------------------------
DROP TABLE IF EXISTS `player_changefaction_spells`;
CREATE TABLE `player_changefaction_spells` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_changefaction_spells
-- ----------------------------

-- ----------------------------
-- Table structure for `player_changefaction_items`
-- ----------------------------
DROP TABLE IF EXISTS `player_changefaction_items`;
CREATE TABLE `player_changefaction_items` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_changefaction_items
-- ----------------------------

-- ----------------------------
-- Table structure for `player_changefaction_achievements`
-- ----------------------------
DROP TABLE IF EXISTS `player_changefaction_achievements`;
CREATE TABLE `player_changefaction_achievements` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_changefaction_achievements
-- ----------------------------

