-- ----------------------------------------
-- Added to prevent timeout's while loading
-- ----------------------------------------
SET GLOBAL net_read_timeout=30;
SET GLOBAL net_write_timeout=60;
SET GLOBAL net_buffer_length=1000000; 
SET GLOBAL max_allowed_packet=1000000000;
SET GLOBAL connect_timeout=10000000;

-- --------------------------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update (v1.3)
-- --------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT structure FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cCurContent := (SELECT content FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '21'; 
    SET @cOldStructure = '03'; 
    SET @cOldContent = '018';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '03';
    SET @cNewContent = '019';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'missing_page_text';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'missing_page_text';

    -- Evaluate all settings
    SET @cCurResult := (SELECT description FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
    SET @cOldResult := (SELECT description FROM db_version WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;

        -- UPDATE THE DB VERSION
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure, @cNewContent, @cNewDescription, @cNewComment);
        SET @cNewResult := (SELECT description FROM db_version WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
/*
This update is to replace/update/add missing text from objects and items.
/* 
The Worst Mage in Dalaran: A Children's Book
*/
DELETE FROM `page_text` WHERE `ENTRY` IN (3346, 3347, 3348, 3349, 3350, 3351, 3352, 3353, 3354, 3355, 3356, 3357, 3454, 3455, 3456, 3457, 3458, 3459, 3460, 3398, 3399, 3400, 3401, 3402, 3477, 3478, 3479, 3480, 3481, 3487, 3488, 3489, 3469, 3470, 3471, 3490, 3491, 3492, 3493, 3494, 3495, 3496, 3500, 3501, 3284, 3285, 3286, 3287, 3288, 3289, 3290, 3291, 3292, 3293, 3294, 3295, 3296, 3297, 3298, 3299, 3300, 3301, 3403, 3404, 3405, 3406, 3407, 3408, 3432, 3433, 3434, 3435, 3436);
INSERT INTO `page_text` (`entry`, `text`, `next_page`) values
('3346','Once upon a time there lived a mage who could not cast fireball, polymorph or frostbolt. When he conjured water, it came out as mud. His attempts at arcane intellect made the subjects stupider. Without any doubt, his tutors agreed that their pupil, Bungledorf, was the worst mage in Dalaran.','3347'),
('3347','Bungledorf had come to learn with great hopes. He guzzled mana potions before class, mistakenly believing they would increase his skill. But all they ever increased was the number of times he accidentally burped during important invocations, often setting classmates\' robes ablaze or turning his teacher\'s beard into sheep\'s wool in the process.','3348'),
('3348','At his first exam, Bungledorf was asked to cast frost armor correctly. The other students shifted in their seats fearfully as he began the incantation. A blue fog encompassed the young lad and for a moment it looked as though he had succeeded. But then he began to shiver and sneeze violently, and everyone finally realized: he had given himself frostbite.','3349'),
('3349','One day Bungledorf was in the park, wondering whether he was cut out to be a mage. He saw some children playing nearby and remembered his dream of being a powerful spellcaster. \"Yes,\" he thought, \"I can do it: I just need to try harder!\" He looked for something to practice on and noticed an unusual tree before him. Summoning his courage, Bungledorf began casting a spell on it. He shut his eyes, afraid to see the result...','3350'),
('3350','When he finally looked, the tree was replaced with a beautiful night elf. \"It worked!\" he cried, \"It\'s transformed! I am a mage after all!\"\r\nThe night elf was confused for a moment and then smiled at him gently. \"I am a druid, young one. We take other forms by our own will.\"','3351'),
('3351','Bungledorf blushed and stepped away, only to trip over his robes and fall headfirst into the lawn. A chorus of giggles greeted him as he adjusted his long pointed cap and shuffled off towards the dormitory, his head hanging low.','3352'),
('3352','The night elf lingered, pondering the boy. When she turned to leave, she caught her foot in something and nearly lost her balance. Surprised at the unfamiliar obstacle, she looked down to see a glistening crop of mageroyal, its petals slowly unfurling into full bloom, where moments ago there had been nothing. She wondered at this, and then, realizing, turned back in the direction Bungledorf had been walking, but the young mage was already gone.','0'),
/* 
Weathered Diary - Dates from the Third War
*/
('3353','Entry 1\r\n\r\nBefore I could understand what was happening, the devastation was upon us. The ground trembled and our fair spire, which had stood citadel over Dalaran since the Second War, shattered.\r\n\r\nI remember screaming as my father\'s face disappeared behind the tumbling scaffolding, but I heard nothing. Even in my terror, I thought of my magical training. If I could only slow this disaster-but the spells died within me. Traces of demonic power barred my efforts. There was no hope. I closed my eyes and waited. But somehow, I am still here.','3354'),
('3354','Entry 2\r\n\r\nThe wreckage shifted for hours. I was certain each new thundering tremor would finally end it. Instead, I remain huddled beneath an archway that had once framed our view of the bustling market streets. How many times had I seen my sister returning from there, her arms loaded with goods? Now only dust and stone stand before me.','3355'),
('3355','Entry 4\r\n\r\nI must believe in the Kirin Tor. The great mages of Dalaran would not desert their people. This rubble that imprisons me is no more than a trifle to a skilled spellcaster, I will be saved, and one day, I will finish my training and stand among them.','3356'),
('3356','Entry 5\r\n\r\nThere are no signs of others or of my family. I have called for them. Everything above is silent now, I am not sure whether I am blessed or cursed. My heart would quiet itself and follow the others to rest, but my mind is thick with fear.','3357'),
('3357','Entry 6\r\n\r\nIt grows darker and the air is thinner. The faint lights I summon to write burn into my eyes. I can do no more. My energy must be saved for what may yet come. I am audacious enough to hope that these scraps of paper will hold out against the silence as I cannot. I would become a voice, singing up through this abyss, softening until a whisper, and then fading into the sky.','0'),
/* 
Polymorphic Rules & Regulations
*/
('3454','Species altercation has the highest potential for abuse and disaster, and is the source of the most number of complaints to the Kirin Tor. Polymorphic study has been under constant scrutiny and threat of removal for years, but only recently have these tribulations increased exponentially. In order for this spell to continue to be sanctioned certain guidelines must be put in place to throttle the increasing number of tragedies reckless polymorphs have caused.','3455'),
('3455','Rule# 1: Do not turn a creature of lesser intelligence into a creature of higher intelligence - Cerebral brain function rarely translates in a polymorph... But sometimes it does. Voracious creatures such as serpents and wolves need not have their predatory instincts honed with a human mind. We feel obligated to quote Small Claims Disaster Case 12651-B, Labeled, \"Bartholomew: The Bear who Bears Arms.\"','3456'),
('3456','Rule# 2: Use simplified creatures for polymorphs - Many rogue mage disciples sanction exotic creature polymorphic studies. But in a desperate effort to lower Kirin Tor insurance claims we are ceasing to support these types of creatures. Sheep are acceptable creatures for any situation. But there are several other common creature types that are supported (Read the latest edition of the Kirin Tor Monthly for an up-to-date list). Polymorphing into creatures like oozes, ethereals, silithid, and worst of all dragonkin is severely punishable which brings us to...','3457'),
('3457','Rule# 3: Polymorphic debaucheries are to be disposed of in a timely and DISCREET manner - The Public need not bear witness to the horrendous abominations wrought from a botched polymorph. Accidents happen, and the Kirin\'Tor understands this. However public viewing of creatures like the Were-Whale, Mur-Elf, Amphibious Worgen, Flying Ooze, Grypho-Hippo-Wyvern, Qiraji Bunny, and the infamous \"Blue-Checkered Cube\" give us all a bad reputation.','3458'),
('3458','Rule #4: Do not polymorph a creature into another more powerful creature - While this looks like plain common sense, we feel obligated to quote Mildly Severe Claims Disaster Case 8791-E, Labeled, \"Magus John Quint: Liquefied by Sickly Deer turned Violently Confused Molten Giant.','3459'),
('3459','Rule #5: Do not polymorph anything that is halfway through a portal - This has yet to not cause an explosion. This is also covered in \"Thinking with Portals: A Memorandum on Proper Portal Usage.\"','3460'),
('3460','Rule #6: Do not polymorph inanimate objects! - We can\'t believe the Kirin\'Tor is receiving reports of this, but such a heinous act caused the development of the brand new Highly Severe Claims Disaster Case 1-A, \"My Kingdom For A Horse: The One Hundred and Fifty Reasons Why A Kingdom Should Not Be Turned Into A Horse.\"\r\n\r\n<This goes on for hundreds of pages>','0'),
/* 
LAVA BLAST - by Pyroco
*/
('3398','Feeling a little down? Need some energy? How about lots of energy? How about some hot, fiery incendiary energy?\r\n\r\nTry the new LAVA BLAST from Pyroco. You\'ll fall in love with it\'s sweet, refreshing taste and the raw power within. Need a quick pick me up? No problem! LAVA BLAST will rejuvenate you even at your most exhausted.','3399'),
('3399','Severely injured? We\'ve got you covered! LAVA BLAST will give you that extra energy you need to find your way to safety! *\r\nDo you love fire? Have you ever thought about how awesome it would be to drink liquid fire? If so, you\'ll love new LAVA BLAST from Pryoco! Taste the burning!\r\n\r\n* Recent studies have shown that Lava Blast may not actually assist in healing wounds in any way. There is a possibility that Lava Blast may actually cause you to bleed profusely from seemingly random orifices.','3400'),
('3400','Warning: Lava Blast is not for everyone. Pregnant women, choldren, and women who might become pregnant or are nursing should consult their doctors before drinking Lava Blast.','3401'),
('3401','Possible Side Effects May Include: Dry mouth, upset stomach, dry eyes, indigestion, back pain, bone and joint pain, slight disfiguration, internal bleeding, temporary insanity, Lava Blast addiction, magic addiction, pyromania, fear of spiders, lightning eyes, heart palpitations, fever, spontaneous child birth, lack of sleep, vulnerability to cold iron, hysteria, random songs popping into your head, asthma, demonic possession, headaches, footaches, and the inability to use the letter \'R\' and death.','3402'),
('3402','Caution: Drinking multiple Lava Blasts in rapid succession can result in spontaneous combustion.\r\n\r\nTry new LAVA BLAST now!','0'),
/* 
In Time, the Arcane Corrupts All!
*/
('3477','<This flier was recently pasted here. Residue of glue on the stone shows that many fliers have previously occupied this location.>','3478'),
('3478','Hark!\r\n\r\nMagic is not what you have been taught. Its dangers far exceed the greatest gifts it may bring! Question your Elders, that you may know the truth. Act now while there is time to save yourselves! Learn the ways of Nature and share in the balance of all things, ere your destructive ways upset it beyond repair.\r\n\r\n<An unfamiliar seal decorates the bottom of the flier.>','0'),
/* 
Kirin Tor Monthly - November Issue
*/
('3487','Dalaran Dining Guide\r\nWhen Inzi Charmlight opened A Hero\'s Welcome shortly after the city relocated, locals and visitors alike lined up to lay their weapons down and sink their teeth into a tough hunk of bread! Seating is ample, prices are fair and the full bar offers indulgences from all over the world to help you feel satisfyingly heroic. No matter what you order, save room for the Mead-Basted Caribou!','3488'),
('3488','For regional fare in a less boisterous setting, try the Hocus Pocus Inn near the center of town. The open, airy inn is easy to find and serves light meals with pleasant conversation in a relaxed, library-like atmosphere. The regulars are primarily exhausted students of the arcane; no wonder the real star of the show is the incredibly skilled food that prepares and cooks itself at your table!','3489'),
('3489','If you are looking for a bed, a bar and not much else, look no further than the Filthy Animal! The bar area is dark and authentically malodorous, replete at all hours with individuals of questionable character. The menu boasts such delicacies as Briny Hardcheese and it would take an army of enchanted dancing mops and buckets to make the sleeping quarters habitable. A Horde paradise indeed!','0'),
/* 
Portals are NOT Garbage Bins!
*/
('3469','As you are all well aware, we as an organization make a regular habit of combing the local reaches of the twisting nether for misplaced objects. This has turned up all manner of wayward treasure, from errant magical essences to crackling shards of mystic power to entire suits of armor and powerful weaponry. Increasingly of late, however, we have also begun to turn up garbage and refuse as well.','3470'),
('3470','The sheer vastness of the nether is no excuse for using it as a garbage repository! Your Portal and Teleport spells are a great privilege and responsibility, and carelessly casting the waste from your noontime meals into a portal could have GRAVE CONSEQUENCES for all of Azeroth! Please secure all objects when traveling via portal and report any lost objects to the Kirin Tor council at once. Read the latest edition of \"Thinking with Portals - A Memorandum on Proper Portal Usage\" for all information regarding portal use.','3471'),
('3471','If this problem grows any further out of hand, I will be forced to insist that all portal travelers relinquish their weaponry and personal hygiene supplies before embarking. And the next time my lecture notes appear among the rubbish, I will personally transform the heads of all apprentices into dunce caps!\r\n\r\n--Archmage Runeweaver','0'),
/* 
STAY OUT!!!
*/
('3490','<The worn journal\'s entries are separated by illegible or missing sheets.>\r\n\r\nWhat would Nikolai think? I wouldn\'t dream of telling him about the voice, but I can barely speak around him anyway. Perhaps the voice is my conscience...','3491'),
('3491','... It\'s not so much an echo as it is a comforting voice in my head, peassuring[sic] me that there\'s more to come. It feels like the opposite of a headache (if that makes any sense), a wave of warmth and ideas. For example: I knew the librarian kept some materials secret, but the voice tells me that even so, her understanding of demons is laughable at best.','3492'),
('3492','My conscience was right again. I am more than adept at the simple spellwork they teach us at school. For every mana biscuit my peers conjour, I can make a meal. Nikolai can see the change within me. Is he scared? My conscience tells me that\'s what the elder mages call respect.','3493'),
('3493','I could seek him out... he\'s surely in the north! I can see the way clearly. Redemption can\'t be impossible. It can\'t be too late. I can make him whole again, or better! With my powers growing, amplified, I can make us all so happy! Mother, Father, Nikolai... we can all be one, together...','3494'),
('3494','Nikolai fears me; his eyes betray what his lips won\'t say. It\'s fine; our history and my conscience agree that respect and fear are the same. If he leaves me, I\'ll make sure that whoever dares to touch what\'s mine lives to regret it. They\'ll all be ours in the end, my sisters.','3495'),
('3495','... With threats to report or expel me if I don\'t return his cat to normal. What\'s abnormal about an old cat? I would have liked to do it to him instead. How dare they defend him when he stood up to me in front of Nikolai?','3496'),
('3496','Mother had the nerve to scold me. Doesn\'t she realize who I am? I can feel him calling to me. This city and these people don\'t deserve me. More than enough of the provisions I\'d need are in the kitchen. Nikolai, Mother, even that blasted cat... they\'ll do anything I want and stay with me forever. The money in Mother\'s dresser is mine by right; I can only help him.\r\n\r\n<The rest of the pages are empty.>','0'),
/* 
Remedial Magic 101: Tips from the Pros
*/
('3500','- Fight fire with fire! Just because a monster\'s body is completely made of flames doesn\'t mean that your fireball spell won\'t work. Give it a shot! The results might surprise you.\r\n\r\n- Dress for success! Studies show that mages who pay attention to their wardrobe are FAR more effective than those who wear older, lower-quality clothing. Have you updated your robe lately?\r\n\r\n- Know your role! At first glance, your staff may look like an effective melee weapon, but it\'s not. Let the guys with the big shiny armor stand in front. That being said...','3501'),
('3501','- Friendly fire! Don\'t doubt yourself - go ahead and cast that spell! It\'s OK if you miss: your arcane missiles probably won\'t hit your friends.\r\n\r\n- Get a job! A great way to build your skill is to ask people if they need any help with anything. You\'d be surprised how many people are looking for a good mage to hire! Contrary to what you might think, even the simplest act of delivering a package can make you a better caster.\r\n\r\n- The daily grind! You may have heard about some mages choosing to mindlessly and repetitively kill monsters - often several at a time - in order to practice their spellcasting. While this is a legitimate and often effective method to become more powerful, over extended periods of time, it will rot your brain.','0'),
/*
Damaged Apprentice Journal
*/
('3284','<The majority of the book\'s pages are missing or soiled beyond recovery. A few of the early entries and the name \'Darius Orion\' are still legible.>','3285'),
('3285','Dec. 2 of the Year 20\r\n\r\nThe cold this year has been particularly cruel. I find that no matter how many layers I wear under my robes, the frost cuts deep into my bones. The masters say that it will pass but I have trouble believing that at times.','3286'),
('3286','A small group of workers from an outlying farm near Andorhal were brought in this morning and taken to the infirmary within the Violet Citadel. I do not know much about what ails them but I overheard one of them complaining about weakness and nausea. I hope the masters choose me to aid them in working to treat the farmers.','3287'),
('3287','2 hours later\r\n\r\nWhat luck! One of the masters informed me that I will be working with the men who were brought in from Andorhal earlier. I intend to make good use of this opportunity to show how far I have come in my studies.','3288'),
('3288','6 hours later\r\n\r\nThis is not turning out to be quite as glorious as I had planned. The farmers\' conditions have deteriorated quickly in their short time here. One has developed irritated boils covering large portions of his skin. I have treated the most seriously afflicted with some of the most powerful herbs and poultices available in the citadel. There should be some noticeable improvement within the next few hours.','3289'),
('3289','10 hours later\r\n\r\nThe situation has quickly gotten out of control. All of the subjects are now covered in lesions which leak yellow-green fluid. All but a few are unconscious at this point. The few that are awake alternate between complaints of paralyzing numbness and burning aches in their joints. All of the subjects are showing a milky coloring in their eyes.','3290'),
('3290','Our attempts to slow the progress of the illness have been unsuccessful. Word has spread among the apprentices that this disease may be magical in nature; the masters were quick to quash the rumors. Many of the other apprentices that I had been working with on this project have excused themselves for fear that the disease is contagious and capable of penetrating our personal wards.','3291'),
('3291','I excused myself to take a walk out on one of the terraces to clear my thoughts. I could not have been outside for more than a couple minutes when I had to run back inside. My hands and feet had gone numb and my nose and ears were showing symptoms of mild exposure to frostbite. I will have to be more careful next time.','3292'),
('3292','13 hours later\r\n\r\nLight save us.\r\n\r\nThe subjects have begun severe hemorrhaging from the eyes and ears. The masters believe they will all be dead within the hour. All attempts to halt the progress of the disease have failed. I have done what I can to ease their pain. I only hope that we can learn what we need from them after their deaths. No one should suffer as these men have suffered. I plan to stay with them until the end.','3293'),
('3293','To make matters worse one of the guards found the body of a first year apprentice in the gardens. It has not been confirmed yet but the rumors are that he froze to death. I do not think it has been this cold here in Dalaran in decades, if ever.','3294'),
('3294','18 hours later\r\n\r\nThe farmers from Andorhal are dead. I thought they would finally be at peace but I was wrong. Only a few minutes after the last one breathed his last breath something horrifying happened. Their disease riddled corpses somehow animated and began clawing at myself and the other mages in the infirmary. Once the initial confusion passed one of the masters organized a force to deal with the animated bodies. The undead quickly fell to our combined arcane might.','3295'),
('3295','There were minimal casualties. A few of the apprentices had been scratched; one had a nasty bite that required stitches. Shortly afterward guards arrived and escorted myself and the other apprentices to our rooms. I tried to learn what was going on but they would not answer me. As we were being led through the halls to our rooms we passed by several troupes of guards with weapons drawn and readied. Is this what war feels like?','3296'),
('3296','After I was brought to my room I was told to lock the door and not come out until I was told by a master personally that it was safe to leave. What is going on? Has the world gone mad?','3297'),
('3297','24 hours later\r\n\r\nI have been awake for over twenty-four hours now. I am exhausted but my room is too cold to sleep. I managed to complete a sending and contact a couple of the other apprentices who are trapped in their rooms. Through them I was able to learn what has the citadel on high alert. The masters are organizing search parties to locate the necromancer who was responsible for animating the corpses of the diseased farmers.','3298'),
('3298','There has not been a practicing necromancer in Dalaran since Kel\'Thuzad. I hope the monster responsible for the horrors I have seen today is brought to justice soon.','3299'),
('3299','38 hours later\r\n\r\nThe quarantine has been lifted and we apprentices are finally allowed to leave our rooms. The necromancer responsible for animating the dead farmers was never caught but the masters are confident that he is not within the citadel or anywhere near Dalaran.','3300'),
('3300','We have resumed our efforts to learn more about the disease. Work has been slow due to most of the bodies having been obliterated. The masters have called Lady Jaina Proudmoore to aid in our research. She will teleport here by the end of the day. I hear she is quite beautiful; hopefully working with Lady Proudmoore will help me keep my mind off this damned cold.','3301'),
('3301','<The journal is too badly damaged to read beyond this point.>','0'),
/*
Losses of the Third War
*/
('3479','Thule Ravenclaw\r\n\r\nThough accounts vary wildly, many recent events transpiring in Tirisfal Glades and Silverpine Forest seem to indicate that Thule Ravenclaw had willingly sided with the Scourge. The husk of Fenris Keep on Lordamere Lake may yield clues, but our attention must remain elsewhere at present.','3480'),
('3480','Gunther Arcanus\r\n\r\nPresumably killed during the events of the third war and lost to the Scourge.\r\n\r\nGunther was last in possession of my favorite pipe. Should his remains turn up, I would be most gracious for its return!','3481'),
('3481','Bethor Iceshard\r\n\r\nKilled during the events of the third war. Bethor is known to have risen as a member of the Forsaken and should be treated as an agent of the Horde in all dealings.','0'),
/*
The Archmage Antonidas - Part I
*/
('3403','Antonidas was but a mere boy when he became an apprentice to one of the Kirin Tor. He was a tenacious learner, pouring over books in the magical libraries of Dalaran. After only a few short years of studying under the sect, Antonidas had outclassed his peers and earned their admiration, as well as the respect of his elders.','3404'),
('3404','At the age of 12, Antonidas\' thesis, \"The Ramifications of Refined Reverse Time Travel Phenomena into Quantifiable Magical Practice\", earned him the Kirin Tor Sash of Supreme Acumen, the youngest ever to receive the award. Shortly thereafter the Ruling Council offered him official placement in the Kirin Tor Advanced Research and Illumination Sect, also the youngest to receive an official invitation.','3405'),
('3405','As the mage grew older, he continued to learn and hone his abilities. His natural talent for defensive magic and wisdom beyond his years made Antonidas an ideal candidate for a position on the Council of Six, which he eventually attained. Antonidas proved not only wise and fair, but infinitely regimented in goal to become more knowledgeable. He quickly became one of the dominant voices of Dalaran.','3406'),
('3406','Before the Second War, leaders of each of the Azerothian nations met in Lordaeron to discuss the threat of the orc invasion. Archmage Antonidas attended the summit on behalf of the Council of Six, pledging loyalty to the Alliance on Dalaran\'s behalf. He also monitored the progress of the young but extremely talented mage Khadgar, who had served as Medivh\'s apprentice during the first war. In the aftermath of the Second War, Antonidas promoted Khadgar to the rank of archmage and placed him in a position of authority over the mission to enter the Dark Portal and investigate Draenor.','3407'),
('3407','After the Second War, Antonidas investigated the lethargy of the orcs. The archmage published several theses on his research:\r\n\r\n\"The Causality of War: A Comprehensive Study on Orc Lassitude.\"\r\n\r\n\"The Contrast of Orc Tradition, Sociology, and Psychological Practices from Before and After the Second War.\"\r\n\r\n\"Empirical Study on the Formulation and History of High Profile Fel Magics, and their Relation to the Orc Race.\"','3408'),
('3408','The consensuses of many of these reports are largely inconclusive. Antonidas himself has said on occasion that finding a cure for the malaise of the orcs would be an almost unachievable venture. His formal conclusion was that the orcs\' only path to a healthy lifestyle would be a spiritual one.','0'),
/*
Journal of Archmage Antonidas
*/
('3432','Oct 8.\r\n\r\nAs I have said before, I am becoming increasingly disturbed by the dangerously vast potential of certain schools of magic, and the contrasting amount of laws and boundaries that should be set to limit them. Furthermore, comprehensive research on these volatile schools shows a trend of decreasing academic prerequisites yielding increasingly powerful outcomes.\r\n\r\nA student of mine asked me today, \"Why are there so many limitations on traditional portals, when Fel portals can be made twice as large and last ten times as long?\" The student was not yet educated in the abstraction of what is practical versus what is achievable, yet the question held within me a certain duality: What future is there for the established practices of magic when so many wild variations threaten to overshadow them?\r\n\r\nI do all I can to stifle studies of Fel magics and necromancy here, yet I find myself both disturbed and enthralled by their potential. I refuse to believe that that their efficiency so soundly trumps the common criticisms of being unstable or \"evil\" that these schools hold the monopoly of avenues for magical progress. Yet when witnessing the massive infernal for one\'s self, or seeing acres of land blighted at the wave of an hand, I fear my beliefs may soon shift from gospel to dogma in the minds of my peers.','3433'),
('3433','Oct 16.\r\n\r\nMy primary focus has shifted to research of the plague that ravages the north. I\'ve canceled most of my classes to focus on research of this terrible anomaly.\r\nWith immense precaution I\'ve procured a shipment of the infested grain. Immediately I was both impressed and suspicious with how innocuous the whole package presented itself. There was no discoloration, no discernable odor, and no variation at all from any other sheaf of grain.\r\nAt that moment it was no longer a mystery of this plague spread so quickly.','3434'),
('3434','Oct 17.\r\nFurther study of the plague has yielded disturbing conclusions, and even more disturbing implications.\r\nInitial testing showed the plague had only minor effects on non-human creatures. Symptoms ranged from fatigue, nausea, fever, to minor hallucinations, but rarely resulted in death. On human tissue, however, the plague acts uniformly and unprecedented expediency towards necrosis.\r\n\r\nIt would be foolish to think that such an efficient human killer only being found in human rations is a coincidence. While it\'s certainly possible that these two occurrences are unrelated, I\'ve decided to delegate more resources towards finding the source of this plague, for I fear there are intelligent hands pushing it upon our kin.\r\n\r\nMore research must be done here at Dalaran, however, I will decide who to investigate in my stead at a later date, after some heavy deliberation.','3435'),
('3435','Oct 18.\r\n\r\nI\'ve stumbled upon a key factor of this plague, one so cleverly hidden in its methodology that I\'ve come to two immutable conclusions: That its development was for the singular prupose of ending human life, and its inception was at the hands of an intelligent being.\r\nLong term affliction of the plague causes a certain reanimation of activity in the dead. This activity is very small at first, and I disregarded it as a minor side-effect. However, this energy remained persistent and unwavering. A thought struck me, one which was both surprising and strong: The corpse was waiting for something.\r\n\r\nAt that moment I did not have any evidence to prove it, but I nonetheless spent time pursuing it. I used my limited knowledge of necromancy and casted simple curses on the corpse. At the time I had no motivation to raise the dead, only to change or distinguish the radiating energy off the corpse. Imagine my surprise when it sprung to life and attacked me.\r\n\r\nI did not hesitate to incinerate it to dust, and I now regret doing so. But I was able to prove my unprovoked theory, that the corpse (and by extension the plague that saturates it) was indeed waiting for further commands. It\'s clear that those who die by this plague are only lying dormant in their graves, awaiting one skillful in necromancy to awaken them.\r\n\r\nIn short, it is indisputable that the plague is magical in nature.','3436'),
('3436','Oct 20.\r\n\r\nI have decided to send my most trusted disciple, Jaina Proudmoore, to investigate the source of the plague. Based on my research, I believe only my skillful disciple will be able to handle the unknown challenges that await such an endeavor. She will take with her a copy of this journal and my other research documents regarding the plague. Indeed I will make it public, for all people need to become aware of this imminent threat.\r\n\r\nI only wish I could investigate it myself, but Terenas has proved to be predictably stubborn to my requests. It is paramount that I convince him to quarantine the north. Little else matters at this point in time. Regardless, I have the fullest faith in Jaina\'s cunning. If she or I cannot put an end to this infestation, I doubt anyone can.\r\n\r\n-Antonidas-\r\n<This is marked with the seal of the Council of Six> ','0');


/*
The Archmage Antonidas - Part II
*/
UPDATE `page_text` SET `next_page` = '3410' WHERE `entry` = '3409';
/*
Excerpts from the Journal of Archmage Vargoth
*/
UPDATE `page_text` SET `next_page` = '3507' WHERE `entry` = '3506';
/*
Blinking Rules & Regulations
*/
UPDATE `page_text` SET `next_page` = '3462' WHERE `entry` = '3461';
/*
Bundle of Romantic Correspondences
*/
UPDATE `page_text` SET `next_page` = '3483' WHERE `entry` = '3482';
/*
The Fate of Apprentice Argoly
*/
UPDATE `page_text` SET `next_page` = '3473' WHERE `entry` = '3472';
/*
The Archmage Antonidas - Part III
*/
UPDATE `page_text` set `next_page` = '3415' WHERE `entry` = '3414';


/*
First, Second, Third History Scrolls
Quest: 13034
*/
UPDATE `page_text` SET `text` = '\"Long ago, when the North Wind ruled these peaks alone, a powerful Taunka Chieftain\'s brother coveted these lands for himself.\"' WHERE `entry` = '3280';
UPDATE `page_text` SET `text` = '\"The Chieftain\'s brother, Stormhoof gathered all his strength and set out to conquer the Storm Peaks from its rightful ruler, the North Wind.\"' WHERE `entry` = '3281';
UPDATE `page_text` SET `text` = '\"Stormhoof ambushed the North Wind in the heart of it\'s domain, and nearly succeeded in his plot. But the North Wind survived Stormhoof\'s treachery and executed the Taunka as punishment for his invasion.\"' WHERE `entry` = '3282';
/*
Dusty Journal - Alliance
*/
UPDATE `page_text` SET `text` = 'The first half of the journal seems to be nothing more than the ledger for Mr. Cooper\'s business. Handwritten columns of figures note the production and sale of barrels to the inhabitants of Moonbrook and even a few clients in Stormwind itself.\r\n\r\nThe back half of the book seems to have been Mr. Cooper\'s journal, where he discusses leaving the family business to his younger brother. You find no mention of children.' WHERE `entry` = '3546';
/*
McCarty's Notes
*/
UPDATE `page_text` SET `text` = '<The handwriting is unintelligible chicken scratch, but you can make out references to the color pink...>' WHERE `entry` = '3107';
/*
A Steamy Romance Novel: Blue Moon
*/
DELETE FROM `page_text` WHERE `entry` IN (3622, 3623, 3624);
INSERT INTO `page_text` (`entry`, `text`, `next_page`) VALUES('3622','Tail swooshing and hips swaying, the curvy figure walked purposefully across the lake toward the man resting by the shore; rising quickly as she approached. He appeared visibly happy to be in her presence. Blue arms flowed over his shoulders as a smooth tail coiled seductively around his waist. \"Why must I travel so far to be meeting man like you?\" Her voice carried a strong, alluring accent.\r\n\r\nGrinning wildly, he gently pushed her away, openly staring as the light caught her features.\r\n\r\n\"Up here!\", she exclaimed in playful anger.\r\n\r\nWith a helpless shrug, he reached into his pack and pulled out a small pouch. \"My wonderful Soola, I\'ve brought you something.\" Confidence wrapped his words like a steel blanket.','3623'),
('3623','She plucked the tiny bag from his hands, excitedly pulling it open and revealing a citrine pendant.\r\n\r\n\"Oh... Marcus, you shouldn\'t have.\"\r\n\r\nThe usual teasing was gone from his voice, \"Every facet lights the sky, and my heart, with your beautiful reflection.\"\r\n\r\nSoola frowned. \"Uh... no. I meant you really shouldn\'t have. I could craft something better by accident.\"\r\n\r\nFor the first time, possibly ever, Marcus looked hurt. His shoulders slumped slightly, the %^&*y, ever-present grin missing from his handsome face.\r\n\r\nSoola opened her mouth to speak, smiling warmly; a glowing rune appeared above her eyes. \"I don\'t think I can mend your feelings, even with my gift.\"','3624'),
('3624','Despite the statement, her words seemed to do the trick, Marcus smirked roguishly as he adjusted his leg plates, \"Well you aren\'t the only gifted one.\"\r\n\r\nSilence penetrated the room with palpable force as the conversation shifted to the language shared by all races of Azeroth.\r\n\r\nMinutes became hours, until their passionate dialog was interrupted by lightning streaking from the cloudless sky, thunderously slamming into the lake\'s surface and bathing them in steam.\r\n\r\n\"Is something wrong?\", Marcus asked.\r\n\r\n\"No my Marcus, you\'re just off to a great start.\"\r\n\r\nThe remaining pages have been thoroughly destroyed by the elements.','0');

/*
The Diary of High General Abbendis Item: 37540 Horde quest item
The Path of Redemption Item: 37931 Alliance quest item
*/
DELETE FROM `page_text` WHERE `entry` IN (3079, 3092, 3093, 3094, 3095, 3096, 3097, 3098, 3099, 3100, 3101, 3132, 3133, 3134, 3135, 3136, 3137, 3138, 3139, 3140, 3141, 3142, 3143, 3144, 3145, 3146, 3147, 3148, 3149, 3150, 3151, 3152, 3153, 3154, 3155, 3156);
UPDATE `item_template` SET `PageText` = 3132 WHERE `entry` = 37540;
UPDATE `item_template` SET `PageText` = 3132 WHERE `entry` = 37931;
INSERT INTO `page_text` (`entry`, `text`, `next_page`) VALUES('3132','<HTML>\r\n<BODY>\r\n<BR/>\r\n<H1 align=\"center\">The Diary of High General Abbendis</H1>\r\n<BR/>\r\n<IMG src=\"Interface\\FlavorImages\\ScarletCrusadeLogo\"/>\r\n</BODY>\r\n</HTML>','3133'),
('3133','<HTML>\r\n<BODY>\r\n<BR/>\r\n<P>The voice whispered, \"Come to me.\" From the very beginning I knew that it was the Holy Light speaking to me in dreams. At last! After all of my years of prayers and good deeds, the cleansing of the blight of the unliving from the face of Azeroth. After all of the failures and resurrections.</P>\r\n<BR/>\r\n<P>Finally!</P>\r\n</BODY>\r\n</HTML>','3134'),
('3134','<HTML>\r\n<BODY>\r\n<BR/>\r\n<P>It happened again. \"Come to me...\", the Light commanded.</P>\r\n<BR/>\r\n<P>I woke up freezing, but it wasn\'t cold in my chambers. I\'m going to redouble my efforts! I\'ll tell the high abbot tomorrow that I want prayers increased. No more half-measures!</P>\r\n<BR/>\r\n<P>The Holy Light has taken notice of our good work. I can feel it!</P>\r\n</BODY>\r\n</HTML>','3135'),
('3135','<HTML>\r\n<BODY>\r\n<BR/>\r\n<P>This time I was awake! It was very vivid, and yet for over a minute, in the middle of the warm, sunny day, my breath came out misted and chill. One of the priests noticed and dropped to his knees in prayer.</P>\r\n<BR/>\r\n<P>No one else heard the voice, though. At least the witness proves that I\'m not going insane. Maybe I should ask Landgren to pray on the matter?</P>\r\n<BR/>\r\n<P>I\'ll get Jordan and Street to scrutinize their recruiting efforts tomorrow. We\'ve grown bloated with ranks of unbelievers who yearn only to destroy the undead. That\'s not enough!</P>\r\n</BODY>\r\n</HTML>\r\n','3136'),
('3136','<HTML>\r\n<BODY>\r\n<BR/>\r\n<P>The commander and the bishop were both receptive. Not that they had any choice. Bishop Street in particular seemed very enthusiastic. He spoke of a revival for the crusade and swore to ferret out the weak of faith within our ranks.</P>\r\n<BR/>\r\n<P>I told him to go easy. I\'ve no intention of destroying the Crusade. However, I do like the sound of forming an elite cadre of the most faithful to do the Light\'s bidding in Northrend. I fear the man\'s friendship with LeCraft is slowly twisting him. They both have their uses, though.</P>\r\n</BODY>\r\n</HTML>\r\n','3137'),
('3137','<HTML>\r\n<BODY>\r\n<BR/>\r\n<P>I will leave most of the Crusade here to continue mopping-up operations on the undead in our backyard. I imagine that once they have finished what we began, most will disband and go back to their homes to live in peace.</P>\r\n<BR/>\r\n<P>That somehow seems right. At our finest, we have always been the salt of the earth, rising up to take back our homes from the filth of the Scourge corruption, to return our Lordaeron to its former glory. To a time before the Scourge, before Arthas and regicide... before the Lich King.</P>\r\n</BODY>\r\n</HTML>','3138'),
('3138','<HTML>\r\n<BODY>\r\n<BR/>\r\n<P>There have been whispers amongst the men about a day soon to come that will change everything for the Scarlet Crusade. Bishop Street has put a name to it, calling it the Crimson Dawn.</P>\r\n<BR/>\r\n<P>I will put some thought to this, though I can feel the truth of it in my bones. I pray that it will bring weal for us rather than woe.</P>\r\n</BODY>\r\n</HTML>\r\n','3139'),
('3139','<HTML>\r\n<BODY>\r\n<BR/>\r\n<P>The Light has spoken again with a great deal of urgency. I came away from the dream with a sense of impatience. I will not disappoint. There must be no more delays. We must soon be underway!</P>\r\n<BR/>\r\n<P>What a great coincidence then - and I had to control myself from showing my relief - this afternoon Captain Shely procured for us a number of new ships for the voyage. Perhaps it was no coincidence at all? The Holy Light expresses its will in ways that we are not meant to understand.</P>\r\n<BR/>\r\n<P>I will take the Sinner\'s Folly as my flag. I think the name is most fitting.</P>\r\n</BODY>\r\n</HTML>','3140'),
('3140','<HTML>\r\n<BODY>\r\n<BR/>\r\n<P>Now I know why the Light has been pushing me to be underway. In the dead of night a Scourge necropolis appeared in the sky over us and out poured the minions of hell!</P>\r\n<BR/>\r\n<P>A new breed of death knight leads the assault. Already the casualties we\'ve suffered have been catastrophic. With the Scourge able to strike at us anywhere and at will from above, there seems no way to mount a proper defense.</P>\r\n<BR/>\r\n<P>I fear that our intended expedition to Northrend is over before it has begun.</P>\r\n</BODY>\r\n</HTML>','3141'),
('3141','<HTML>\r\n<BODY>\r\n<BR/>\r\n<P>I\'ve been informed that Hearthglen and the surrounding area have already begun to assemble a host. High Commander Galvar Pureblood himself intends to lead them to save us. His efforts will be for naught.</P>\r\n<BR/>\r\n<P>I must see to it that my best couriers get through the enemy lines and warn him off. Hearthglen must prepare to dig in and rally the rest of the Crusade.</P>\r\n<BR/>\r\n<P>With any luck they\'ll get through before nightfall.</P>\r\n</BODY>\r\n</HTML>','3142'),
('3142','<HTML>\r\n<BODY>\r\n<BR/>\r\n<P>There\'s been no word from any of my couriers this morning. It\'s clear that none of them made it through to Hearthglen. The Plaguelands are lost. Pureblood will come with his forces and they\'ll be annihilated out in the open.</P>\r\n<BR/>\r\n<P>This afternoon I received a vision from the Light. In it, I saw the utter destruction of everything that we\'ve built here. The message was clear - I was being told to take the remainder of the most faithful and abandon the Crusade to their doom.</P>\r\n</BODY>\r\n</HTML>','3143'),
('3143','<HTML>\n<BODY>\n<BR/>\n<P>Landgren later told me that he\'d received the same vision. I cannot comprehend how the Light would tell us to take such a dishonorable action, but it is not my place to question - I am to obey, and obey I shall.</P>\n<BR/>\n<P>It was with trepidation that I gazed upon New Avalon, I suspect for the last time. Our fate lies in Northrend. I am filled with a sense of ominous foreboding for some reason. The mission ahead should shake away these concerns. I will put them out of my mind.</P>\n</BODY>\n</HTML>\n','3144'),
('3144','<HTML>\n<BODY>\n<BR/>\n<P>Perhaps with luck, High Commander Pureblood will somehow endure and marshal the survivors. I\'m a coward - a dog running away with my tail tucked between my legs!</P>\n<BR/>\r\n<P>Two months they tell me that this journey is going to take. The other ships aren\'t built for speed like the Folly. They\'re carrying most of our forces and equipment, and they\'re not much more than single sail freighters, but they\'ll get there safely.</P>\r\n<BR/>\r\n<P>I\'m not looking forward to this, but for the Light I will endure the sea sickness. I simply mustn\'t let the others see.</P>\n</BODY>\n</HTML>\n','3145'),
('3145','<HTML>\r\n<BODY>\r\n<BR/>\r\n<P>I\'ve not written in a while. It\'s as much as I can do to stand upright and not get sick. The men are beginning to wonder why I keep myself holed up in my cabin most of the time. It wouldn\'t be good for morale for them to see me this way.</P>\r\n<BR/>\r\n<P>It shouldn\'t be long now. I pray that it won\'t be. Six weeks already and every day it seems that the weather gets worse. I can only hope that Northrend itself does not have such horrible weather. I wasn\'t built for the cold.</P>\r\n<BR/>\r\n<P>The Holy Light has been silent for a very long time.</P>\r\n</BODY>\r\n</HTML>','3146'),
('3146','<HTML>\r\n<BODY>\r\n<BR/>\r\n<P>We were attacked with no warning whatsoever! Giants in massive oared longships came out of the mist like ghosts! They were silent as the dead.</P>\r\n<BR/>\r\n<P>I lost a ship and all of the men on it. We fought with great courage and skill considering that we have only the most rudimentary naval combat training.</P>\r\n<BR/>\r\n<P>Afterward, the screams of our men who\'d been taken captive by the giants echoed across the water. After a while it grew silent again. Bishop Street led the men in prayers.</P>\r\n</BODY>\r\n</HTML>\n','3147'),
('3147','<HTML>\r\n<BODY>\r\n<BR/>\r\n<P>I awoke this morning in the middle of making adjustments to my maps. The Light was guiding my hand, showing me exactly where we must go.</P>\r\n<BR/>\r\n<P>We are close!</P>\r\n</BODY>\r\n</HTML>\n','3148'),
('3148','<HTML>\r\n<BODY>\r\n<BR/>\r\n<P>Landfall!</P>\r\n<BR/>\r\n<P>Exiting the rowboat upon the beach, I planted our banner and was overcome by the Holy Light, which spoke through me. Today is the Crimson Dawn - the great day that we\'ve waited for. This is to be the site of New Hearthglen. We are no longer the Scarlet Crusade. We are now the Scarlet Onslaught!</P>\r\n<BR/>\r\n<P>And an onslaught upon Northrend we shall be! The cancer of the Scourge threatens to overflow in the crown of the world and drown the rest of us. The time has come to take the fight directly to the Lich King\'s doorstep!</P>\r\n</BODY>\r\n</HTML>\n','3149'),
('3149','<HTML>\r\n<BODY>\r\n<BR/>\r\n<P>It\'s been almost a month now and construction has proceeded apace. I\'ve been too busy to write. My scouts tell me that this land is full of dragons and other strange beasts. We\'ll keep to ourselves until we\'re ready.</P>\r\n<BR/>\r\n<P>In the middle of services today, the high abbot proclaimed that a visitor would arrive soon - one that the Light was sending to lead us to victory.</P>\r\n<BR/>\r\n<P>I don\'t know how I feel about that. Why didn\'t the Light tell me? Have I not served faithfully? Now I\'m to be replaced by some outsider?</P>\r\n</BODY>\r\n</HTML>\r\n','3150'),
('3150','<HTML>\r\n<BODY>\r\n<BR/>\r\n<P>Admiral Barean Westwind showed up on my doorstep tonight! By all accounts he\'d died upon these shores an age ago.</P>\r\n<BR/>\r\n<P>He didn\'t look old enough and yet I knew that it was him. He claimed that he was the only survivor of his doomed fleet and that he\'d survived only through the good graces of the Light.</P>\r\n</BODY>\r\n</HTML>','3151'),
('3151','<HTML>\n<BODY>\n<BR/>\r\n<P>We stayed up speaking through the night and into the morning. He assured me that he had no intention of taking my place, but that the Light had instructed him to travel across the Great Dragonblight to serve as my advisor and commander in title only. He claimed that great change was coming to Northrend. The Alliance and the Horde were going to come en masse in response to a great plague that the Lich King was about to unleash upon them.</P>\n</BODY>\n</HTML>','3152'),
('3152','<HTML>\n<BODY>\n<BR/>\n<P>The men have taken to the grand admiral with great zeal, especially High Abbot Landgren and Bishop Street. Apparently the Holy Light whispered a new blessing to the admiral in his sleep, which he passed on to Landgren. Some of the men have converted to the priesthood and are now being called \"raven priests\".</P>\n<BR/>\n<P>Only Jordan seems unimpressed. I suppose that\'s understandable. He probably feels his position is threatened if mine is.</P>\n</BODY>\n</HTML>\n','3153'),
('3153','<HTML>\n<BODY>\n<BR/>\n<P>Something doesn\'t seem right. I can\'t put my finger on it, but I cannot make myself fully trust the admiral. He\'s done nothing wrong. Quite the contrary! And yet, I have to trust my gut.</P>\n<BR/>\n<P>I will pray for understanding. The Light delivered the admiral to lead us to victory and it is not my place to question its decisions. I will continue to obey. I am faithful.</P>\n</BODY>\n</HTML>\n','3154'),
('3154','<HTML>\n<BODY>\n<BR/>\n<P>Another couple of months have passed. We\'ve made great strides in the construction of New Hearthglen. The wall is almost complete as is the barracks. Kaleiki\'s men are miracle workers.</P>\n<BR/>\n<P>My heart hasn\'t been into writing. I\'ve been avoiding putting my thoughts here for some reason. The Light hasn\'t visited me of late, though the admiral assures me that this is nothing to worry about.</P>\n</BODY>\n</HTML>\n','3155'),
('3155','<HTML>\n<BODY>\n<BR/>\n<P>My men report that a small group of Forsaken have broken ground on a camp along the hillside to the north. On the other side of the hill, the Alliance have apparently begun the construction of a much larger base.</P>\n<BR/>\n<P>The admiral says that we should leave them be. There are other Horde forces gathered to the west that would surely come to their aid if we were to attack. I don\'t feel good about it, but I see the logic in his reasoning.</P>\n</BODY>\n</HTML>\n','3156'),
('3156','<HTML>\n<BODY>\n<BR/>\n<P>The first phase of construction is done. Admiral Westwind has ordered a group of my men to establish a toehold further to the north. He wouldn\'t go into detail, claiming that he was being \"guided\" to do so.</P>\n<BR/>\n<P>We caught four spies from the Forsaken town, Venomspite, this afternoon. I\'m going to have LeCraft torture them for information. If we only caught four, how many more have slipped in amongst us?</P>\n<BR/>\n<P>Why do I feel as if things are beginning to unravel?</P>\n</BODY>\n</HTML>\n','0');
    

        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL ABOVE -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

        -- If we get here ok, commit the changes
        IF bRollback = TRUE THEN
            ROLLBACK;
            SHOW ERRORS;
            SELECT '* UPDATE FAILED *' AS `===== Status =====`,@cCurResult AS `===== DB is on Version: =====`;



        ELSE
            COMMIT;
            SELECT '* UPDATE COMPLETE *' AS `===== Status =====`,@cNewResult AS `===== DB is now on Version =====`;
        END IF;
    ELSE    -- Current version is not the expected version
        IF (@cCurResult = @cNewResult) THEN    -- Does the current version match the new version
            SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cCurResult AS `===== DB is already on Version =====`;
        ELSE    -- Current version is not one related to this update
            IF(@cCurResult IS NULL) THEN    -- Something has gone wrong
                SELECT '* UPDATE FAILED *' AS `===== Status =====`,'Unable to locate DB Version Information' AS `============= Error Message =============`;
            ELSE
		IF(@cOldResult IS NULL) THEN    -- Something has gone wrong
		    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurStructure := (SELECT `STRUCTURE` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurContent := (SELECT `Content` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
		ELSE
		    SET @cCurVersion := (SELECT `version` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurStructure := (SELECT `STRUCTURE` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
		    SET @cCurContent := (SELECT `Content` FROM db_version ORDER BY `version` DESC, STRUCTURE DESC, CONTENT DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                END IF;
            END IF;
        END IF;
    END IF;
END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;

