USE [SSLS]
GO
/****** Object:  Table [dbo].[Reader]    Script Date: 12/05/2019 09:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reader](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](16) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Sex] [nvarchar](10) NULL,
	[Phone] [nvarchar](11) NOT NULL,
	[Balance] [decimal](18, 2) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Classes] [nvarchar](50) NULL,
 CONSTRAINT [PK__Reader__3214EC0707020F21] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Reader] ON
INSERT [dbo].[Reader] ([Id], [Password], [Name], [Sex], [Phone], [Balance], [Email], [Classes]) VALUES (1, N'123', N'王天浩', N'女', N'13964935423', CAST(53779.11 AS Decimal(18, 2)), N'1253205@qq.com', N'1班')
INSERT [dbo].[Reader] ([Id], [Password], [Name], [Sex], [Phone], [Balance], [Email], [Classes]) VALUES (2, N'321', N'李四', N'男', N'13853925395', CAST(10000.00 AS Decimal(18, 2)), N'53925792@qq.com', N'2班')
INSERT [dbo].[Reader] ([Id], [Password], [Name], [Sex], [Phone], [Balance], [Email], [Classes]) VALUES (4, N'12345678', N'小红', N'女', N'13748395439', CAST(10000.00 AS Decimal(18, 2)), N'4543479@qq.com', N'3班')
INSERT [dbo].[Reader] ([Id], [Password], [Name], [Sex], [Phone], [Balance], [Email], [Classes]) VALUES (27, N'123', N'阿尔法', N'男', N'12312421321', CAST(2000.00 AS Decimal(18, 2)), N'359885502@qq.com', N'1班')
INSERT [dbo].[Reader] ([Id], [Password], [Name], [Sex], [Phone], [Balance], [Email], [Classes]) VALUES (29, N'123', N'阿尔法', N'男', N'12312421321', CAST(0.00 AS Decimal(18, 2)), N'1272024027@qq.com', N'1班')
SET IDENTITY_INSERT [dbo].[Reader] OFF
/****** Object:  Table [dbo].[Category]    Script Date: 12/05/2019 09:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK__Category__3214EC077F60ED59] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (1, N'小说', N'小说(Novel) ：是四大文学样式（散文、小说、诗歌、戏剧）之一，以塑造人物形象为中心，通过完整故事情节的叙述和具体的环境描写反映社会生活的一种文学体裁，它是拥有完整布局、发展及主题的文学作品。')
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (2, N'散文', N'散文（prose;essay）是与诗歌、小说、戏剧并称的一种文学体裁，指不讲究韵律的散体文章，包括杂文、随笔、游记等。是最自由的文体，不讲究音韵，不讲究排比，没有任何的束缚及限制，也是中国最早出现的行文体例。通常一篇散文具有一个或多个中心思想，以抒情、记叙、论理等方式表达')
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (3, N'文学', N'文学 语言文字的艺术，是文化的重要表现形式,以不同的形式(或称文学体裁)来表现一定时期,一定地域的社会生活.')
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (4, N'传记', N'传记，文体名。亦单称传。是一种常见的文学形式。主要记述人物的生平事迹，根据各种书面的、口述的回忆、调查等相关材料，加以选择性的编排、描写与说明而成。传记和历史关系密切，某些写作年代久远的传记常被人们当史料看待。一般由他人记述，亦有自述生平者，称"自传"。传记大体分两大类:一类是以记述翔实史事为主的史传或一般纪传文字;另一类属文学范围，传记作者在记述传主事迹过程中，可能会渗透自己的某些情感、想象或者推断，但和小说不同，传记一般不虚构，纪实性是传记的基本要求。')
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (5, N'科幻', N'科学幻想(Science Fiction)，简称科幻(Sci-Fi)，直译应为"科学小说"或"科学虚构"(而直译应为"科学幻想"的"Science Fantasy"也因此被迫译为了"科学奇幻")。科学的幻想，即根据有限的科学假设(某些东西的存在，某些事件的发生)，在不与人类最大的可知信息量(如现有的科学理论，有据可考的事件记录)冲突的前提下，虚构可能发生的事件。科幻目前已发展成为一种文化和风格，而科幻文化也成为了一种由科幻作品衍变出来的新文化。')
INSERT [dbo].[Category] ([Id], [Name], [Description]) VALUES (6, N'悬疑', N'悬疑小说是以一个悬念贯穿始终并且解开的小说，其内容和题材相对自由广泛，不像恐怖小说通常都会有让人感到害怕的场景和气氛，悬疑小说则未必要有。当然，从更大的概念来说，恐怖小说也必然有悬念，也可以被认作是悬疑小说的一个分支。但是，无论悬疑小说还是恐怖小说，跟鬼故事是完全不同的，最大的差别就在于一个是小说，一个是故事。所谓小说，必然要有情节、人物、环境的三元素，如果只有情节那就是故事而不是小说。悬疑小说是具有神秘特性的推理文学，可以唤起人们的本能、刺激人们的好奇心。')
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[Admin]    Script Date: 12/05/2019 09:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON
INSERT [dbo].[Admin] ([Id], [UserName], [Password]) VALUES (1, N'Admin', N'123')
SET IDENTITY_INSERT [dbo].[Admin] OFF
/****** Object:  Table [dbo].[Book]    Script Date: 12/05/2019 09:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Authors] [nvarchar](100) NOT NULL,
	[Press] [nvarchar](100) NOT NULL,
	[ImageUrl] [nvarchar](1000) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[PublishDate] [datetime] NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Status] [nvarchar](100) NULL,
	[Category_Id] [int] NOT NULL,
 CONSTRAINT [PK__Book__3214EC0703317E3D] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (1, N'发条橙', N' 安东尼·伯吉斯', N'译林出版社', N'bookc1.jpg', N'阿历克斯是个无恶不作的街头少年。由于一桩人命案，他被逮捕，当局在他身上试验一种特殊手段，将他“改造”成一个一有暴力念头就会无比痛苦的人。只能行善，无力作恶，他丧失了选择善恶的能力，丧失了自由意志。他感觉自己就像一只被上了发条的橙子…… ', CAST(0x0000AA7D00000000 AS DateTime), CAST(45.60 AS Decimal(18, 2)), N'在库', 1)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (4, N'网中人', N'永城', N'作家出版社', N'bookc2.jpg', N'《网中人》首部大数据时代互联网商业犯罪小说。', CAST(0x0000AA9C00000000 AS DateTime), CAST(45.60 AS Decimal(18, 2)), N'外借', 1)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (5, N'战时灯火', N'迈克尔·翁达杰', N'上海文艺出版社', N'bookc3.jpg', N'　“生活就是‘schwer’（困厄）。” ', CAST(0x0000AA5F00000000 AS DateTime), CAST(66.40 AS Decimal(18, 2)), N'外借', 1)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (6, N'律政雄心', N'戴维·拉特', N'译林出版社', N'bookc4.jpg', N'在美国，*高法院大法官助理的职位像独角兽一样珍贵。每年，数百名顶*法学院的高材生们披荆斩棘，只为争夺那仅有的四十个名额。出生于贫寒移民家庭的奥德丽·科因一心想成为那四十分之一。她毕业于耶鲁法学院，成绩优异，但身为亚裔女性，寻梦之旅格外艰难。 ', CAST(0x0000AA9C00000000 AS DateTime), CAST(64.60 AS Decimal(18, 2)), N'外借', 1)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (8, N'漫长的告别', N'雷蒙德·钱德勒', N'海南出版社', N'bookc5.jpg', N'《漫长的告别》是真正意义上的灵魂交流的故事，是人与人之间自发地相互理解的故事，是人类抱有的美好幻想和它不可避免地引发的深深幻灭的故事。——村上春树', CAST(0x0000A94E00000000 AS DateTime), CAST(65.50 AS Decimal(18, 2)), N'在库', 1)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (9, N'巫兹纳德系列：训练营', N'科比·布莱恩特， 韦斯利·金', N'金城出版社', N'bookc6.jpg', N'《纽约时报》畅销榜冠军作品，YAMAXUN2019年年度好书。', CAST(0x0000AA9C00000000 AS DateTime), CAST(126.20 AS Decimal(18, 2)), N'在库', 1)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (11, N'2001：太空漫游', N'阿瑟·克拉克', N'上海文艺出版社', N'bookc7.jpg', N'人类对太空的想象，到《2001：太空漫游》为止。', CAST(0x0000AA2200000000 AS DateTime), CAST(58.90 AS Decimal(18, 2)), N'在库', 1)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (12, N'浮生六记', N'沈复', N'浙江工商大学出版社', N'bookc8.jpg', N'《浮生六记》为自传散文体小说，书中记闺房之乐，琴瑟相和、缱绻情深;记闲情雅趣，贫士心性、喜恶爱憎；记人生坎坷，困顿离合、人情世态;记各地浪游，山水名胜、奇闻趣观。作者以纯朴的文笔，记叙大半生的经历，欢愉与愁苦两相对照，真切动人。书中描述了他和妻子陈芸志趣投合，伉俪情深，愿意过一种布衣蔬食的生活，可由于贫困生活的煎熬，终至理想破灭，经历了生离死别的惨痛。', CAST(0x0000A91000000000 AS DateTime), CAST(29.00 AS Decimal(18, 2)), N'在库', 2)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (13, N'余生很长，别慌张，别失望', N'史铁生', N'北方文艺出版社', N'bookc9.jpg', N'余生很长，别慌张，别失望。有的人22岁毕业，到27岁才找到工作；有的人没上过大学，却创办了世界yiliu的企业；有的人25岁结婚，但婚姻并不幸福；有的人30岁依然单身，但每天都很快乐……所以，不要去羡慕别人的成功，也别过分谴责自己的错误。每个人都有属于自己的时刻表，别让任何人打乱你人生的节奏。 ', CAST(0x0000A9C800000000 AS DateTime), CAST(36.80 AS Decimal(18, 2)), N'外借', 2)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (14, N'文化苦旅', N'余秋雨', N'长江文艺出版社', N'bookc10.jpg', N'《文化苦旅》一书于1992年首次出版，是余秋雨先生1980年代在海内外讲学和考察途中写下的作品，是他的第一部文化散文集。全书主要包括两部分，一部分为历史、文化散文，另一部分为回忆散文。甫一面世，该书就以文采飞扬、知识丰厚、见解独到而备受万千读者喜爱。由此开创“历史大散文”一代文风，令世人重拾中华文化价值。他的散文别具一格，见常人所未见，思常人所未思，善于在美妙的文字中一步步将读者带入历史文化长河，启迪哲思，引发情致，具有极高的审美价值和史学、文化价值。书中多篇文章后入选中学教材。但由于此书的重大影响，在为余秋雨先生带来无数光环和拥趸的同时，也带来了数之不尽的麻烦和盗版。誉满天下，“谤”亦随身。余秋雨先生在身心俱疲之下，决定亲自修订、重编此书。', CAST(0x0000A30000000000 AS DateTime), CAST(39.80 AS Decimal(18, 2)), N'在库', 2)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (15, N'红星照耀中国', N'埃德加·斯诺', N'人民文学出版社', N'bookc11.jpg', N'《红星照耀中国》（曾译《西行漫记》）自1937年出版以来，畅销至今。董乐山译本是今天了解中国工农红军的经典读本。本书真实记录了斯诺自1936年6月至10月在中国西北革命根据地进行实地采访的所见所闻，向全世界报道了红色根据地的情况。', CAST(0x0000A78500000000 AS DateTime), CAST(40.80 AS Decimal(18, 2)), N'在库', 2)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (16, N'皮囊', N'蔡崇达', N' 天津人民出版社', N'bookc12.jpg', N'《皮囊》是一部有着小说阅读质感的散文集，也是一本“认心又认人”的书。', CAST(0x0000A3F400000000 AS DateTime), CAST(37.80 AS Decimal(18, 2)), N'在库', 2)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (17, N'自在独行', N'贾平凹', N'长江文艺出版社', N'bookc13.jpg', N'贾平凹，是我国当代文坛屈指可数的文学大师。他是一位极具叛逆性的作家，但又不失淳朴的本色。他是中国少有的高产作家，更为可贵的是他每一部作品都堪称精品。毫无疑问，他也是当代中国可以载入世界文学史册的文学家之一。', CAST(0x0000A61800000000 AS DateTime), CAST(37.10 AS Decimal(18, 2)), N'在库', 2)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (18, N'春风十里不如你', N'冯唐', N' 北京联合出版公司', N'bookc14.jpg', N'一本书读透冯唐30年创作精华。关于金钱、名声、胜负、感情、生命、无常、终ji，金线之后的人生智慧，在这本书中深度领悟。', CAST(0x0000AAD900000000 AS DateTime), CAST(53.20 AS Decimal(18, 2)), N'在库', 2)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (19, N'北京女子图鉴', N'王欣 ', N' 北京联合出版公司', N'bookc15.jpg', N'超百万读者被打动，收获10万+读者留言。我们怕穷、怕错爱、怕失败、怕孤独，但更怕一事无成！这是一部为女人的独立、进步，困境和需求发声的作品', CAST(0x0000AA7D00000000 AS DateTime), CAST(42.80 AS Decimal(18, 2)), N'在库', 3)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (21, N'天边一星子', N'邓安庆', N' 新星出版社', N'bookc16.jpg', N'青年实力作家邓安庆全新短篇小说集，书写每个人在人间的爱与不舍', CAST(0x0000A98B00000000 AS DateTime), CAST(33.80 AS Decimal(18, 2)), N'在库', 3)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (22, N'两地书', N'鲁迅，许广平', N'北京日报出版社', N'bookc17.jpg', N'“我寄你的信，总要送往邮局，不喜欢放在街边的绿色邮筒中，我总疑心那里会慢一点。”—鲁迅。', CAST(0x0000AA5F00000000 AS DateTime), CAST(43.60 AS Decimal(18, 2)), N'在库', 3)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (23, N'画见', N'止庵 ', N' 上海人民出版社', N'bookc18.jpg', N'止庵看画。始于马奈，终于培根，讲述情感和艺术连接的生命之书。说是看画，实在读人心，说是看画，实在观自己', CAST(0x0000AA5F00000000 AS DateTime), CAST(66.90 AS Decimal(18, 2)), N'在库', 3)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (25, N'边城（纪念版）', N'沈从文', N' 江苏人民出版社', N'bookc19.jpg', N'《边城（纪念版）》是沈从文颇负盛名的代表作品，以20世纪30年代川湘交界的边城小镇茶峒为背景，以兼具抒情诗和小品文的优美笔触，描绘了湘西边城淳朴的世道民风和天然的生活状态。语言古朴清新，寄托着从文先生关于“美”与“爱”的美学理想，彰显了人性的至真、至善与至美。', CAST(0x0000A4C800000000 AS DateTime), CAST(21.90 AS Decimal(18, 2)), N'在库', 3)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (26, N'笑场', N'李诞', N' 湖南文艺出版社', N'bookc20.jpg', N'现推出精装典藏版回馈各界读者厚爱！收录了网络上脍炙人口的《扯经》系列、奇趣故事，以及李诞近年来的多篇随笔散文。看似天马行空、光怪陆离的故事中蕴含引人反复玩味的道理。从不同角色的口中描绘出了一幅荒诞而又耐人寻味的人生浮世绘。', CAST(0x0000A7C200000000 AS DateTime), CAST(33.80 AS Decimal(18, 2)), N'在库', 3)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (27, N'一只特立独行的猪', N'王小波 ', N'北京十月文艺出版社', N'bookc21.jpg', N'王小波杂文精选集，逝世二十周年精装纪念版！幽默中充满智性，扛起一面自由、独立、理性的精神旗帜！——“我觉得黑色幽默是我的气质，是天生的。”', CAST(0x0000A74800000000 AS DateTime), CAST(23.30 AS Decimal(18, 2)), N'在库', 3)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (28, N'三毛传', N'程碧', N'北方文艺出版社', N'bookc22.jpg', N'◎ 畅销书作家程碧全面还原了三毛的一生，讲了别人没讲过没讲透的那个三毛。她的流浪、旅行、爱情、友情、居所、厨房、收藏、鞋子、衣服、车子……以及她热爱的沙漠和岛屿，她的快乐和悲苦，她的明媚与阴霾，以及与与荷西、林青霞、齐豫、潘越云、王洛宾、李敖、顾福生等人的往事恩怨。', CAST(0x0000A8F200000000 AS DateTime), CAST(30.90 AS Decimal(18, 2)), N'外借', 4)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (29, N'李清照：酒意诗情谁与共', N'江徐', N'江苏凤凰文艺出版社', N'bookc23.jpg', N'《李清照：酒意诗情谁与共》（赠《李清照全集》），诗意还原“千古才女”“一代词宗”李清照的传奇一生。', CAST(0x0000A8D300000000 AS DateTime), CAST(28.90 AS Decimal(18, 2)), N'在库', 4)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (30, N'不东：世界小邮差、互联网创业家文厨问道十年精华笔记', N'文厨', N'中信出版社 ', N'bookc24.jpg', N'不东，是唐玄奘西行取经时许下的宏愿，意为“不取真经，不回东土大唐”。不东，是唐玄奘西行取经时许下的宏愿，意为“不取真经，不回东土大唐”。不东，是唐玄奘西行取经时许下的宏愿，意为“不取真经，不回东土大唐”。', CAST(0x0000A8B500000000 AS DateTime), CAST(31.20 AS Decimal(18, 2)), N'在库', 4)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (31, N'苏东坡传', N'林语堂', N'湖南文艺出版社', N'bookc25.jpg', N'本书是一部传记，讲述了苏东坡是一个秉性难改的乐天派，是悲天悯人的道德家，是散文作家，是新派的画家，是伟大的书法家，是酿酒的实验者，是工程师，是假道学的反对派，是瑜伽术的修炼者，是佛教徒，是士大夫，是皇帝的秘书，是饮酒成性者，是心肠慈悲的法官，是政治上的坚持己见者，是月下的漫步者，是诗人，是生性诙谐爱开玩笑的人。从各个方面讲述了苏东坡的全部。本书内容详实，图文并茂，值得读者收藏。', CAST(0x0000A85B00000000 AS DateTime), CAST(31.80 AS Decimal(18, 2)), N'在库', 4)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (32, N'且以优雅过一生：杨绛传', N'桑妮', N'湖南文艺出版社', N'bookc26.jpg', N'她虽生于乱世，却自始至终怀有一颗与世无争之心。外界给了她颇多赞誉——坚韧、从容、睿智、宁静……但这些于她不过浮华如花，开过即谢，她并不曾为此动容，不曾改变过一分一毫。她始终还是那个如深谷幽兰般的女子，在岁月里温婉如初。', CAST(0x0000A67400000000 AS DateTime), CAST(28.50 AS Decimal(18, 2)), N'在库', 4)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (34, N'人类群星闪耀时', N'茨威格', N'国际文化出版公司', N'bookc27.jpg', N'斯蒂芬·茨威格是历史上好的传记作家，《人类群星闪耀时》是它的传世杰作，通过截取麦哲伦、拿破仑、歌德、托尔斯泰等十二位伟人的光芒闪耀的时刻，来展现它们对一个人的生死、一个民族的存亡甚至整个人类的命运的影响。群星闪耀的时刻并不经常出现，但毫无疑问，在我们的时代，它即将来临。茨威格用它那崇高、炽热的文字描绘出群星闪耀的时刻，而这些时刻也因他而绽放出更加璀璨夺目的光彩。 ', CAST(0x0000A5DB00000000 AS DateTime), CAST(17.50 AS Decimal(18, 2)), N'在库', 4)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (35, N'邓小平传', N' 理查德·伊文思', N'国际文化出版公司', N'bookc28.jpg', N'西方邓小平研究专家、英国前驻华大使理查德·伊文思（Richard Evans），与邓小平多次面对面接触，三十年心血力作，全方位揭秘鲜为人知的邓小平！', CAST(0x0000A15800000000 AS DateTime), CAST(47.30 AS Decimal(18, 2)), N'在库', 4)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (36, N'三体：地球往事', N'刘慈欣', N'重庆出版社', N'bookc29.jpg', N'《三体》讲的是在文化大革命如火如荼进行的同时，军方探寻外星文明的绝秘计划“红岸工程”取得了突破性进展。但在按下发射键的那一刻，历经劫难的叶文洁没有意识到，她彻底改变了人类的命运。地球文明向宇宙发出的头一声啼鸣，以太阳为中心，以光速向宇宙深处飞驰…… ', CAST(0x00009A1600000000 AS DateTime), CAST(13.50 AS Decimal(18, 2)), N'在库', 5)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (38, N'三体（2）黑暗森林', N'刘慈欣', N'重庆出版社', N'bookc30.jpg', N'《三体2：黑暗森林》讲述的是光年尺度下的生存推理，虽说《三体2：黑暗森林》是科幻小说，但书中的推理成分是如此之多，以致于我在写这篇书评的时候都要小心翼翼不能泄底。在三体人准备侵略地球的这段时间里，人类当然不会坐以待毙，利用三体人思维透明的致命缺陷，制订了神秘莫测的“面壁计划”，精选出四位“面壁者”，希望以此展开对三体人的反击。 ', CAST(0x00009A8F00000000 AS DateTime), CAST(18.80 AS Decimal(18, 2)), N'在库', 5)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (39, N'三体（3）死神永生', N'刘慈欣', N'重庆出版社', N'bookc31.jpg', N'与三体文明的战争使人类首次看到了宇宙黑暗的真相，地球文明像一个恐惧的孩子，熄灭了寻友的篝火，在暗夜中发抖。 自以为历经沧桑，其实刚刚蹒跚学步；自以为悟出了生存竞争的秘密，其实还远没有竞争的资格。 使两个文明命悬一线的黑暗森林打击，不过是宇宙战场上的一个微不足道的插曲，一个在战场上乱跑的无知孩童被堑壕中的juji手射杀，仅此而已。 真正的星际战争没人见过，也不可能见到。因为战争的方式和武器已经远超出人类的想象，目睹战场之日，就是灭亡之时。 人类没有想到，面对这巨大的存在，从社会学的结论，却可以推导出宇宙学的结果。 宇宙的田园时代已经远去，那时，万物的美曾昙花一现，现在已经变成任何大脑和智慧体都无法做出的梦，变成游吟诗人飘渺的残歌；宇宙的物竞天择已到了惨烈的时刻，在亿万光年暗无天日的战场上，深渊最底层的毁灭力量被唤醒，太空变成了死神广阔的披风。 太阳系中的人们永远不会知道这一切，最后面对真相的，只有两双眼睛。', CAST(0x00009E2100000000 AS DateTime), CAST(22.40 AS Decimal(18, 2)), N'在库', 5)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (40, N'一只黑猩猩的宇宙史', N'施英巍', N'吉林美术出版社', N'bookc32.jpg', N'世界上驾驶载人飞船进入太空，并活着回来的地球生命，并非人类，而是一只名叫哈姆的黑猩猩。本书根据黑猩猩哈姆的太空探索编写，细致入微地描述了哈姆怎样成为候选者，怎样来到美国空军的军事基地，怎样接受严酷的专业训练，怎么爆发出人性等。全书笔触细腻，故事生动，感人肺腑，催人泪下，同时，又令人激情澎湃，心怀壮志。奇妙的是，书中各处都结合着伟大的物理学家斯蒂芬?威廉?霍金的理论，读者在轻松阅读时，不仅能获得精神上的享受，还能在不知不觉中学到当今世界尖端的物理知识。', CAST(0x0000AA2200000000 AS DateTime), CAST(36.10 AS Decimal(18, 2)), N'在库', 5)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (41, N'银河界区三部曲1：深渊上的火', N'弗诺·文奇', N'北京联合出版公司', N'bookc33.jpg', N'千万年后，在新的宇宙秩序下，银河系以“零意识深渊”为核心，一分为三，依次分为爬行界、飞跃界和超限界，文明发展程度依次升高。地球不再特殊，人类不再是食物链顶端wei一的智慧生物。飞跃界中数以百万计的种族都曾试图探索超限界，斯特劳姆人是其中之一。他们建起“超限实验室”，想方设法唤醒沉睡50亿年的资料巨库，企图由此换来富庶和飞升。然而，他们只想到了美好，超智巨库醒来时，没有一个人能猜出真相：他们唤醒的东西——瘟疫，将十亿个星系的未来拖入危机……', CAST(0x0000AA7D00000000 AS DateTime), CAST(74.10 AS Decimal(18, 2)), N'在库', 5)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (42, N'银河界区三部曲2：天渊', N'弗诺·文奇', N'北京联合出版公司', N'bookc34.jpg', N'经过长久的探索，人类终于在阿拉尼克星上发现了外星文明。这颗星球以开关星为太阳，每35年获得太阳照射后，便会陷入长达250年之久的黑暗隆冬。地表文明蜘蛛人，严格遵循自然定律，艰难生存。两大人类集团——青河人与易莫金人，怀揣不同企图先后抵达开关星系。青河人希望与蜘蛛人进行自由贸易，实现共赢；易莫金人表面上与青河人达成同盟，暗地里却阴谋背叛，他们机关算尽，唯独忽略了一个人：那个隐藏在青河人中间的传奇人物——范·纽文。与此同时，天才蜘蛛人昂德希尔不甘沦落他人股掌，不顾传统派反对，将目光投向宇宙，寻觅可以帮助蜘蛛人摆脱困境的方法，却无意间收到了来自青河神秘人的信号……', CAST(0x0000AA7D00000000 AS DateTime), CAST(93.10 AS Decimal(18, 2)), N'在库', 5)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (43, N'银河界区三部曲3：天空的孩子', N'弗诺·文奇', N' 北京联合出版公司', N'bookc35.jpg', N'十年前，一艘满载人类科学家后代的飞船抵达爬行界。瘟疫舰队紧追不放，人类激活反制手段，界区震荡。瘟疫被困三十光年之外，人类也被迫困守科技尚未起步的爪族世界。范·纽文拯救了人类孩子和无数文明后死去。过去十年间，wei一幸存的成年人类拉芙娜·伯格森多陆续将一百五十个孩子从冷冻长眠中唤醒。在她的庇护之下，孩子们一天天长大。与此同时，同一颗星球上的两个智慧物种决定合作共生，人类将携手爪族，重建文明，重返科技dian峰。然而，天空的孩子没有记忆。随着他们长大成人，很多孩子不相信父母曾铸成大错，否认瘟疫是邪恶的，怀疑范不是英雄。他们勾结王国的一切敌对势力，意图推翻拉芙娜的领导。人类分裂成两个阵营，内战一触即发……', CAST(0x0000AA7D00000000 AS DateTime), CAST(74.10 AS Decimal(18, 2)), N'在库', 5)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (44, N'白夜行', N'东野圭吾', N'南海出版公司', N'bookc36.jpg', N'《白夜行》是东野圭吾当之无愧的鸿篇巨制，全书故事跨越19年时间，登场人物超过50个，草蛇灰线伏脉千里，情节线索纵横交错又丝丝入扣，用一桩离奇命案牵出案件相关人跨越19年惊心动魄的故事、悲凉的爱情、吊诡的命运、令人发指的犯罪、白描又生动的社会图景、复杂人性的对决与救赎，读来令人叹为观止。', CAST(0x0000A7A300000000 AS DateTime), CAST(59.60 AS Decimal(18, 2)), N'在库', 6)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (45, N'解忧杂货店', N'东野圭吾', N'南海出版公司', N'bookc37.jpg', N'僻静的街道旁有一家杂货店，只要写下烦恼投进店前门卷帘门的投信口，第二天就会在店后的牛奶箱里得到回答：因男友身患绝症，年轻女孩静子在爱情与梦想间徘徊；克郎为了音乐梦想离家漂泊，却在现实中寸步难行；少年浩介面临家庭巨变，挣扎在亲情与未来的迷茫中……他们将困惑写成信投进杂货店，奇妙的事情随即不断发生。生命中的一次偶然交会，将如何演绎出截然不同的人生？', CAST(0x0000A37A00000000 AS DateTime), CAST(39.50 AS Decimal(18, 2)), N'在库', 6)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (47, N'漫长的告别', N'雷蒙德·钱德勒 ', N'海南出版社', N'bookc38.jpg', N'《漫长的告别》是真正意义上的灵魂交流的故事，是人与人之间自发地相互理解的故事，是人类抱有的美好幻想和它不可避免地引发的深深幻灭的故事。——村上春树一个神秘优雅的迷人酒鬼，一个孤独不羁的硬汉侦探。一杯酒，一个承诺，一场男人之间的友谊。一张巨额钞票，一个美梦，一连串谋杀，一个谜，一次漫长的告别。说一声再见，就是死去一点点。', CAST(0x0000A94E00000000 AS DateTime), CAST(65.50 AS Decimal(18, 2)), N'在库', 6)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (48, N'尸人庄谜案', N'今村昌弘', N'北京联合出版公司', N'bookc39.jpg', N'社团活动室内，有人发现一张纸条，上面写着“今年谁来当祭品?”，14名男女参加某社团的夏季合宿，仅仅一个半小时中，情形急转直下。14人各怀叵测，却遭遇生死极限般的超现实袭击，众人被困于孤岛山庄，在与外界隔绝的封闭空间内，离奇的命案竟接踵而来……完美的场所，奇异的手段，熊熊燃烧的憎恶之火，这一切都是神的恶作剧，还是恶魔般的天启？以仇恨之名操纵命运之人，也终将被仇恨所吞噬！', CAST(0x0000AABB00000000 AS DateTime), CAST(45.60 AS Decimal(18, 2)), N'在库', 6)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (50, N'网内人', N'陈浩基', N'九州出版社', N'bookc40.jpg', N'14岁的女中学生曲雅雯死了，她从二十二楼坠下，警察说是自杀，但她的姐姐阿怡知道，小雯是被“杀死”的。毕竟她在去世前，才因为一起性骚扰案遭到网络霸凌，姓名、学校都被公开，一个网名“kidkit727”的网民以骚扰犯外甥的名义对她发动攻击，声称她是诬告。小雯每天忍受着网友不堪的辱骂和陌生人恶毒的眼光。为找出背后攻击小雯致使她自杀的始作俑者，阿怡找上了神秘的无牌侦探阿涅，阿涅茧居在破落的旧大楼里，生活邋遢、性情乖戾，却拥有超凡的黑客技术。他很快缩小了调查范围，推断幕后黑手就隐藏在小雯身边，小雯的死会是校园霸凌的恶性后果吗？但随着真相一层层剥开，阿怡心底那个“妹妹”的形象却渐渐模糊。不知不觉中，她陷入亲情与谎言的迷障里无法抽身，而罪与罚的天平也开始倾斜，急速倒向难以意料的结局。', CAST(0x0000AA9C00000000 AS DateTime), CAST(46.50 AS Decimal(18, 2)), N'在库', 6)
INSERT [dbo].[Book] ([Id], [Name], [Authors], [Press], [ImageUrl], [Description], [PublishDate], [Price], [Status], [Category_Id]) VALUES (51, N'预知梦', N'东野圭吾', N'南海出版公司', N'bookc41.jpg', N'十岁时，我梦到一个叫森崎礼美的女孩。我喜欢上了她，她对我说将来一定会和我结婚。十七年过去，礼美真的出现了！她给我写信，约我晚上悄悄去她家里，商量我们的未来。我半夜醒来，看到对面那栋楼有一个身穿红衣的女人把绳圈套在脖子上，跳下了台子。到了早上，那个女人居然出现在阳台，面带笑容地打着电话。三天后，警察突然来到我家调查，说对面那个女人前一天晚上上吊自杀了。我的梦又被人设计了。', CAST(0x0000AA5F00000000 AS DateTime), CAST(47.00 AS Decimal(18, 2)), N'在库', 6)
SET IDENTITY_INSERT [dbo].[Book] OFF
/****** Object:  Table [dbo].[Borrow]    Script Date: 12/05/2019 09:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrow](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Reader_Id] [int] NOT NULL,
	[Book_Id] [int] NOT NULL,
	[BorrowTime] [datetime2](7) NOT NULL,
	[ReturnTime] [datetime2](7) NULL,
	[NeedReturnTime] [datetime2](7) NOT NULL,
	[Renew] [int] NULL,
	[BorrowStatu] [nvarchar](50) NULL,
 CONSTRAINT [PK__Borrow__3214EC070AD2A005] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Borrow] ON
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (1, 1, 1, CAST(0x075D814D11B857400B AS DateTime2), CAST(0x073FA00F47795A400B AS DateTime2), CAST(0x075D814D11B875400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (5, 1, 4, CAST(0x07FE3ED873B058400B AS DateTime2), CAST(0x07431DD9488C5B400B AS DateTime2), CAST(0x07FE3ED873B076400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (7, 1, 5, CAST(0x079CA4622E5459400B AS DateTime2), CAST(0x0761CE9B9CB35C400B AS DateTime2), CAST(0x079CA4622E5477400B AS DateTime2), 1, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (8, 1, 6, CAST(0x0781CBBE5A5559400B AS DateTime2), CAST(0x072643A99AB35C400B AS DateTime2), CAST(0x0781CBBE5A5577400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (9, 1, 29, CAST(0x0718BABA66B05C400B AS DateTime2), CAST(0x07E2CE54175F5D400B AS DateTime2), CAST(0x0718BABA66B07A400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (10, 1, 31, CAST(0x07EC73D0C5B15C400B AS DateTime2), CAST(0x07ECDCA165735D400B AS DateTime2), CAST(0x07EC73D0C5B15C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (11, 1, 36, CAST(0x07DEDFEF885D5D400B AS DateTime2), CAST(0x07A35BAD59735D400B AS DateTime2), CAST(0x07DEDFEF885D7B400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (12, 1, 1, CAST(0x07EBD2264C745D400B AS DateTime2), CAST(0x0740D1BD54755D400B AS DateTime2), CAST(0x07EBD2264C747B400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (13, 1, 1, CAST(0x071C9CF97F755D400B AS DateTime2), CAST(0x07F48E6C83755D400B AS DateTime2), CAST(0x071C9CF97F757B400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (14, 1, 6, CAST(0x07D6FEE7AD755D400B AS DateTime2), CAST(0x07A6325DB2755D400B AS DateTime2), CAST(0x07D6FEE7AD757B400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (15, 1, 1, CAST(0x078E52B507765D400B AS DateTime2), CAST(0x07446BD130535E400B AS DateTime2), CAST(0x078E52B507769A400B AS DateTime2), 1, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (16, 1, 4, CAST(0x076A30874A765D400B AS DateTime2), CAST(0x07FA6C5A4F535E400B AS DateTime2), CAST(0x076A30874A767B400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (17, 1, 1, CAST(0x074EBF6159535E400B AS DateTime2), CAST(0x0783E4493AA664400B AS DateTime2), CAST(0x074EBF6159539A400B AS DateTime2), 1, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (18, 1, 4, CAST(0x074EBF6159535E400B AS DateTime2), CAST(0x0704DE6D97606C400B AS DateTime2), CAST(0x074EBF6159539A400B AS DateTime2), 1, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (19, 1, 5, CAST(0x0705D2885E535E400B AS DateTime2), CAST(0x07EE5D60AC7070400B AS DateTime2), CAST(0x0705D2885E537C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (20, 1, 6, CAST(0x071DFBDCA05B5E400B AS DateTime2), CAST(0x07CCADFFAD7070400B AS DateTime2), CAST(0x071DFBDCA05B7C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (21, 1, 23, CAST(0x07EBEBA4F5875E400B AS DateTime2), CAST(0x0777577BAF7070400B AS DateTime2), CAST(0x07EBEBA4F5877C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (22, 1, 12, CAST(0x07C86D9405885E400B AS DateTime2), CAST(0x071FA4E4B07070400B AS DateTime2), CAST(0x07C86D9405887C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (23, 1, 15, CAST(0x072FF6CABC8B5E400B AS DateTime2), CAST(0x075CF41CA47264400B AS DateTime2), CAST(0x072FF6CABC8B7C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (24, 1, 15, CAST(0x0772DE9CC58B5E400B AS DateTime2), CAST(0x07C73B4581965E400B AS DateTime2), CAST(0x0772DE9CC58B7C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (25, 1, 15, CAST(0x07300F38D38C5E400B AS DateTime2), CAST(0x0775089584965E400B AS DateTime2), CAST(0x07300F38D38C7C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (26, 1, 15, CAST(0x07C4342F498E5E400B AS DateTime2), CAST(0x079F81BD89965E400B AS DateTime2), CAST(0x07C4342F498E7C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (27, 1, 21, CAST(0x07417299468F5E400B AS DateTime2), CAST(0x07B67C3FB27070400B AS DateTime2), CAST(0x07417299468F7C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (28, 1, 44, CAST(0x07F47AD673955E400B AS DateTime2), CAST(0x079BBBA2B37070400B AS DateTime2), CAST(0x07F47AD673957C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (29, 1, 48, CAST(0x07B564D773955E400B AS DateTime2), CAST(0x07CE81F894965E400B AS DateTime2), CAST(0x07B564D773957C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (30, 1, 44, CAST(0x07149C9A75955E400B AS DateTime2), CAST(0x07F848289A965E400B AS DateTime2), CAST(0x07149C9A75957C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (31, 1, 48, CAST(0x07DF389B75955E400B AS DateTime2), CAST(0x078DDFFBB47070400B AS DateTime2), CAST(0x07DF389B75957C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (32, 1, 47, CAST(0x0749B33EDE955E400B AS DateTime2), CAST(0x078615888E965E400B AS DateTime2), CAST(0x0749B33EDE957C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (33, 1, 45, CAST(0x07EADF43DE955E400B AS DateTime2), CAST(0x07911867857C71400B AS DateTime2), CAST(0x07EADF43DE959A400B AS DateTime2), 1, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (34, 1, 47, CAST(0x07FC32FDDF955E400B AS DateTime2), CAST(0x07D9484C30A670400B AS DateTime2), CAST(0x07FC32FDDF955E400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (35, 1, 45, CAST(0x07DDA7FDDF955E400B AS DateTime2), CAST(0x07BFD93F7E965E400B AS DateTime2), CAST(0x07DDA7FDDF957C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (36, 1, 29, CAST(0x07754F969F965E400B AS DateTime2), CAST(0x07313540A3A16F400B AS DateTime2), CAST(0x07754F969F967C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (37, 1, 22, CAST(0x07A1A45B806C62400B AS DateTime2), CAST(0x07134CC78A6C62400B AS DateTime2), CAST(0x07213BF4806C62400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (38, 1, 40, CAST(0x073D7770806C62400B AS DateTime2), CAST(0x07B08E837A6D62400B AS DateTime2), CAST(0x07BD0D09816C62400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (39, 1, 36, CAST(0x070CEB70806C62400B AS DateTime2), CAST(0x07486AAD7F7162400B AS DateTime2), CAST(0x078C8109816C62400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (40, 1, 22, CAST(0x0785449B9C7162400B AS DateTime2), CAST(0x07F7111AAC7162400B AS DateTime2), CAST(0x0705DB339D7162400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (41, 1, 22, CAST(0x0799700B067562400B AS DateTime2), CAST(0x07AF5528F59D62400B AS DateTime2), CAST(0x071907A4067562400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (42, 1, 19, CAST(0x07403F4ED17562400B AS DateTime2), CAST(0x076D6B14059663400B AS DateTime2), CAST(0x07C0D5E6D17562400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (43, 1, 19, CAST(0x0724B68DBB9763400B AS DateTime2), CAST(0x07731BBBC19763400B AS DateTime2), CAST(0x07A44C26BC9763400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (44, 1, 19, CAST(0x078284EC049B63400B AS DateTime2), CAST(0x070B64C87D9B63400B AS DateTime2), CAST(0x07021B85059B63400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (45, 1, 19, CAST(0x0702B9E9519C63400B AS DateTime2), CAST(0x07E47C82699C63400B AS DateTime2), CAST(0x07824F82529C63400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (46, 1, 13, CAST(0x07E82DEA519C63400B AS DateTime2), CAST(0x07167B7A5C9C63400B AS DateTime2), CAST(0x0768C482529C63400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (47, 1, 44, CAST(0x07EF6DB5689D63400B AS DateTime2), CAST(0x0735C26D6B9F63400B AS DateTime2), CAST(0x076F044E699D63400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (48, 1, 28, CAST(0x0763F3B6689D63400B AS DateTime2), CAST(0x071CB940679F63400B AS DateTime2), CAST(0x07E3894F699D63400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (49, 1, 38, CAST(0x076C91B7689D63400B AS DateTime2), CAST(0x07DE37EB8D9D63400B AS DateTime2), CAST(0x07EC2750699D63400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (50, 1, 36, CAST(0x07DEB3C0AF7264400B AS DateTime2), CAST(0x07CFE49BBE7264400B AS DateTime2), CAST(0x075E4A59B07264400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (51, 1, 13, CAST(0x073D78684D7664400B AS DateTime2), CAST(0x07301E83547664400B AS DateTime2), CAST(0x07BD0E014E7664400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (52, 1, 1, CAST(0x07918984BF586C400B AS DateTime2), CAST(0x070A5DE98FA16F400B AS DateTime2), CAST(0x0711201DC0586C400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (53, 1, 1, CAST(0x071F19DFE56D70400B AS DateTime2), CAST(0x07C08166827C71400B AS DateTime2), CAST(0x079FAF77E66D70400B AS DateTime2), 0, N'已归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (54, 1, 4, CAST(0x07F13C3C40A570400B AS DateTime2), NULL, CAST(0x0771D3D440A570400B AS DateTime2), 0, N'未归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (55, 1, 28, CAST(0x075687D4737C71400B AS DateTime2), NULL, CAST(0x07D61D6D747C71400B AS DateTime2), 0, N'未归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (56, 1, 5, CAST(0x07B4532F407572400B AS DateTime2), NULL, CAST(0x07B4532F407591400B AS DateTime2), 0, N'未归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (57, 1, 6, CAST(0x0729CE34407572400B AS DateTime2), NULL, CAST(0x0729CE34407591400B AS DateTime2), 0, N'未归还')
INSERT [dbo].[Borrow] ([Id], [Reader_Id], [Book_Id], [BorrowTime], [ReturnTime], [NeedReturnTime], [Renew], [BorrowStatu]) VALUES (58, 1, 13, CAST(0x078BE8A4647572400B AS DateTime2), NULL, CAST(0x078BE8A4647591400B AS DateTime2), 0, N'未归还')
SET IDENTITY_INSERT [dbo].[Borrow] OFF
/****** Object:  Table [dbo].[Fine]    Script Date: 12/05/2019 09:17:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Reader_Id] [int] NOT NULL,
	[Borrow_Id] [int] NOT NULL,
	[FineTime] [datetime2](7) NOT NULL,
	[why] [nvarchar](250) NOT NULL,
	[FineMoney] [decimal](18, 2) NOT NULL,
	[PayFineTime] [datetime2](7) NULL,
 CONSTRAINT [PK__Fine__3214EC070EA330E9] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Fine] ON
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (19, 1, 37, CAST(0x07FB99C78A6C62400B AS DateTime2), N'超时', CAST(0.00 AS Decimal(18, 2)), CAST(0x07380115757562400B AS DateTime2))
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (20, 1, 38, CAST(0x0742ED847A6D62400B AS DateTime2), N'超时', CAST(0.36 AS Decimal(18, 2)), CAST(0x07776CB71D6F62400B AS DateTime2))
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (21, 1, 39, CAST(0x07754EB07F7162400B AS DateTime2), N'超时', CAST(0.13 AS Decimal(18, 2)), CAST(0x07B89879877162400B AS DateTime2))
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (22, 1, 40, CAST(0x07DF381AAC7162400B AS DateTime2), N'超时', CAST(0.43 AS Decimal(18, 2)), CAST(0x070454C4457262400B AS DateTime2))
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (23, 1, 41, CAST(0x0789CB28F59D62400B AS DateTime2), N'超时', CAST(0.43 AS Decimal(18, 2)), CAST(0x07FF5C6A0F9563400B AS DateTime2))
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (24, 1, 42, CAST(0x0744E014059663400B AS DateTime2), N'超时', CAST(0.42 AS Decimal(18, 2)), CAST(0x073929BE1E9763400B AS DateTime2))
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (25, 1, 43, CAST(0x07B4D8BDC19763400B AS DateTime2), N'超时', CAST(0.42 AS Decimal(18, 2)), CAST(0x07F63A4C859963400B AS DateTime2))
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (26, 1, 44, CAST(0x072BB3C87D9B63400B AS DateTime2), N'超时', CAST(0.42 AS Decimal(18, 2)), CAST(0x07B753F1449C63400B AS DateTime2))
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (27, 1, 46, CAST(0x0746A37A5C9C63400B AS DateTime2), N'超时', CAST(0.36 AS Decimal(18, 2)), CAST(0x072BE912DC9C63400B AS DateTime2))
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (28, 1, 45, CAST(0x07D8A382699C63400B AS DateTime2), N'超时', CAST(0.42 AS Decimal(18, 2)), CAST(0x079E55B0209D63400B AS DateTime2))
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (29, 1, 49, CAST(0x07FB69EE8D9D63400B AS DateTime2), N'超时', CAST(0.18 AS Decimal(18, 2)), CAST(0x07BC6620989D63400B AS DateTime2))
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (30, 1, 48, CAST(0x074C2E41679F63400B AS DateTime2), N'超时', CAST(0.30 AS Decimal(18, 2)), CAST(0x07291E086F9F63400B AS DateTime2))
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (31, 1, 47, CAST(0x0731E96D6B9F63400B AS DateTime2), N'超时', CAST(0.59 AS Decimal(18, 2)), CAST(0x07532B038D7264400B AS DateTime2))
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (32, 1, 50, CAST(0x07C10B9CBE7264400B AS DateTime2), N'超时', CAST(0.13 AS Decimal(18, 2)), CAST(0x0707AE3DC17264400B AS DateTime2))
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (33, 1, 51, CAST(0x07106C83547664400B AS DateTime2), N'超时', CAST(0.36 AS Decimal(18, 2)), CAST(0x0793A51B5C7664400B AS DateTime2))
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (34, 1, 52, CAST(0x07CE0BEB8FA16F400B AS DateTime2), N'超时', CAST(1.36 AS Decimal(18, 2)), CAST(0x070CE260A8A16F400B AS DateTime2))
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (35, 1, 34, CAST(0x0717FC4E30A670400B AS DateTime2), N'超时', CAST(11.79 AS Decimal(18, 2)), CAST(0x076068126E7C71400B AS DateTime2))
INSERT [dbo].[Fine] ([Id], [Reader_Id], [Borrow_Id], [FineTime], [why], [FineMoney], [PayFineTime]) VALUES (36, 1, 53, CAST(0x078F4467827C71400B AS DateTime2), N'超时', CAST(0.45 AS Decimal(18, 2)), CAST(0x0752DB92907C71400B AS DateTime2))
SET IDENTITY_INSERT [dbo].[Fine] OFF
/****** Object:  ForeignKey [FK_Book_Category]    Script Date: 12/05/2019 09:17:06 ******/
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
/****** Object:  ForeignKey [FK_Borrow_Book]    Script Date: 12/05/2019 09:17:06 ******/
ALTER TABLE [dbo].[Borrow]  WITH CHECK ADD  CONSTRAINT [FK_Borrow_Book] FOREIGN KEY([Book_Id])
REFERENCES [dbo].[Book] ([Id])
GO
ALTER TABLE [dbo].[Borrow] CHECK CONSTRAINT [FK_Borrow_Book]
GO
/****** Object:  ForeignKey [FK_Borrow_Reader]    Script Date: 12/05/2019 09:17:06 ******/
ALTER TABLE [dbo].[Borrow]  WITH CHECK ADD  CONSTRAINT [FK_Borrow_Reader] FOREIGN KEY([Reader_Id])
REFERENCES [dbo].[Reader] ([Id])
GO
ALTER TABLE [dbo].[Borrow] CHECK CONSTRAINT [FK_Borrow_Reader]
GO
/****** Object:  ForeignKey [FK_Fine_Borrow]    Script Date: 12/05/2019 09:17:06 ******/
ALTER TABLE [dbo].[Fine]  WITH CHECK ADD  CONSTRAINT [FK_Fine_Borrow] FOREIGN KEY([Borrow_Id])
REFERENCES [dbo].[Borrow] ([Id])
GO
ALTER TABLE [dbo].[Fine] CHECK CONSTRAINT [FK_Fine_Borrow]
GO
/****** Object:  ForeignKey [FK_Fine_Reader]    Script Date: 12/05/2019 09:17:06 ******/
ALTER TABLE [dbo].[Fine]  WITH CHECK ADD  CONSTRAINT [FK_Fine_Reader] FOREIGN KEY([Reader_Id])
REFERENCES [dbo].[Reader] ([Id])
GO
ALTER TABLE [dbo].[Fine] CHECK CONSTRAINT [FK_Fine_Reader]
GO
