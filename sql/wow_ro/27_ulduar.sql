DELETE FROM `script_texts` WHERE `entry` BETWEEN -1603999 AND -1603000;
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
-- Algalon
(32871,-1603000,'Your actions are illogical. All possible results for this encounter have been calculated. The Pantheon will receive the Observer''s message regardless of outcome.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15386,1,0,0,'algalon SAY_AGGRO'),
(32871,-1603001,'Loss of life, unavoidable.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15387,1,0,0,'algalon SAY_SLAY_1'),
(32871,-1603002,'I do what I must.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15388,1,0,0,'algalon SAY_SLAY_2'),
(32871,-1603003,'See your world through my eyes: A universe so vast as to be immeasurable - incomprehensible even to your greatest minds.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15390,1,0,0,'algalon SAY_ENGADED_FOR_FIRTS_TIME'),
(32871,-1603004,'Beware!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15391,1,0,0,'algalon SAY_PHASE_2'),
(32871,-1603005,'The stars come to my aid.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15392,1,0,0,'algalon SAY_SUMMON_COLLAPSING_STAR'),
(32871,-1603006,'I have seen worlds bathed in the Makers'' flames. Their denizens fading without so much as a whimper. Entire planetary systems born and raised in the time that it takes your mortal hearts to beat once. Yet all throughout, my own heart, devoid of emotion... of empathy. I... have... felt... NOTHING! A million, million lives wasted. Had they all held within them your tenacity? Had they all loved life as you do?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15393,1,0,0,'algalon SAY_DEATH_1'),
(32871,-1603007,'Perhaps it is your imperfection that which grants you free will. That allows you to persevere against cosmically calculated odds. You prevailed where the Titans'' own perfect creations have failed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15401,1,0,0,'algalon SAY_DEATH_2'),
(32871,-1603008,'I''ve rearranged the reply code. Your planet will be spared. I cannot be certain of my own calculations anymore.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15402,1,0,0,'algalon SAY_DEATH_3'),
(32871,-1603009,'I lack the strength to transmit the signal. You must hurry. Find a place of power close to the skies.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15403,1,0,0,'algalon SAY_DEATH_4'),
(32871,-1603010,'Do not worry about my fate $N. If the signal is not transmitted in time re-origination will proceed regardless. Save. Your. World.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15404,1,0,0,'algalon SAY_DEATH_5'),
(32871,-1603011,'You are... out of time.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15394,1,0,0,'algalon SAY_BERSERK'),
(32871,-1603012,'Witness the fury of cosmos!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15396,1,0,0,'algalon SAY_BIGBANG_1'),
(32871,-1603013,'Behold the tools of creation!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15397,1,0,0,'algalon SAY_BIGBANG_2'),
(32871,-1603014,'Analysis complete. There is partial corruption in the planet''s life-support systems as well as complete corruption in most of the planet''s defense mechanisms.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15398,1,0,0,'algalon SAY_TIMER_1'),
(32871,-1603015,'Begin uplink: Reply Code: ''Omega''. Planetary re-origination requested.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15399,1,0,0,'algalon SAY_TIMER_2'),
(32871,-1603016,'Farewell, mortals. Your bravery is admirable, for such flawed creatures.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15400,1,0,0,'algalon SAY_TIMER_3'),
(32871,-1603017,'Trans-location complete. Commencing planetary analysis of Azeroth.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15405,1,0,0,'algalon SAY_SUMMON_1'),
(32871,-1603018,'Stand back, mortals. I am not here to fight you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15406,1,0,0,'algalon SAY_SUMMON_2'),
(32871,-1603019,'It is in the universe''s best interest to re-originate this planet should my analysis find systemic corruption. Do not interfere.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15407,1,0,0,'algalon SAY_SUMMON_3'),

-- Assembly of Iron - Stellbreaker
(32867,-1603020,'You will not defeat the Assembly of Iron so easily, invaders!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15674,1,0,0,'steelbreaker SAY_AGGRO'),
(32867,-1603021,'So fragile and weak!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15675,1,0,0,'steelbreaker SAY_SLAY_1'),
(32867,-1603022,'Flesh... such a hindrance.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15676,1,0,0,'steelbreaker SAY_SLAY_2'),
(32867,-1603023,'You seek the secrets of Ulduar? Then take them!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15677,1,0,0,'steelbreaker SAY_POWER'),
(32867,-1603024,'My death only serves to hasten your demise.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15678,1,0,0,'steelbreaker SAY_DEATH_1'),
(32867,-1603025,'Impossible!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15679,1,0,0,'steelbreaker SAY_DEATH_2'),
(32867,-1603026,'This meeting of the Assembly of Iron is adjourned!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15680,1,0,0,'steelbreaker SAY_BERSERK'),

-- Assembly of Iron - Runemaster Molgeim
(32927,-1603030,'Nothing short of total decimation will suffice.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15657,1,0,0,'Molgeim SAY_AGGRO'),
(32927,-1603031,'The world suffers yet another insignificant loss.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15658,1,0,0,'Molgeim SAY_SLAY_1'),
(32927,-1603032,'Death is the price of your arrogance.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15659,1,0,0,'Molgeim SAY_SLAY_2'),
(32927,-1603033,'Decipher this!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15660,1,0,0,'Molgeim SAY_RUNE_DEATH'),
(32927,-1603034,'Face the lightning surge!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15661,1,0,0,'Molgeim SAY_SUMMON'),
(32927,-1603035,'The legacy of storms shall not be undone.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15662,1,0,0,'Molgeim SAY_DEATH_1'),
(32927,-1603036,'What have you gained from my defeat? You are no less doomed, mortals!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15663,1,0,0,'Molgeim SAY_DEATH_2'),
(32927,-1603037,'This meeting of the Assembly of Iron is adjourned!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15664,1,0,0,'Molgeim SAY_BERSERK'),

-- Assembly of Iron - Stormcaller Brundir
(32857,-1603040,'Whether the world''s greatest gnats or the world''s greatest heroes, you''re still only mortal!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15684,1,0,0,'Brundir SAY_AGGRO'),
(32857,-1603041,'A merciful kill!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15685,1,0,0,'Brundir SAY_SLAY_1'),
(32857,-1603042,'HAH!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15686,1,0,0,'Brundir SAY_SLAY_2'),
(32857,-1603043,'Stand still and stare into the light!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15687,1,0,0,'Brundir SAY_SPECIAL'),
(32857,-1603044,'Let the storm clouds rise and rain down death from above!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15688,1,0,0,'Brundir SAY_FLIGHT'),
(32857,-1603045,'The power of the storm lives on...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15689,1,0,0,'Brundir SAY_DEATH_1'),
(32857,-1603046,'You rush headlong into the maw of madness!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15690,1,0,0,'Brundir SAY_DEATH_2'),
(32857,-1603047,'This meeting of the Assembly of Iron is adjourned!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15691,1,0,0,'Brundir SAY_BERSERK'),

-- Auriaya
(33515,-1603050,'Some things are better left alone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15473,1,0,0,'Auriaya SAY_AGGRO'),
(33515,-1603051,'The secret dies with you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15474,1,0,0,'Auriaya SAY_SLAY_1'),
(33515,-1603052,'There is no escape!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15475,1,0,0,'Auriaya SAY_SLAY_2'),
(33515,-1603053,'Auriaya screams in agony.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,6,0,15476,'Auriaya SAY_DEATH'),
(33515,-1603054,'You waste my time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15477,1,0,0,'Auriaya SAY_BERSERK'),

-- Flame Leviathan
(33113,-1603060,'Hostile entities detected. Threat assessment protocol active. Primary target engaged. Time minus thirty seconds to re-evaluation.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15506,1,0,0,'Flame Leviathan SAY_AGGRO'),
(33113,-1603061,'Threat assessment routine modified. Current target threat level: zero. Acquiring new target.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15521,1,0,0,'Flame Leviathan SAY_SLAY'),
(33113,-1603062,'Total systems failure. Defense protocols breached. Leviathan Unit shutting down.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15520,1,0,0,'Flame Leviathan SAY_DEATH'),
(33113,-1603063,'Threat re-evaluated. Target assessment complete. Changing course.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15507,1,0,0,'Flame Leviathan SAY_TARGET_1'),
(33113,-1603064,'Pursuit objective modified. Changing course.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15508,1,0,0,'Flame Leviathan SAY_TARGET_2'),
(33113,-1603065,'Hostile entity stratagem predicted. Rerouting battle function. Changing course.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15509,1,0,0,'Flame Leviathan SAY_TARGET_3'),
(33113,-1603066,'Orbital countermeasures enabled.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15510,1,0,0,'Flame Leviathan SAY_HARDMODE'),
(33113,-1603067,'Alert! Static defense system failure. Orbital countermeasures disabled.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15511,1,0,0,'Flame Leviathan SAY_TOWER_NONE'),
(33113,-1603068,'''Hodir''s Fury'' online. Acquiring target.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15512,1,0,0,'Flame Leviathan SAY_TOWER_FROST'),
(33113,-1603069,'''Mimiron''s Inferno'' online. Acquiring target.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15513,1,0,0,'Flame Leviathan SAY_TOWER_FLAME'),
(33113,-1603070,'''Freya''s Ward'' online. Acquiring target.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15514,1,0,0,'Flame Leviathan SAY_TOWER_NATURE'),
(33113,-1603071,'''Thorim''s Hammer'' online. Acquiring target.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15515,1,0,0,'Flame Leviathan SAY_TOWER_STORM'),
(33113,-1603072,'Unauthorized entity attempting circuit overload. Activating anti-personnel countermeasures.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15516,1,0,0,'Flame Leviathan SAY_PLAYER_RIDING'),
(33113,-1603073,'System malfunction. Diverting power to support systems.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15517,1,0,0,'Flame Leviathan SAY_OVERLOAD_1'),
(33113,-1603074,'Combat matrix overload. Powering do-o-o-own...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15518,1,0,0,'Flame Leviathan SAY_OVERLOAD_2'),
(33113,-1603075,'System restart required. Deactivating weapon systems.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15519,1,0,0,'Flame Leviathan SAY_OVERLOAD_3'),
-- reserve 1603076-1603179 to implement other texts related to flame leviathan encounter

-- Freya
(32906,-1603180,'The Conservatory must be protected!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15526,1,0,0,'Freya SAY_AGGRO'),
(32906,-1603181,'Elders, grant me your strength!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15527,1,0,0,'Freya SAY_AGGRO_WITH_ELDER'),
(32906,-1603182,'Forgive me.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15529,1,0,0,'Freya SAY_SLAY_1'),
(32906,-1603183,'From your death springs life anew!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15530,1,0,0,'Freya SAY_SLAY_2'),
(32906,-1603184,'His hold on me dissipates. I can see clearly once more. Thank you, heroes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15531,1,0,0,'Freya SAY_DEATH'),
(32906,-1603185,'You have strayed too far, wasted too much time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15532,1,0,0,'Freya SAY_BERSERK'),
(32906,-1603186,'Eonar, your servant requires aid!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15528,1,0,0,'Freya SAY_SUMMON_CONSERVATOR'),
(32906,-1603187,'Children, assist me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15331,1,0,0,'Freya SAY_SUMMON_TRIO'),
(32906,-1603188,'The swarm of the elements shall overtake you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15534,1,0,0,'Freya SAY_SUMMON_LASHERS'),
(32906,-1603189,'Eonar, your servant calls for your blessing!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15535,1,0,0,'Freya SAY_YS_HELP'),

-- Elder Brightleaf
(32915,-1603190,'Matron, the Conservatory has been breached!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15483,1,0,0,'Elder Brightleaf SAY_AGGRO'),
(32915,-1603191,'Fertilizer.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15485,1,0,0,'Elder Brightleaf SAY_SLAY_1'),
(32915,-1603192,'Your corpse will nourish the soil!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15486,1,0,0,'Elder Brightleaf SAY_SLAY_2'),
(32915,-1603193,'Matron, one has fallen!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15487,1,0,0,'Elder Brightleaf SAY_DEATH'),

-- Elder Ironbranch
(32913,-1603194,'Mortals have no place here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15493,1,0,0,'Elder Ironbranch SAY_AGGRO'),
(32913,-1603195,'I return you whence you came!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15494,1,0,0,'Elder Ironbranch SAY_SLAY_1'),
(32913,-1603196,'BEGONE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15495,1,0,0,'Elder Ironbranch SAY_SLAY_2'),
(32913,-1603197,'Freya! They come for you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15496,1,0,0,'Elder Ironbranch SAY_DEATH'),

-- Elder Stonebark
(32914,-1603198,'This place will serve as your graveyard.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15500,1,0,0,'Elder Stonebark SAY_AGGRO'),
(32914,-1603199,'<Angry roar>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15501,1,0,0,'Elder Stonebark SAY_SLAY_1'),
(32914,-1603200,'Such a waste.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15502,1,0,0,'Elder Stonebark SAY_SLAY_2'),
(32914,-1603201,'Matron, flee! They are ruthless....',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15503,1,0,0,'Elder Stonebark SAY_DEATH'),

-- Hodir
(32845,-1603210,'You will suffer for this trespass!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15552,1,0,0,'Hodir SAY_AGGRO'),
(32845,-1603211,'Tragic. To come so far, only to fail.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15553,1,0,0,'Hodir SAY_SLAY_1'),
(32845,-1603212,'Welcome to the endless winter.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15554,1,0,0,'Hodir SAY_SLAY_2'),
(32845,-1603213,'Winds of the north consume you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15555,1,0,0,'Hodir SAY_FLASH_FREEZE'),
(32845,-1603214,'Hodir roars furious.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15556,6,0,0,'Hodir SAY_STALACTITE'),
(32845,-1603215,'I... I am released from his grasp... at last.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15557,1,0,0,'Hodir SAY_DEATH'),
(32845,-1603216,'Enough! This ends now!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15558,1,0,0,'Hodir SAY_BERSERK'),
(32845,-1603217,'The veil of winter will protect you, champions!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15559,1,0,0,'Hodir SAY_YS_HELP'),
(32845,-1603218,'Hodir shatters the Rare Cache of Hodir!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,6,0,0,'Hodir SAY_HARD_MODE_MISSED'),

-- Ignis
(33118,-1603220,'Insolent whelps! Your blood will temper the weapons used to reclaim this world!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15564,1,0,0,'Ignis SAY_AGGRO'),
(33118,-1603221,'More scraps for the scrapheap!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15569,1,0,0,'Ignis SAY_SLAY_1'),
(33118,-1603222,'Your bones will serve as kindling!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15570,1,0,0,'Ignis SAY_SLAY_2'),
(33118,-1603223,'I. Have. Failed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15572,1,0,0,'Ignis SAY_DEATH'),
(33118,-1603224,'Arise, soldiers of the Iron Crucible! The Makers'' will be done!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15565,1,0,0,'Ignis SAY_SUMMON'),
(33118,-1603225,'I will burn away your impurities!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15566,1,0,0,'Ignis SAY_SLAG_POT'),
(33118,-1603226,'Let the inferno consume you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15567,1,0,0,'Ignis SAY_SCORCH_1'),
(33118,-1603227,'BURN! Burn in the makers fire!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15568,1,0,0,'Ignis SAY_SCORCH_2'),
(33118,-1603228,'Let it be finished!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15571,1,0,0,'Ignis SAY_BERSERK'),

-- Kologarn
(32930,-1603230,'None shall pass!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15586,1,0,0,'Kologarn SAY_AGGRO'),
(32930,-1603231,'KOL-THARISH!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15587,1,0,0,'Kologarn SAY_SLAY_1'),
(32930,-1603232,'YOU FAIL!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15588,1,0,0,'Kologarn SAY_SLAY_2'),
(32930,-1603233,'Just a scratch!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15589,1,0,0,'Kologarn SAY_LEFT_ARM_GONE'),
(32930,-1603234,'Only a flesh wound!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15590,1,0,0,'Kologarn SAY_RIGHT_ARM_GONE'),
(32930,-1603235,'OBLIVION!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15591,1,0,0,'Kologarn SAY_SHOCKWAVE'),
(32930,-1603236,'I will squeeze the life from you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15592,1,0,0,'Kologarn SAY_GRAB_PLAYER'),
(32930,-1603237,'Master, they come...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15593,1,0,0,'Kologarn SAY_DEATH'),
(32930,-1603238,'I am invincible!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15594,1,0,0,'Kologarn SAY_BERSERK'),

-- Mimiron
(33350,-1603240,'Oh, my! I wasn''t expecting company! The workshop is such a mess! How embarrassing!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15611,1,0,0,'Mimiron SAY_AGGRO'),
(33350,-1603241,'Now why would you go and do something like that? Didn''t you see the sign that said ''DO NOT PUSH THIS BUTTON!''? How will we finish testing with the self-destruct mechanism active?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15629,1,0,0,'Mimiron SAY_HARDMODE_ON'),
(33350,-1603242,'We haven''t much time, friends! You''re going to help me test out my latest and greatest creation. Now, before you change your minds, remember, that you kind of owe it to me after the mess you made with the XT-002.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15612,1,0,0,'Mimiron SAY_MKII_ACTIVATE'),
(33350,-1603243,'MEDIC!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15613,1,0,0,'Mimiron SAY_MKII_SLAY_1'),
(33350,-1603244,'I can fix that... or, maybe not! Sheesh, what a mess...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15614,1,0,0,'Mimiron SAY_MKII_SLAY_2'),
(33350,-1603245,'WONDERFUL! Positively marvelous results! Hull integrity at 98.9 percent! Barely a dent! Moving right along.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15615,1,0,0,'Mimiron SAY_MKII_DEATH'),
(33350,-1603246,'Behold the VX-001 Anti-personnel Assault Cannon! You might want to take cover.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15616,1,0,0,'Mimiron SAY_VX001_ACTIVATE'),
(33350,-1603247,'Fascinating. I think they call that a "clean kill".',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15617,1,0,0,'Mimiron SAY_VX001_SLAY_1'),
(33350,-1603248,'Note to self: Cannon highly effective against flesh.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15618,1,0,0,'Mimiron SAY_VX001_SLAY_2'),
(33350,-1603249,'Thank you, friends! Your efforts have yielded some fantastic data! Now, where did I put-- oh, there it is!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15619,1,0,0,'Mimiron SAY_VX001_DEATH'),
(33350,-1603250,'Isn''t it beautiful? I call it the magnificent aerial command unit!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15620,1,0,0,'Mimiron SAY_AERIAL_ACTIVATE'),
(33350,-1603251,'Outplayed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15621,1,0,0,'Mimiron SAY_AERIAL_SLAY_1'),
(33350,-1603252,'You can do better than that!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15622,1,0,0,'Mimiron SAY_AERIAL_SLAY_2'),
(33350,-1603253,'Preliminary testing phase complete. Now comes the true test!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15623,1,0,0,'Mimiron SAY_AERIAL_DEATH'),
(33350,-1603254,'Gaze upon its magnificence! Bask in its glorious, um, glory! I present you... V-07-TR-0N!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15624,1,0,0,'Mimiron SAY_V07TRON_ACTIVATE'),
(33350,-1603255,'Prognosis: Negative!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15625,1,0,0,'Mimiron SAY_V07TRON_SLAY_1'),
(33350,-1603256,'You''re not going to get up from that one, friend.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15626,1,0,0,'Mimiron SAY_V07TRON_SLAY_2'),
(33350,-1603257,'It would appear that I''ve made a slight miscalculation. I allowed my mind to be corrupted by the fiend  in the prison, overriding my primary directive. All systems seem to be functional now. Clear.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15627,1,0,0,'Mimiron SAY_V07TRON_DEATH'),
(33350,-1603258,'Oh, my! It would seem that we are out of time, my friends!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15628,1,0,0,'Mimiron SAY_BERSERK'),
(33350,-1603259,'Combat matrix enhanced. Behold wonderous rapidity!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15630,1,0,0,'Mimiron SAY_YS_HELP'),

-- Razorscale encounter
(33210,-1603260,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15647,1,0,0,'Exp. Commander SAY_INTRO'),
(33210,-1603261,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15648,1,0,0,'Exp. Commander SAY_GROUND'),

-- Thorim
(33413,-1603270,'Interlopers! You mortals who dare to interfere with my sport will pay... Wait--you...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15733,1,0,0,'Thorim SAY_AGGRO_1'),
(33413,-1603271,'I remember you... In the mountains... But you... what is this? Where am--',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15734,1,0,0,'Thorim SAY_AGGRO_2'),
(33413,-1603272,'Behold the power of the storms and despair!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15735,1,0,0,'Thorim SAY_SPECIAL_1'),
(33413,-1603273,'Do not hold back! Destroy them!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15736,1,0,0,'Thorim SAY_SPECIAL_2'),
(33413,-1603274,'Have you begun to regret your intrusion?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15737,1,0,0,'Thorim SAY_SPECIAL_3'),
(33413,-1603275,'Impertinent whelps! You dare challenge me atop my pedestal! I will crush you myself!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15738,1,0,0,'Thorim SAY_JUMPDOWN'),
(33413,-1603276,'Can''t you at least put up a fight!?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15739,1,0,0,'Thorim SAY_SLAY_1'),
(33413,-1603277,'Pathetic!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15740,1,0,0,'Thorim SAY_SLAY_2'),
(33413,-1603278,'My patience has reached its limit!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15741,1,0,0,'Thorim SAY_BERSERK'),
(33413,-1603279,'Failures! Weaklings!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15742,1,0,0,'Thorim SAY_WIPE'),
(33413,-1603280,'Stay your arms! I yield!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15743,1,0,0,'Thorim SAY_DEATH'),
(33413,-1603281,'I feel as though I am awakening from a nightmare, but the shadows in this place yet linger.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15744,1,0,0,'Thorim SAY_END_NORMAL_1'),
(33413,-1603282,'Sif... was Sif here? Impossible--she died by my brother''s hand. A dark nightmare indeed....',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15745,1,0,0,'Thorim SAY_END_NORMAL_2'),
(33413,-1603283,'I need time to reflect.... I will aid your cause if you should require it. I owe you at least that much. Farewell.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15746,1,0,0,'Thorim SAY_END_NORMAL_3'),
(33413,-1603284,'You! Fiend! You are not my beloved! Be gone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15747,1,0,0,'Thorim SAY_END_HARD_1'),
(33413,-1603285,'Behold the hand behind all the evil that has befallen Ulduar! Left my kingdom in ruins, corrupted my brother and slain my wife!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15748,1,0,0,'Thorim SAY_END_HARD_2'),
(33413,-1603286,'And now it falls to you, champions, to avenge us all! The task before you is great, but I will lend you my aid as I am able. You must prevail!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15749,1,0,0,'Thorim SAY_END_HARD_3'),
(33413,-1603287,'Golganneth, lend me your strengh! Grant my mortal allies the power of thunder!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15750,1,0,0,'Thorim SAY_YS_HELP'),

-- General Vezax
(33271,-1603290,'Your destruction will herald a new age of suffering!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15542,1,0,0,'Vezax SAY_AGGRO'),
(33271,-1603291,'You thought to stand before the legions of death... and survive?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15543,1,0,0,'Vezax SAY_SLAY_1'),
(33271,-1603292,'Defiance... a flaw of mortality.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15544,1,0,0,'Vezax SAY_SLAY_2'),
(33271,-1603293,'The black blood of Yogg-Saron courses through me! I. AM. UNSTOPPABLE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15545,1,0,0,'Vezax SAY_SURGE_DARKNESS'),
(33271,-1603294,'Oh, what horrors await....',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15546,1,0,0,'Vezax SAY_DEATH'),
(33271,-1603295,'Your defeat was inevitable!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15547,1,0,0,'Vezax SAY_BERSERK'),
(33271,-1603296,'Behold, now! Terror, absolute!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15548,1,0,0,'Vezax SAY_HARDMODE_ON'),

-- XT002
(33293,-1603300,'New toys? For me? I promise I won''t break them this time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15724,1,0,0,'XT002 SAY_AGGRO'),
(33293,-1603301,'So tired. I will rest for just a moment!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15725,1,0,0,'XT002 SAY_HEART_OPENED'),
(33293,-1603302,'I''m ready to play!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15726,1,0,0,'XT002 SAY_HEART_CLOSED'),
(33293,-1603303,'NO! NO! NO! NO! NO!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15727,1,0,0,'XT002 SAY_TYMPANIC_TANTRUM'),
(33293,-1603304,'I... I think I broke it.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15728,1,0,0,'XT002 SAY_SLAY_1'),
(33293,-1603305,'I guess it doesn''t bend that way.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15729,1,0,0,'XT002 SAY_SLAY_2'),
(33293,-1603306,'I''m tired of these toys. I don''t want to play anymore!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15730,1,0,0,'XT002 SAY_BERSERK'),
(33293,-1603307,'You are bad... Toys... Very... Baaaaad!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15731,1,0,0,'XT002 SAY_DEATH'),
(33293,-1603308,'Time for a new game! My old toys will fight my new toys!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15732,1,0,0,'XT002 SAY_SUMMON'),

-- Sara (YS)
(33134,-1603310,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15771,1,0,0,'Sara SAY_PREFIGHT_1'),
(33134,-1603311,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15772,1,0,0,'Sara SAY_PREFIGHT_2'),
(33134,-1603312,'The time to strike at the head of the beast will soon be upon us! Focus your anger and hatred on his minions!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15775,1,0,0,'Sara SAY_AGGRO_1'),
(33134,-1603313,'Yes! YES! Show them no mercy! Give no pause to your attacks!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15773,1,0,0,'Sara SAY_AGGRO_2'),
(33134,-1603314,'Let hatred and rage guide your blows!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15774,1,0,0,'Sara SAY_AGGRO_3'),
(33134,-1603315,'Powerless to act...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15778,1,0,0,'Sara SAY_SLAY_1'),
(33134,-1603316,'Could they have been saved?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15779,1,0,0,'Sara SAY_SLAY_2'),
(33134,-1603317,'Weak-minded fools!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15780,5,0,0,'Sara WHISP_INSANITY'),
(33134,-1603318,'Suffocate upon your own hate!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15776,1,0,0,'Sara SAY_PHASE2_1'),
(33134,-1603319,'Tremble, mortals, before the coming of the end!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15777,1,0,0,'Sara SAY_PHASE2_2'),

-- YoggSaron
(33288,-1603330,'I am the lucid dream.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15754,1,0,0,'YoggSaron SAY_PHASE2_1'), -- sound 15754 contains the 5 texts
(33288,-1603331,'The monster in your nightmares.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'YoggSaron SAY_PHASE2_2'),
(33288,-1603332,'The fiend of a thousand faces.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'YoggSaron SAY_PHASE2_3'),
(33288,-1603333,'Cower before my true form.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'YoggSaron SAY_PHASE2_4'),
(33288,-1603334,'BOW DOWN BEFORE THE GOD OF DEATH!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'YoggSaron SAY_PHASE2_5'),
(33288,-1603335,'Look upon the true face of death and know that your end comes soon!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15755,1,0,0,'YoggSaron SAY_PHASE3'),
(33288,-1603336,'MADNESS WILL CONSUME YOU!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15756,1,0,0,'YoggSaron SAY_VISION'),
(33288,-1603337,'Hoohehehahahaha... AHAHAHAHAHAHA!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15757,1,0,0,'YoggSaron SAY_SLAY_1'),
(33288,-1603338,'Eternal suffering awaits!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15758,1,0,0,'YoggSaron SAY_SLAY_2'),
(33288,-1603339,'Your will is no longer you own...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15759,5,0,0,'YoggSaron WHISP_INSANITY_1'),
(33288,-1603340,'Destroy them minion, your master commands it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15760,5,0,0,'YoggSaron WHISP_INSANITY_2'),
(33288,-1603341,'Your fate is sealed. The end of days is finally upon you and ALL who inhabit this miserable little seedling. Uulwi ifis halahs gag erh''ongg w''ssh.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15761,1,0,0,'YoggSaron SAY_DEATH');

UPDATE `creature_template` SET `ScriptName`='mob_xt002_heart' WHERE `entry`=33329;
UPDATE `creature_template` SET `ScriptName`='mob_scrapbot' WHERE `entry`=33343;
UPDATE `creature_template` SET `ScriptName`='mob_pummeller' WHERE `entry`=33344;
UPDATE `creature_template` SET `ScriptName`='mob_boombot' WHERE `entry`=33346;
UPDATE `creature_template` SET `ScriptName`='mob_void_zone' WHERE `entry`=34001;
UPDATE `creature_template` SET `ScriptName`='mob_life_spark' WHERE `entry`=34004;
UPDATE `creature_template` SET `VehicleId` = 0 WHERE `entry` = 33214;
UPDATE `creature_template` SET `unit_flags` = 393220, `ScriptName` = '' WHERE `entry` = 32938;
UPDATE `creature_template` SET `unit_flags` = 33948166 WHERE `entry` = 33174;

DELETE FROM `creature` WHERE `id` IN (32941, 33333, 33332, 32950, 33331, 32946, 32948, 33330);

UPDATE `creature_template` SET `faction_A` = 1665, `faction_H` = 1665, `unit_flags` = 32768 WHERE `entry` IN (33325, 32901, 33328, 32901, 32893, 33327, 32897, 33326, 32941, 33333, 33332, 32950, 33331, 32946, 32948, 33330);
UPDATE `creature_template` SET `ScriptName` = 'mob_hodir_priest' WHERE `entry` IN (32897, 33326, 32948, 33330);
UPDATE `creature_template` SET `ScriptName` = 'mob_hodir_shaman' WHERE `entry` IN (33328, 32901, 33332, 32950);
UPDATE `creature_template` SET `ScriptName` = 'mob_hodir_druid' WHERE `entry` IN (33325, 32900, 32941, 33333);
UPDATE `creature_template` SET `ScriptName` = 'mob_hodir_mage' WHERE `entry` IN (32893, 33327, 33331, 32946);
UPDATE `creature_template` SET `modelid1` = 15880, `modelid2` = 0, `ScriptName` = 'toasty_fire' WHERE `entry` = 33342;
UPDATE `creature_template` SET `mechanic_immune_mask` = 650854235 WHERE `entry` IN (33113, 33118, 33186, 33293, 32867, 32927, 32930, 33515, 32906, 32845, 33350, 32865, 33271, 33288, 32871);
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299547 WHERE `entry` = 32857;

UPDATE `script_texts` SET `content_default` = "Welcome, champions! All of our attempts at grounding her have failed. We could use a hand in bring her down with these harpoon guns.", `type` = 0  WHERE `entry` = -1603260;
UPDATE `script_texts` SET `content_default` = "Move! Quickly! She won’t remain grounded for long.", `type` = 1  WHERE `entry` = -1603261;
UPDATE `script_texts` SET `type` = 2  WHERE `entry` = -1603053;
UPDATE `script_texts` SET `type` = 2  WHERE `entry` = -1603214;
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (61990, -61990);
INSERT INTO `spell_linked_spell` VALUES 
(61990, 7940, 2, "Hodir Flash Freeze immunity");
-- XT-002
UPDATE `creature_model_info` SET `bounding_radius` = 0.465, `combat_reach` = 10 WHERE `modelid` = 28611;
UPDATE `creature_template` SET `dmg_multiplier` = 70 WHERE `entry` = 33293;
-- Assembly of Iron
UPDATE `creature_model_info` SET `bounding_radius` = 0.45, `combat_reach` = 25 WHERE `modelid` = 28313;
UPDATE `creature_model_info` SET `bounding_radius` = 0.45, `combat_reach` = 6 WHERE `modelid` = 28344;
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299547 WHERE `entry` = 32857;
UPDATE `creature_template` SET `dmg_multiplier` = 60 WHERE `entry` = 32867;
UPDATE `creature_template` SET `dmg_multiplier` = 45 WHERE `entry` = 32927;
-- Kologarn
UPDATE `creature_model_info` SET `bounding_radius` = 0.465, `combat_reach` = 15 WHERE `modelid` = 28638;
UPDATE `creature_model_info` SET `bounding_radius` = 0.35, `combat_reach` = 15 WHERE `modelid` = 28821;
UPDATE `creature_model_info` SET `bounding_radius` = 0.35, `combat_reach` = 15 WHERE `modelid` = 28822;
UPDATE `creature_template` SET `baseattacktime` = 1800 WHERE `entry` = 32930;
-- Auriaya
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 5 WHERE `modelid` = 28651;
UPDATE `creature_template` SET `dmg_multiplier` = 60 WHERE `entry` = 33515;
-- Freya
UPDATE `creature_template` SET `baseattacktime` = 1500 WHERE `entry` = 32906;
-- Mimiron
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 7 WHERE `modelid` = 28831;
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 5 WHERE `modelid` = 28841;
UPDATE `creature_model_info` SET `bounding_radius` = 0.775, `combat_reach` = 4 WHERE `modelid` = 28979;
-- Genaral Vezax
UPDATE `creature_template` SET `baseattacktime` = 1800, `dmg_multiplier` = 45 WHERE `entry` = 33271;
UPDATE `creature_model_info` SET `bounding_radius` = 0.62, `combat_reach` = 12 WHERE `modelid` = 28548;
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id` = 33838;
UPDATE `creature_template` SET `unit_flags` = 0, `type_flags` = 0, `ScriptName` = 'boss_hodir' WHERE `entry` = 32845;

UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0 WHERE `entry` IN (34188, 33632, 33802, 34096, 34098);
UPDATE `creature_template` SET `modelid1` = 25865, `modelid2` = 0, `flags_extra` = 0, `ScriptName` = 'mob_flash_freeze' WHERE `entry` = 32938;
UPDATE `creature_template` SET `modelid1` = 28470, `modelid2` = 0, `ScriptName` = 'mob_icicle' WHERE `entry` = 33169;
UPDATE `creature_template` SET `modelid1` = 28470, `modelid2` = 0, `ScriptName` = 'mob_icicle_snowdrift' WHERE `entry` = 33173;
UPDATE `creature_template` SET `modelid1` = 15880, `modelid2` = 0 WHERE `entry` = 33174;
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 194173;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 61990;
INSERT INTO `spell_linked_spell` VALUES 
(61990, -62457, 2, "Ice Shards Immunity (Hodir)"),
(61990, -65370, 2, "Ice Shards Immunity (Hodir)");

UPDATE `creature_template` SET `unit_flags` = 33817094 WHERE `entry` = 33174;
UPDATE `creature_template` SET `mechanic_immune_mask` = 612581215 WHERE `entry` = 32938;
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` = 32941;
UPDATE `creature_template` SET `unit_flags` = 33686016, `flags_extra` = 2 WHERE `entry` = 30298;

DELETE FROM `creature` WHERE `id` = 32938;
DELETE FROM `creature` WHERE id = 34014;
UPDATE `creature_template` SET `unit_flags` = 0, `type_flags` = 0 WHERE `entry` = 33515;
UPDATE `creature_template` SET `equipment_id` = 2500 WHERE `entry` = 33515;

UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `ScriptName` = 'feral_defender_trigger' WHERE `entry` = 34096;
UPDATE `creature_template` SET `ScriptName` = 'mob_feral_defender' WHERE `entry` = 34035;
UPDATE `creature_template` SET `ScriptName` = 'mob_sanctum_sentry' WHERE `entry` = 34014;
UPDATE `creature_template` SET `ScriptName` = 'seeping_trigger' WHERE `entry` = 34098;

DELETE FROM `creature_equip_template` WHERE entry = 2500;
INSERT INTO `creature_equip_template` VALUES ('2500','45315','0','0');

DELETE FROM `creature_addon` WHERE guid = 137496;
INSERT INTO `creature_addon` VALUES ('137496','1033515','0','0','0','0','0');

DELETE FROM `waypoint_data` WHERE id = 1033515;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_flag`, `action`, `action_chance`, `wpguid`) VALUES
('1033515','1','1968.46','51.75','417.72','0','0','0','100','0'),
('1033515','2','1956.75','49.22','411.35','0','0','0','100','0'),
('1033515','3','1938.90','42.09','411.35','3000','0','0','100','0'),
('1033515','4','1956.75','49.22','411.35','0','0','0','100','0'),
('1033515','5','1968.46','51.75','417.72','0','0','0','100','0'),
('1033515','6','2011.43','44.91','417.72','0','0','0','100','0'),
('1033515','7','2022.65','37.74','411.36','0','0','0','100','0'),
('1033515','8','2046.65','9.61','411.36','0','0','0','100','0'),
('1033515','9','2053.4','-8.65','421.68','0','0','0','100','0'),
('1033515','10','2053.14','-39.8','421.66','0','0','0','100','0'),
('1033515','11','2046.26','-57.96','411.35','0','0','0','100','0'),
('1033515','12','2022.42','-86.39','411.35','0','0','0','100','0'),
('1033515','13','2011.26','-92.95','417.71','0','0','0','100','0'),
('1033515','14','1969.43','-100.02','417.72','0','0','0','100','0'),
('1033515','15','1956.66','-97.4','411.35','0','0','0','100','0'),
('1033515','16','1939.18','-90.90','411.35','3000','0','0','100','0'),
('1033515','17','1956.66','-97.4','411.35','0','0','0','100','0'),
('1033515','18','1969.43','-100.02','417.72','0','0','0','100','0'),
('1033515','19','2011.26','-92.95','417.71','0','0','0','100','0'),
('1033515','20','2022.42','-86.39','411.35','0','0','0','100','0'),
('1033515','21','2046.26','-57.96','411.35','0','0','0','100','0'),
('1033515','22','2053.14','-39.8','421.66','0','0','0','100','0'),
('1033515','23','2053.4','-8.65','421.68','0','0','0','100','0'),
('1033515','24','2046.65','9.61','411.36','0','0','0','100','0'),
('1033515','25','2022.65','37.74','411.36','0','0','0','100','0'),
('1033515','26','2011.43','44.91','417.72','0','0','0','100','0');
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `unit_flags` = 33554434, `ScriptName` = 'mob_iron_construct', `flags_extra` = 0 WHERE `entry` = 33121;

DELETE FROM `creature_template` WHERE `entry` IN (33119);
INSERT INTO `creature_template` VALUES
('33119','0','0','0','0','0','13069','0','0','0','Scorch trigger','','','0','80','80','2','16','16','0','1','1.14286','85','1','0','0','0','0','1','2000','0','1','0','0','0','0','0','0','0','0','0','0','4','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','4','1','1','0','0','0','0','0','0','0','94','1','0','0','0','mob_scorch_ground','11159');

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=33119);
-- Ulduar crash fixes
UPDATE `creature_template` SET `spell1`=62402 WHERE `entry`=33142;
UPDATE `creature_template` SET `spell1`=62402 WHERE `entry`=33139;
UPDATE `creature_template` SET `spell1`=62402 WHERE `entry`=34111;
UPDATE `creature_template` SET `spell1`=62402 WHERE `entry`=34224;

-- Leviathan Torret 33139
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=83,`exp`=2,`unit_class`=1 WHERE `entry`=33139;
-- Leviathan Torret 33142
UPDATE `creature_template` SET `minlevel`=80,`maxlevel`=83,`exp`=2,`unit_class`=1 WHERE `entry`=33142;
UPDATE `creature_template` SET `vehicleId` = 318 WHERE `entry` = 33118;

DELETE FROM gameobject WHERE id = '194905';
INSERT INTO gameobject VALUES 
( 150248, 194905, 603, 1,1,148.011, 53, 410.73, 3.1415, 0, 0, 0.999666, 0.0258449, 300, 0, 1),
( 150249, 194905, 603, 1,1,148.011, 13.09, 410.73, 3.1415, 0, 0, 0.999666, 0.0258449, 300, 0, 1),
( 150250, 194905, 603, 1,1,148.011, -16.9589, 410.73, 3.1415, 0, 0, 0.999998, -0.00203387, 300, 0, 1),
( 150251, 194905, 603, 1,1,148.011, -56.8689, 410.73, 3.1415, 0, 0, 0.999998, -0.00203387, 300, 0, 1),
( 150252, 194905, 603, 1,1,148.011, -86.031, 410.73, 3.1415, 0, 0, 0.999978, 0.00660518, 300, 0, 1),
( 150253, 194905, 603, 1,1,148.011, -125.941, 410.73, 3.1415, 0, 0, 0.999978, 0.00660518, 300, 0, 1);
DELETE FROM `creature_template` WHERE `entry` IN (33115);
INSERT INTO `creature_template` VALUES
('33115','0','0','0','0','0','13069','0','0','0','Leviathan trigger','',NULL,'0','83','83','2','16','16','0','2','2','1','3','0','0','0','0','0','0','0','8','34340934','0','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','62548','0','0','0','0','0','0','0','0','0','1305000','1595000','','0','3','310','30','1','0','0','0','0','0','0','0','169','1','0','617299803','1','flame_leviathan_trigger','0');

DELETE FROM creature WHERE `id` IN (33115, 33060, 33062, 33109);
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES (33115,603,1,1,0,0,-784.969,-135.608,429.774,0.351076,480000,0,0,3458360,279750,0,0);
DELETE FROM `creature_template` WHERE `entry` IN (33240);
DELETE FROM `creature` WHERE `guid` IN (137479, 137480);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES('33240','33240','0','0','0','0','28517','0','0','0','Ulduar Colossus','','','0','80','80','2','1692','1692','0','1.2','1.14286','1','1','422','586','0','642','7.5','2000','0','1','32832','0','0','0','0','0','0','345','509','103','5','524352','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','125','1','1','0','0','0','0','0','0','0','124','1','0','0','0','mob_colossus','11403');

DELETE FROM `creature` WHERE `id`=33113;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33113, 603, 1, 1, 0, 0, 435.89, -8.417, 409.886, 3.12723, 480000, 0, 0, 23009250, 0, 0, 0);

UPDATE `creature_template` SET `unit_flags` = 33685510, `type_flags` = 0 WHERE `entry` = 34286;
UPDATE `creature_template` SET `ScriptName` = 'mob_darkrune_watcher' WHERE `entry` = 33453;
UPDATE `creature_template` SET `ScriptName` = 'mob_darkrune_sentinel' WHERE `entry` = 33846;
UPDATE `creature_template` SET `ScriptName` = 'mob_darkrune_guardian' WHERE `entry` = 33388;
UPDATE `creature_template` SET `ScriptName` = 'mob_devouring_flame' WHERE `entry` = 34188;
UPDATE `creature_template` SET `ScriptName` = 'npc_expedition_commander_ulduar' WHERE `entry` = 33210;
UPDATE `creature_template` SET `ScriptName` = 'mole_machine_trigger' WHERE `entry` = 33282;
UPDATE `creature_template` SET `unit_flags` = 33685506 WHERE `entry` IN (33245,33233);
DELETE FROM `creature` WHERE `id`=33186;
DELETE FROM `creature` WHERE `guid` IN (137582, 136768, 136769, 136055, 136056) OR `id` IN (33632, 33802);
UPDATE `creature_template` SET `unit_flags` = 33685510 WHERE `entry` = 33809;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33661;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `ScriptName` = 'mob_focused_eyebeam' WHERE `entry` IN (33632, 33802);
UPDATE `creature_template` SET `ScriptName` = 'mob_left_arm' WHERE `entry` = 32933;
UPDATE `creature_template` SET `ScriptName` = 'mob_right_arm' WHERE `entry` = 32934;
UPDATE `creature_template` SET `ScriptName` = 'boss_steelbreaker' WHERE `entry` = 32867;
UPDATE `creature_template` SET `ScriptName` = 'boss_runemaster_molgeim' WHERE `entry` = 32927;
UPDATE `creature_template` SET `ScriptName` = 'boss_stormcaller_brundir' WHERE `entry` = 32857;

UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` IN (33051, 33691, 33689);
UPDATE creature_template SET faction_A=16, faction_H=16, scriptname='mob_rune_of_power' WHERE entry = 33705;
UPDATE creature_template SET faction_A=16, faction_H=16, scriptname='mob_lightning_elemental', difficulty_entry_1 = 33689 WHERE entry = 32958;
UPDATE `creature_template` SET `unit_flags` = 0, `ScriptName` = 'npc_keeper_norgannon' WHERE `entry` = 33686;
DELETE FROM `creature_template` WHERE `entry`=33115;
DELETE FROM creature WHERE `id`=33115;
DELETE FROM `creature` WHERE `id`=33186;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33186, 603, 1, 1, 0, 0, 587.073, -203.205, 441.237, 1.60532, 604800, 0, 0, 3555975, 0, 0, 0);

UPDATE `creature_template` SET `unit_flags` = 33554438 WHERE `entry` = 33184;
UPDATE `creature_template` SET `ScriptName` = 'boss_freya' WHERE `entry` =32906;
UPDATE `creature_template` SET `unit_flags` = 393220, `ScriptName` = 'creature_eonars_gift' WHERE `entry` =33228;
UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `unit_flags` = 33685508, `ScriptName` = 'creature_nature_bomb' WHERE `entry` =34129;
UPDATE `creature_template` SET `unit_class` = 2, `ScriptName` = 'creature_detonating_lasher' WHERE `entry` =32918;
UPDATE `creature_template` SET `ScriptName` = 'creature_ancient_conservator' WHERE `entry` =33203;
UPDATE `creature_template` SET `unit_flags` = 33686022, `ScriptName` = 'creature_healthy_spore' WHERE `entry` =33215;
UPDATE `creature_template` SET `ScriptName` = 'creature_storm_lasher' WHERE `entry` =32919;
UPDATE `creature_template` SET `ScriptName` = 'creature_snaplasher' WHERE `entry` =32916;
UPDATE `creature_template` SET `ScriptName` = 'creature_ancient_water_spirit' WHERE `entry` =33202;

DELETE FROM `creature` WHERE `map` = 136607;

DELETE FROM `spell_linked_spell` WHERE `spell_effect` = -62532;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(64321, -62532, 1, 'Potent Pheromones ward off the Conservator''s Grip'),
(62619, -62532, 1, 'Pheromones ward off the Conservator''s Grip');
UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `unit_flags` = 33686022, `ScriptName` = 'creature_unstable_sun_beam' WHERE `entry` = 33050;
DELETE FROM `gameobject` WHERE `id` = '194905';
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('35528','194905','603','1','1','401.308','-13.8236','409.524','3.14159','0','0','0','1','180','255','0');

UPDATE `creature_template` SET `speed_walk` = 0.5 WHERE `entry` = 33113;
UPDATE `creature_template` SET `unit_flags` = 0, `type_flags` = 8, `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;


UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'mob_pre_phase' WHERE `entry` IN (32882, 32908, 32885, 33110);
UPDATE `creature_template` SET `unit_flags` = 0, `faction_A` = 14, `faction_H` = 14, `ScriptName` = 'mob_arena_phase' WHERE `entry` IN (32876, 32904, 32878, 32877, 32874, 32875);

UPDATE `creature` SET `spawndist` = 0 WHERE `guid` = 136384;
UPDATE `creature` SET `position_x` = 2135.078, `position_y` = -298.758, `orientation` = 1.61 WHERE `guid` = 136384;

DELETE FROM `creature` WHERE `id` IN (32882, 32908, 32885, 32879, 33140, 33141);
DELETE FROM `creature` WHERE `guid` IN (136490, 136695, 137584, 136434, 137585, 136433, 137583, 137586, 136435, 136274, 136436, 136816, 136725);

UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (32892, 32879, 32780, 33140, 33141);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62042;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62042','62470','1','Thorim: Deafening Thunder');

UPDATE `creature_template` SET `unit_flags` = 33686020 WHERE `entry` = 33378;

DELETE FROM `creature` WHERE `id` IN (33378, 32892);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(136409, 33378, 603, 1, 1, 16925, 0, 2104.99, -233.484, 433.573, 5.49779, 604800, 0, 0, 12600, 0, 0, 1),
(136410, 33378, 603, 1, 1, 16925, 0, 2092.64, -262.594, 433.576, 6.26573, 604800, 0, 0, 12600, 0, 0, 1),
(136411, 33378, 603, 1, 1, 16925, 0, 2104.76, -292.719, 433.181, 0.785398, 604800, 0, 0, 12600, 0, 0, 1),
(136416, 33378, 603, 1, 1, 16925, 0, 2164.97, -293.375, 433.526, 2.35619, 604800, 0, 0, 12600, 0, 0, 1),
(136417, 33378, 603, 1, 1, 16925, 0, 2164.58, -233.333, 433.892, 3.90954, 604800, 0, 0, 12600, 0, 0, 1),
(136418, 33378, 603, 1, 1, 16925, 0, 2145.8, -222.196, 433.293, 4.45059, 604800, 0, 0, 12600, 0, 0, 1),
(136419, 33378, 603, 1, 1, 16925, 0, 2123.91, -222.443, 433.375, 4.97419, 604800, 0, 0, 12600, 0, 0, 1);

DELETE FROM `spell_script_target` WHERE `entry`=62016;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES('62016','1','33378');

UPDATE `creature_template` SET `unit_flags` = 0, `ScriptName` = 'mob_runic_colossus' WHERE `entry` = 32872;
UPDATE `creature_template` SET `unit_flags` = 0, `ScriptName` = 'mob_rune_giant' WHERE `entry` = 32873;
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0, `ScriptName` = 'thorim_trap_bunny' WHERE `entry` IN (33725, 33282);
UPDATE `creature_template` SET `flags_extra` = 0, `ScriptName` = 'thorim_energy_source' WHERE `entry` = 32892;
UPDATE `creature_template` SET `ScriptName` = 'boss_thorim' WHERE `entry` = 32865;
DELETE FROM `creature` WHERE `id`=33282;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33233,33259);
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0, `flags_extra` = 2, `ScriptName` = 'mole_machine_trigger' WHERE `entry` = 33282;

UPDATE `gameobject_template` SET `flags` = 32, `data2` = 3000, `ScriptName` = 'go_call_tram' WHERE `entry` IN (194914, 194912, 194437);
DELETE FROM gameobject WHERE id = '194437';
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('194437','603','1','1','2306.87','274.237','424.288','1.52255','0','0','0.689847','0.723956','300','0','1');

UPDATE `creature_template` SET `modelid1` = 11686, `modelid2` = 0, `flags_extra` = 2, `ScriptName` = 'mole_machine_trigger' WHERE `entry` = 33245;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 33282;

UPDATE `creature_template` SET `vehicleId` = 336 WHERE `entry` = 33432; -- Leviathan Mk II
DELETE FROM creature WHERE id = 34071;
DELETE FROM vehicle_accessory WHERE entry = 33432;
INSERT INTO vehicle_accessory VALUE (33432, 34071, 7, 1, 'Leviathan Mk II turret');
UPDATE creature_template SET ScriptName = 'boss_mimiron' WHERE entry = 33350;
UPDATE creature_template SET ScriptName = 'boss_leviathan_mk' WHERE entry = 33432;
UPDATE creature_template SET ScriptName = 'boss_leviathan_mk_turret' WHERE entry = 34071;
UPDATE creature_template SET ScriptName = 'mob_proximity_mine' WHERE entry = 34362;
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
INSERT INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0.5, 7, 2, 0);

UPDATE `creature_template` SET `ScriptName` = 'boss_elder_brightleaf' WHERE `entry` =32915;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_ironbranch' WHERE `entry` =32913;
UPDATE `creature_template` SET `ScriptName` = 'boss_elder_stonebark' WHERE `entry` =32914;
UPDATE `creature_template` SET `ScriptName` = 'creature_sun_beam', `unit_flags` = 33685510, `modelid1` = 11686, `modelid2` = 0 WHERE `entry` =33170;
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16, `unit_flags` = 393220, `ScriptName` = 'creature_iron_roots' WHERE `entry` = 33168;

DELETE FROM `spell_linked_spell` WHERE `spell_effect` = -62243;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(62217, -62243, 1, 'cancels the effects of Unstable Sun Beam'),
(62922, -62243, 1, 'cancels the effects of Unstable Sun Beam');

DELETE FROM `creature` WHERE `id` IN (33378, 32892);
UPDATE `creature_template` SET `modelid1` = 16925, `modelid2` = 0 WHERE `entry`IN (33378, 32892);
DELETE FROM `creature` WHERE `guid` IN (136718, 136694, 136757, 136700, 136754, 136666, 136718, 136653);

DELETE FROM `gameobject_template` WHERE `entry`=194265;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`, `WDBVerified`) VALUES
('194265','1','295','Lever','','','','0','16','3','0','0','0','0','0','0','0','0','6000','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','11403');

UPDATE `gameobject` SET `id` = 194265, `rotation2` = 1, `rotation3` = 0, `spawntimesecs` = 7200, `animprogress` = 100 WHERE `guid` = 55194;

DELETE FROM `creature` WHERE `guid`=136816;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
('136816','33725','603','1','1','16925','0','2134.93','-339.696','437.311','0','604800','0','0','12600','0','0','0');

UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 33725;
UPDATE `creature_template` SET `flags_extra` = 2, `ScriptName` = 'thorim_phase_trigger' WHERE `entry` = 32892;

DELETE FROM `creature_addon` WHERE `guid`IN (136059, 136816);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
('136059','0','0','0','1','0','40775 0'),
('136816','0','0','0','1','0','40775 0');
UPDATE `creature_template` SET `dmgschool` = 4, `dmg_multiplier` = 7.5, `unit_flags` = 33587202, `ScriptName` = 'npc_sif' WHERE `entry` = 33196;


DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=62475;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
('62475','9032','2','System Shutdown');

DELETE FROM areatrigger_scripts WHERE entry IN (5369, 5423);
INSERT INTO areatrigger_scripts VALUES
(5369,'at_RX_214_repair_o_matic_station'),
(5423,'at_RX_214_repair_o_matic_station');

UPDATE `gameobject` SET `position_x` = 130.553 WHERE `guid` = 55126;

-- Dalaran Teleport (Ulduar)
UPDATE `gameobject_template` SET `type` = 22, `data0` = 53141, `data2` = 1, `data3` = 1 WHERE `entry` = 194481;

DELETE FROM `creature` WHERE `id`=33672 AND guid IN (136552, 136553);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(136553, 33672, 603, 1, 1, 28935, 0, -815.68, -197.498, 429.925, 5.525, 180, 0, 0, 9416, 8459, 0, 0);

-- Achievement The Antechamber of Ulduar
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10578, 10579, 10580, 10581);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
(10578, 12, 0, 0),
(10580, 12, 0, 0),
(10579, 12, 1, 0),
(10581, 12, 1, 0);

UPDATE `creature_template` SET `unit_flags` = 2 WHERE `entry` = 33686;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33779;
DELETE FROM `creature_template` WHERE entry = 33115;
DELETE FROM creature WHERE id = 33115;

-- Emblem of Valor
UPDATE creature_loot_template SET item = 40753 WHERE entry IN (33113, 33186, 33118, 33293, 32927, 32857, 33515, 33271) AND item = 45624;
UPDATE gameobject_loot_template SET item = 40753 WHERE entry IN (27061, 26963, 27078, 27081, 26955, 26946, 27068) AND item = 40752;

-- Flame Leviathan
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803 WHERE `entry` = 33113;

-- XT-002 Hardmode loot

DELETE FROM `creature_loot_template` WHERE `entry`=33293;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('33293','40753','100','1','0','1','1','0','0','0'),
('33293','1','100','1','0','-34121','2','0','0','0'),
('33293','45867','0','2','2','1','1','0','0','0'),
('33293','45868','0','2','2','1','1','0','0','0'),
('33293','45869','0','2','2','1','1','0','0','0'),
('33293','45870','0','2','2','1','1','0','0','0'),
('33293','45871','0','2','2','1','1','0','0','0');

DELETE FROM `reference_loot_template` WHERE `entry`=34121;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('34121','45675','0','1','1','1','1','0','0','0'),
('34121','45676','0','1','1','1','1','0','0','0'),
('34121','45677','0','1','1','1','1','0','0','0'),
('34121','45679','0','1','1','1','1','0','0','0'),
('34121','45680','0','1','1','1','1','0','0','0'),
('34121','45682','0','1','1','1','1','0','0','0'),
('34121','45685','0','1','1','1','1','0','0','0'),
('34121','45686','0','1','1','1','1','0','0','0'),
('34121','45687','0','1','1','1','1','0','0','0'),
('34121','45694','0','1','1','1','1','0','0','0');

-- Assembly of Iron Hardmode loot

DELETE FROM `creature_loot_template` WHERE `entry` IN (32857, 32927, 32867);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('32857','40753','100','1','0','1','1','0','0','0'),
('32857','1','100','1','0','-34122','2','0','0','0'),
('32927','40753','100','1','0','2','2','0','0','0'),
('32927','1','100','1','0','-34122','3','0','0','0'),
('32867','45624','100','1','0','1','1','0','0','0'),
('32867','1','100','1','0','-34122','2','0','0','0'),
('32867','45447','0','2','2','1','1','0','0','0'),
('32867','45448','0','2','2','1','1','0','0','0'),
('32867','45449','0','2','2','1','1','0','0','0'),
('32867','45455','0','2','2','1','1','0','0','0'),
('32867','45456','0','2','2','1','1','0','0','0');

DELETE FROM `reference_loot_template` WHERE `entry`=34122;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('34122','45322','0','1','1','1','1','0','0','0'),
('34122','45324','0','1','1','1','1','0','0','0'),
('34122','45329','0','1','1','1','1','0','0','0'),
('34122','45330','0','1','1','1','1','0','0','0'),
('34122','45331','0','1','1','1','1','0','0','0'),
('34122','45332','0','1','1','1','1','0','0','0'),
('34122','45333','0','1','1','1','1','0','0','0'),
('34122','45378','0','1','1','1','1','0','0','0'),
('34122','45418','0','1','1','1','1','0','0','0'),
('34122','45423','0','1','1','1','1','0','0','0');

-- Freya Hardmode loot

UPDATE `creature_template` SET `mechanic_immune_mask` = 650853979  WHERE `entry` = 33203;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 33215;
DELETE FROM `gameobject_loot_template` WHERE `entry` IN (27078, 27079, 27080, 27081);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('27078','1','100','1','0','-34125','1','0','0','0'),
('27078','2','100','1','0','-34105','1','0','0','0'),
('27078','40753','100','1','0','1','1','0','0','0'),
('27078','45087','100','1','0','1','1','0','0','0'),
('27078','45644','0','1','1','1','1','0','0','0'),
('27078','45645','0','1','1','1','1','0','0','0'),
('27078','45646','0','1','1','1','1','0','0','0'),
('27078','46110','100','1','0','1','1','7','171','425'),
('27079','1','100','1','0','-34125','2','0','0','0'),
('27079','2','100','1','0','-34105','1','0','0','0'),
('27079','40753','100','1','0','1','1','0','0','0'),
('27079','45087','100','1','0','1','1','0','0','0'),
('27079','45644','0','1','1','1','1','0','0','0'),
('27079','45645','0','1','1','1','1','0','0','0'),
('27079','45646','0','1','1','1','1','0','0','0'),
('27079','46110','100','1','0','1','1','7','171','425'),
('27080','1','100','1','0','-34125','2','0','0','0'),
('27080','2','100','1','0','-34105','1','0','0','0'),
('27080','40753','100','1','0','2','2','0','0','0'),
('27080','45087','100','1','0','1','1','0','0','0'),
('27080','45644','0','1','1','1','1','0','0','0'),
('27080','45645','0','1','1','1','1','0','0','0'),
('27080','45646','0','1','1','1','1','0','0','0'),
('27080','46110','100','1','0','1','1','7','171','425'),
('27081','1','100','1','0','-34125','1','0','0','0'),
('27081','2','100','1','0','-34105','1','0','0','0'),
('27081','45943','0','1','2','1','1','0','0','0'),
('27081','45945','0','1','2','1','1','0','0','0'),
('27081','45946','0','1','2','1','1','0','0','0'),
('27081','45294','0','1','2','1','1','0','0','0'),
('27081','45947','0','1','2','1','1','0','0','0'),
('27081','45624','100','1','0','1','1','0','0','0'),
('27081','45087','100','1','0','1','1','0','0','0'),
('27081','45644','0','1','1','1','1','0','0','0'),
('27081','45645','0','1','1','1','1','0','0','0'),
('27081','45646','0','1','1','1','1','0','0','0'),
('27081','45788','-100','1','0','1','1','9','13606','0'),
('27081','46110','100','1','0','1','1','7','171','425');

DELETE FROM `gameobject_template` WHERE entry = 194326;
INSERT INTO `gameobject_template` VALUES('194326','3','8628','Freya\'s Gift','','','','0','0','2','0','0','0','0','0','0','1634','27080','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11159');

DELETE FROM `reference_loot_template` WHERE `entry`=34125;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('34125','45934','0','1','1','1','1','0','0','0'),
('34125','45935','0','1','1','1','1','0','0','0'),
('34125','45936','0','1','1','1','1','0','0','0'),
('34125','45940','0','1','1','1','1','0','0','0'),
('34125','45941','0','1','1','1','1','0','0','0');

-- Hodir Harmode loot

UPDATE script_texts SET `type` = 2 WHERE entry = -1603218;
DELETE FROM `gameobject` WHERE `id`=194200;
INSERT INTO `gameobject` (`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(194200, 603, 1, 1, 2038.29, -200.702, 432.687, 3.12232, 0, 0, 1, 0, 300, 0, 1);

DELETE FROM `gameobject_loot_template` WHERE entry=27069;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('27069','45624','100','1','0','1','1','0','0','0'),
('27069','45888','0','1','1','1','1','0','0','0'),
('27069','45886','0','1','1','1','1','0','0','0'),
('27069','45887','0','1','1','1','1','0','0','0'),
('27069','45877','0','1','1','1','1','0','0','0'),
('27069','45876','0','1','1','1','1','0','0','0'),
('27069','45786','-100','1','0','1','1','9','13609','0');

-- Thorim Hardmode loot

DELETE FROM `gameobject` WHERE `id`=194314;
UPDATE `gameobject_template` SET `faction` = 0, `flags` = 0 WHERE `entry` IN (194312, 194313);

DELETE FROM `gameobject_loot_template` WHERE entry IN (27073, 27074);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('27073','40753','100','1','0','1','1','0','0','0'),
('27073','1','100','1','0','-34130','1','0','0','0'),
('27073','45659','0','1','1','1','1','0','0','0'),
('27073','45660','0','1','1','1','1','0','0','0'),
('27073','45661','0','1','1','1','1','0','0','0'),
('27074','45624','100','1','0','1','1','0','0','0'),
('27074','1','100','1','0','-34130','1','0','0','0'),
('27074','45928','0','1','2','1','1','0','0','0'),
('27074','45929','0','1','2','1','1','0','0','0'),
('27074','45930','0','1','2','1','1','0','0','0'),
('27074','45931','0','1','2','1','1','0','0','0'),
('27074','45933','0','1','2','1','1','0','0','0'),
('27074','45659','0','1','1','1','1','0','0','0'),
('27074','45660','0','1','1','1','1','0','0','0'),
('27074','45661','0','1','1','1','1','0','0','0'),
('27074','45784','-100','3','0','1','1','9','13611','0');

DELETE FROM `reference_loot_template` WHERE entry = 34130;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('34130','45892','0','1','1','1','1','0','0','0'),
('34130','45893','0','1','1','1','1','0','0','0'),
('34130','45894','0','1','1','1','1','0','0','0'),
('34130','45895','0','1','1','1','1','0','0','0'),
('34130','45927','0','1','1','1','1','0','0','0');

-- Mimiron Hardmode loot

DELETE FROM `gameobject` WHERE `id`=194956;
DELETE FROM `gameobject_template` WHERE entry = 194790;
INSERT INTO `gameobject_template` VALUES ('194790','3','8686','Cache of Innovation','','','','0','0','1.5','0','0','0','0','0','0','1634','27086','0','1','0','0','0','0','0','0','0','1','0','1','0','1','0','0','0','0','0','0','0','0','','11159');

DELETE FROM `gameobject_loot_template` WHERE entry IN (27085, 27086);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('27085','40753','100','1','0','1','1','0','0','0'),
('27085','1','100','1','0','-34129','1','0','0','0'),
('27085','45647','0','1','1','1','1','0','0','0'),
('27085','45648','0','1','1','1','1','0','0','0'),
('27085','45649','0','1','1','1','1','0','0','0'),
('27086','45624','100','1','0','1','1','0','0','0'),
('27086','1','100','1','0','-34129','1','0','0','0'),
('27086','45982','0','1','2','1','1','0','0','0'),
('27086','45988','0','1','2','1','1','0','0','0'),
('27086','45989','0','1','2','1','1','0','0','0'),
('27086','45990','0','1','2','1','1','0','0','0'),
('27086','45993','0','1','2','1','1','0','0','0'),
('27086','45647','0','1','1','1','1','0','0','0'),
('27086','45648','0','1','1','1','1','0','0','0'),
('27086','45649','0','1','1','1','1','0','0','0'),
('27086','45787','-100','1','0','1','1','9','13611','0');

DELETE FROM `reference_loot_template` WHERE entry = 34129;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('34129','45972','0','1','1','1','1','0','0','0'),
('34129','45973','0','1','1','1','1','0','0','0'),
('34129','45974','0','1','1','1','1','0','0','0'),
('34129','45975','0','1','1','1','1','0','0','0'),
('34129','45976','0','1','1','1','1','0','0','0');

-- General Vezax Hardmode loot

DELETE FROM `creature_loot_template` WHERE entry = 33271;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('33271','40753','100','1','0','1','1','0','0','0'),
('33271','1','100','1','0','-34131','2','0','0','0'),
('33271','46032','0','2','2','1','1','0','0','0'),
('33271','46033','0','2','2','1','1','0','0','0'),
('33271','46034','0','2','2','1','1','0','0','0'),
('33271','46035','0','2','2','1','1','0','0','0'),
('33271','46036','0','2','2','1','1','0','0','0');

DELETE FROM `reference_loot_template` WHERE entry = 34131;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
('34131','45996','0','1','1','1','1','0','0','0'),
('34131','45997','0','1','1','1','1','0','0','0'),
('34131','46008','0','1','1','1','1','0','0','0'),
('34131','46009','0','1','1','1','1','0','0','0'),
('34131','46010','0','1','1','1','1','0','0','0'),
('34131','46011','0','1','1','1','1','0','0','0'),
('34131','46012','0','1','1','1','1','0','0','0'),
('34131','46013','0','1','1','1','1','0','0','0'),
('34131','46014','0','1','1','1','1','0','0','0'),
('34131','46015','0','1','1','1','1','0','0','0');
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803, `flags_extra` = 257, `ScriptName` = 'boss_general_vezax' WHERE `entry` = 33271;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235, `ScriptName` = 'mob_saronite_vapors' WHERE `entry` = 33488;
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `mechanic_immune_mask` = 650854235, `ScriptName` = 'mob_saronite_animus' WHERE `entry` = 33524;
DELETE FROM `creature_model_info` WHERE `modelid`=28831;
INSERT INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`) VALUES
(28831, 0, 0, 2, 0);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (33856, 34143, 34050);
UPDATE `creature_template` SET `unit_flags` = 33686018 WHERE `entry` = 34050;
UPDATE `creature` SET `position_x` = 2736.92, `position_y` = 2572.30, `orientation` = 5.723 WHERE `guid` = 137630;
UPDATE `creature_template` SET `ScriptName` = 'boss_vx_001', `unit_flags` = 0, `vehicleid` = 371, `Health_mod` = 375 WHERE `entry` = 33651;
UPDATE `creature_template` SET `ScriptName` = 'boss_aerial_unit', `unit_flags` = 0, `vehicleid` = 388, `Health_mod` = 250 WHERE `entry` = 33670;
UPDATE `creature_template` SET `vehicleid` = 370, `Health_mod` = 156.185 WHERE `entry` = 33432;
UPDATE `creature_template` SET `Health_mod` = 156.185 WHERE `entry` = 34071;

DELETE FROM vehicle_accessory WHERE entry = 33432;
INSERT INTO vehicle_accessory VALUE (33432, 34071, 3, 1, 'Leviathan Mk II turret');
UPDATE `creature_template` SET `modelid1` = 17188, `modelid2` = 0 WHERE `entry` = 25171;
UPDATE `creature_template` SET `speed_walk` = 0.5, `speed_run` = 0.5, `ScriptName` = 'mob_boom_bot' WHERE `entry` = 33836;

DELETE FROM `creature` WHERE `id`=33651;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33651, 603, 1, 1, 28841, 0, 2744.65, 2569.46, 364.397, 3.14159, 604800, 0, 0, 1742400, 0, 0, 0);
UPDATE `creature_template` SET `unit_flags` = 33686020, `flags_extra` = 2, `ScriptName` = 'rocket_strike' WHERE `entry` = 34047;

DELETE FROM `creature` WHERE `id`=33670;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(33670, 603, 1, 1, 28979, 0, 2744.65, 2569.46, 380.040, 3.14159, 604800, 0, 0, 1742400, 0, 0, 0);

UPDATE `creature_template` SET `unit_flags` = 33686020, `type_flags` = 0, `flags_extra` = 2, `ScriptName` = 'magnetic_core' WHERE `entry` = 34068;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10598, 10599, 10559, 10444, 10563, 10455, 10558, 10438, 10561, 10454, 10408, 10560, 10453, 10562);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`) VALUES
-- Freya
(10559, 12, 0, 0),
(10444, 12, 0, 0),
(10563, 12, 1, 0),
(10455, 12, 1, 0),
-- Thorim
(10558, 12, 0, 0),
(10438, 12, 0, 0),
(10561, 12, 1, 0),
(10454, 12, 1, 0),
-- Hodir
(10408, 12, 0, 0),
(10560, 12, 0, 0),
(10453, 12, 1, 0),
(10562, 12, 1, 0);