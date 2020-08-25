SET NAMES UTF8;
#创建数据库
DROP DATABASE IF EXISTS cake;
#创建数据库cake,并规定字符集为utf8
CREATE DATABASE cake CHARSET=UTF8;
#进入数据库
USE cake;
#创建蛋糕目录表Directory
CREATE TABLE Directory(
    id INT PRIMARY KEY AUTO_INCREMENT,
    cname VARCHAR(200),#蛋糕名字
    ctitle VARCHAR(200),#蛋糕标题
    csize VARCHAR(50),#蛋糕规格
    cprice DECIMAL(7,2) NOT NULL,#蛋糕价格
    cpic VARCHAR(128),#图片
    clsid INT#蛋糕类型
);
INSERT INTO Directory VALUES (null,"Christmas Tree  一颗圣诞树","马卡龙与姜饼人，是悬挂的礼物；各类水果与装饰金珠，是五彩点缀。造型与真正的圣诞树相仿，别致而富有创意。","1.5磅：约23*15cm","238.00","52.jpg",2);
INSERT INTO Directory VALUES (null,"Christmas Tree 经典圣诞树","乳脂奶油伴着少许巧克力，搭配时令鲜果，及臻于传奇的烘焙技艺，终于让「经典圣诞树」惟妙重现。","1磅：约13x13cm","198.00","53.jpg",2);
INSERT INTO Directory VALUES (null,"Christmas Gift 圣诞花盒","我们特别准备了圣诞专属花盒。红玫瑰，红豆，搭配刺芹，在热烈的爱情中，有相思，有守候。富贵的大花蕙兰与优雅的洋牡丹，衬托着圣诞节的温馨与祥和。","尺寸：直径约25cm","238.00","54.jpg",8);
INSERT INTO Directory VALUES (null,"圣诞礼盒系列","在「花盒」赏心悦目的同时，仔细品尝美食，回味玫瑰香气。 特别提示：花盒中所含鲜花仅为装饰，不可食用。","1磅：约13x13cm","298.00","55.jpg",8);
INSERT INTO Directory VALUES (null,"玫瑰蛋糕礼盒-Dream","每一款使用马斯卡彭乳酪的蛋糕，觉非平凡。纯粹手工雕花，搭配 R.Gallica玫瑰。装饰不足以诠释爱的定义，却真正用心。特别提示：花盒中所含鲜花仅为装饰，不可食用。","1磅：13x13cm","388.00","1.jpg",8);
INSERT INTO Directory VALUES (null,"玫瑰蛋糕礼盒-爱尔兰玫瑰 Irish Rose","一款从艺术角度精心雕琢的，「爱尔兰玫瑰」搭配法国R.Gallica玫瑰，真正用心。 特别提示：花盒中所含鲜花仅为装饰，不可食用。","1磅：13x13cm","288.00","2.jpg",8);
INSERT INTO Directory VALUES (null,"玫瑰蛋糕礼盒-百利甜情人 Baileys Irish Lover","纯鲜乳脂奶油调入百利甜酒，在打发奶油的同时调入玫瑰甘露，加入花瓣蜜饯，时令新鲜水果夹心。全新的「百利甜情人」，搭配R.Gallica玫瑰，让浪漫成为情人节的主题旋律。 特别提示：花盒中所含鲜花仅为装饰，不可食用。","1磅：13x13cm","288.00","3.jpg",8);
INSERT INTO Directory VALUES (null,"玫瑰蛋糕礼盒-倾心 Fall In Love","用榛子酱与乳脂奶油混合打发，制作榛子慕斯，加入秘制覆盆子果茸与榛子巧克力脆，搭配R.Gallica玫瑰，正如为之倾心的那一刻，是喜悦，亦是忐忑。 特别提示：花盒中所含鲜花仅为装饰，不可食用。","1磅：13x13cm","388.00","4.jpg",8);
INSERT INTO Directory VALUES (null,"玫瑰蛋糕礼盒-冰山玫瑰 Iceberg rose","红白玫瑰相配，呈现出纯粹，简单热情潜伏于冰雪，时间沉淀成记忆。即使世界冻结，依旧为你盛放。 特别提示：花盒中所含鲜花仅为装饰，不可食用。","1磅：13x13cm","288.00","5.jpg",8);
INSERT INTO Directory VALUES (null,"Strawberry Pistachio日式草莓淡奶","用开心果碎作为装饰，以及草莓慕斯夹层中的开心果薄脆，为奶油与草莓增加了更丰富的味蕾层次。表面摆放大颗「红颜」草莓，带来超乎寻常的满足感。","1磅：直径约13cm","198.00","6.jpg",2);
INSERT INTO Directory VALUES (null,"Strawberry 百瑞","蜜蜂授粉，自然成熟，优质有机草莓。从采摘到食用，不超过1天。感受「百瑞」，凌晨五时三刻的新鲜。","1磅：13x13cm","198.00","7.jpg",2);
INSERT INTO Directory VALUES (null,"Strawberry Napoleon 草莓拿破仑","相得益彰。不止是点缀，草莓的酸甜与清爽，别具一格。接受对新鲜有机草莓，新的诠释。","1磅：13x13cm","198.00","8.jpg",2);
INSERT INTO Directory VALUES (null,"Mango Cream 日式芒果淡奶","当季最佳品质芒果，裹上一层新来自西兰草原牧场的乳脂奶油，日式极简风格，回归芒果与奶油的本来味道。","1磅：直径约13cm","198.00","9.jpg",2);
INSERT INTO Directory VALUES (null,"Strawberry Gelato 草莓冰淇淋蛋糕","保持一丝不苟的Gelato品质，融合了最受欢迎的草莓元素。装饰几颗草莓与蓝莓鲜果，和少许玫瑰碎瓣，冰冷的口感却不失浪漫情怀。","1.5磅：直径约13cm","198.00","10.jpg",2);
INSERT INTO Directory VALUES (null,"Durian Gelato 榴莲冰淇淋蛋糕","自然成熟的泰国金枕头榴莲，果肉品质上乘。与新鲜牛乳混合搅拌，冷却至-15℃，依然保持榴莲的原始浓郁味道。","1磅：13x13cm","198.00","11.jpg",null);
INSERT INTO Directory VALUES (null,"Matcha Gelato 抹茶冰淇淋蛋糕","在用新鲜牛乳制作Gelato的时候，加入精细抹茶一并搅拌，均匀降温，凝固，至-15℃，与Gelato完美融入。","1磅：直径约13cm","198.00","12.jpg",null);
INSERT INTO Directory VALUES (null,"Mango Gelato 鲜芒冰淇淋蛋糕","用新鲜芒果果肉制作浓郁芒果酱，与牛乳混合搅拌，按Gelato的严格标准，降温冷冻，全程手工制作。拿破仑替代饼干托底，口感独特。","1磅：直径约13cm","198.00","13.jpg",null);
INSERT INTO Directory VALUES (null,"Mocha Gelato 摩卡冰淇淋蛋糕","在Gelato的制作中，调入了摩卡咖啡和杏仁。入口即化的生巧点缀，奥利奥饼干底衬托，香醇浓郁。","1磅：约13x13cm","198.00","14.jpg",null);
INSERT INTO Directory VALUES (null,"Tiramisu 提拉米苏","四月，伦巴第地区，从米兰到威尼斯，追寻真正的「提拉米苏」。在这里，顶级的蛋糕师，用不会凝固的慕斯工艺，为伦巴第原产马斯卡彭乳酪，赋予咖啡和酒的灵魂。纯粹的「提拉米苏」熔点极低，常温下15分钟即会溶化，至今，我们仍未完全解决配送难题。世界上有一部分人，用奶酪搭配柠檬汁制作「提拉米苏」，千篇一律。是时候，品尝纯正的了。来杯咖啡，来块「提拉米苏」。","1磅：13x13cm","260.00","15.jpg",1);
INSERT INTO Directory VALUES (null,"Orange Dream心想事橙","干柠檬片与金桔装饰表面，夹层中混入了橙皮丁、橙子果茸与新鲜红心柚子果肉，乳脂奶油中，也调入了君度酒。一口咬下去，满是红柚与香橙的清爽。 注：装饰金桔为时令水果，随季节变化。","1磅：直径约13cm","198.00","16.jpg",null);
INSERT INTO Directory VALUES (null,"Classics Matcha Bean 经典抹茶红豆","日本红豆，又可称为赤豆。生长在海拔300米平原的红小豆，颗粒饱满，风味浓郁。经过Kissmilan独特的蜜制工艺，与抹茶相互激发，将各自味蕾精华展现淋漓尽致。","1磅：直径约13cm","198.00","17.jpg",2);
INSERT INTO Directory VALUES (null,"Mango Pie 芒果派","慕斯的秘诀在于，加入了比利时白巧克力，柔软的原味戚风蛋糕，和酥脆的牛奶曲奇饼干。原来，在「芒果慕斯」之外，另有惊喜。","1磅：直径约13cm","198.00","18.jpg",1);
INSERT INTO Directory VALUES (null,"Chestnut Cream和风栗","乳脂奶油中加入了少许君度酒，淡淡的香橙味，口感轻盈。与众不同的，是戚风蛋糕坯夹层中的意式蛋白饼。栗子酱与手工褪壳的栗子，以及蛋白糖水滴与巧克力香缇，点缀表面。内部隐藏的惊喜，是酸甜爽口的红加仑。","1磅：直径约13cm","198.00","19.jpg",2);
INSERT INTO Directory VALUES (null,"Solid Latte 凝固的拿铁","海拔1800米的肯尼亚AA咖啡豆，萃取精华，与乳脂奶油混合打发。奶油与蛋糕坯中，加入不同研磨度的咖啡粉，追求细致柔和的颗粒口感。","1磅：13x13cm","198.00","20.jpg",2);
INSERT INTO Directory VALUES (null,"Fruits Party水果派对","仅售卖2磅及以上规格，有更多空间，可以容纳足量新鲜水果。夹层的乳脂奶油中也加入了大量鲜果，搭配细腻柔和的戚风蛋糕坯，满足感前所未有。 注：装饰、夹层为时令水果，随季节变化。","2磅：17x17cm","198.00","21.jpg",2);
INSERT INTO Directory VALUES (null,"Cream Party 乳脂派对","乳脂奶油与水果的组合，总会让人惊喜不断。这一次，尝试在一款蛋糕中，搭配四种不同的乳脂奶油组合，带来超乎寻常的满足感。","1磅：直径约13cm","198.00","22.jpg",null);
INSERT INTO Directory VALUES (null,"Assorted Mousse 慕斯拼配","抹茶、巧克力、蓝莓、伯爵茶，四种主题慕斯，加入柔软戚风蛋糕坯，用清爽的口感，带来惊喜体验。","1磅：直径约13cm","198.00","23.jpg",null);
INSERT INTO Directory VALUES (null,"Berry Ginger Mousse 莓果生姜慕斯","尝试在香草慕斯中，加入草莓与树莓，以得到口感更佳的味蕾体验。这一抹酸甜，恰好是「莓果派」真正的灵魂。","1磅：直径约13cm","198.00","24.jpg",1);
INSERT INTO Directory VALUES (null,"Iceberg rose 冰山玫瑰","呈现出纯粹，简单热情潜伏于冰雪，时间沉淀成记忆。即使世界冻结，依旧为你盛放。","1磅：13x13cm","168.00","25.jpg",2);
INSERT INTO Directory VALUES (null,"Seasons 四季","并非简单的任意拼配，挑选春夏秋冬四季精华，「抹茶慕斯」，「红丝绒」，「榛子巧克力」，「蓝莓芝士」，无需等待时间更迭，一次品尝「四季」味蕾。","1磅：13x13cm","198.00","26.jpg",null);
INSERT INTO Directory VALUES (null,"Red Velvet 红丝绒","红丝绒蛋糕的起源，众说纷纭。女士公开了酒店蛋糕配方，是流传较多的版本，颇富戏剧。但Kissmilan「红丝绒」，是由三位研发师独立尝试创新，再融合一体，别具一格。","1磅：直径约13cm","198.00","27.jpg",2);
INSERT INTO Directory VALUES (null,"ChocoNuts 榛子巧克力","柔软戚风蛋糕胚底，裹着榛子酱的乳脂奶油，与香浓黑巧克力一起搭配，深沉浓郁。","1磅：13x13cm","198.00","28.jpg",4);
INSERT INTO Directory VALUES (null,"Irish Rose 爱尔兰玫瑰","使用乳脂奶油，是蛋糕好坏的根本标准。更何况，还加入了意大利伦巴第原产，未经发酵的马斯卡彭新鲜乳酪。回归纯粹的，乳脂奶油嫩滑口感。欣赏艺术品，「爱尔兰玫瑰」。 ","1磅：13x13cm","198.00","29.jpg",2);
INSERT INTO Directory VALUES (null,"Baileys Irish Lover 百利甜情人","纯鲜乳脂奶油调入百利甜酒，在打发奶油的同时调入玫瑰甘露，加入花瓣蜜饯，时令新鲜水果夹心。新鲜采摘的玫瑰花瓣装饰。玫瑰甘露与花瓣蜜饯，可以咀嚼到浓浓的玫瑰香气，值得感受，新的「百利甜情人」。  ","1磅：13x13cm","198.00","30.jpg",2);
INSERT INTO Directory VALUES (null,"Flow Chocolate 熔岩","加入了名贵的香草荚，搭配可可饼干托底，一如既往的极致细腻口感。奥妙在于，咬下去的那一刻，暗藏在慕斯中间的，流动着的巧克力，会被发现。","1磅：13x13cm","198.00","31.jpg",1);
INSERT INTO Directory VALUES (null,"Rum Chestnuts朗姆栗香","裹上乳脂奶油，让栗子糯香与乳香交融，覆盖表面的板栗泥，醇厚浓郁。奥妙在于，在蛋糕夹层，混合加入摩根船长朗姆酒及整块板栗切块，可以品尝比较此处栗子有何不同。","1磅：13x13cm","198.00","32.jpg",2);
INSERT INTO Directory VALUES (null,"Mango Cream鲜芒轻乳","大块新鲜芒果铺满乳脂奶油表面，搭配柔软戚风蛋糕坯，口感细腻。特别之处在于，夹层的奶油中，混合打发了芒果果茸，浓郁由内而外。","2磅：17x17cm 限时升磅","198.00","33.jpg",2);
INSERT INTO Directory VALUES (null,"Blueberry and Mango Napoleon 拿破仑双拼","在一个拿破仑里，呈现了两种截然不同味道。一切融合的那么自然，甚至，你在切开的时候，找不到蓝莓与芒果的界线。","1磅：13x13cm","198.00","34.jpg",null);
INSERT INTO Directory VALUES (null,"Hazelnut Mousse 榛果慕斯","坚守，是最初的等候；低调，是经历的沉淀；而惊喜，是内里柔软的甜蜜。榛心，杏运，给最值得珍惜的人。","1磅：13x13cm","168.00","35.jpg",1);
INSERT INTO Directory VALUES (null,"Dream","每一款使用马斯卡彭乳酪的蛋糕，绝非平凡。纯粹手工雕花，为马斯卡彭铺满R.Gallica玫瑰。装饰不足以诠释爱的定义，却真正用心。","1磅：13x13cm","290.00","36.jpg",2);
INSERT INTO Directory VALUES (null,"Fall In Love 倾心","用榛子酱与乳脂奶油混合打发，制作榛子慕斯，加入秘制覆盆子果茸与榛子巧克力脆。","1磅：13x13cm","268.00","37.jpg",1);
INSERT INTO Directory VALUES (null,"Elephant 小象","来自新西兰天然牧场的乳脂奶油，搭配比利时浓郁巧克力坯底，与最底层的巧克力谷物脆。仔细品尝，还会找到蔓越莓干的惊喜。那些技艺精湛的研发师告诉我们的，蛋糕是带给人们幸福和甜蜜的食物。","一头","148.00","38.jpg",9);
INSERT INTO Directory VALUES (null,"Dog小狗","用新西兰天然牧场的乳脂奶油，搭配比利时浓郁巧克力坯底，加入可可粒与葡萄干，满足孩子对蛋糕的应有期望。","一只","148.00","39.jpg",9);
INSERT INTO Directory VALUES (null,"Panda 小熊猫","选一种最憨态可掬的动物，一定非熊猫莫属。","一只","148.00","40.jpg",9);
INSERT INTO Directory VALUES (null,"Little Pig 小猪","使用新西兰天然牧场乳脂奶油，搭配柔软的戚风蛋糕坯，口感细腻。精髓在于蛋糕夹层中的杏仁片，细细咀嚼，回味绵长。","一只","148.00","41.jpg",9);
INSERT INTO Directory VALUES (null,"Little Mouse 萌小鼠","柔软细腻的戚风蛋糕坯，包裹着新西兰天然牧场乳脂奶油，经典的搭配组合，是孩子最爱的味道。蛋糕的夹层种藏有惊喜，原味和焦糖味脆脆珠，就像小老鼠私藏的糖果。","一只","148.00","42.jpg",9);
INSERT INTO Directory VALUES (null,"Mango Mousse 芒果慕斯","有别于一般做法，大块新鲜芒果果肉用于装裱，及充满慕斯夹层，搭配智利蓝莓，颗颗带着果霜。仿佛置身昆士兰洛德海姆庄园农场。一起品尝，来自南纬19度的鲜芒盛宴。","1磅：13x13cm","198.00","43.jpg",1);
INSERT INTO Directory VALUES (null,"Matcha Mousse 抹茶慕斯","在很少使用茶筅点茶的时代，有些味道却始终无法忘掉。用石磨与蒸青技艺，呈现抹茶的精细，微苦。「抹茶慕斯」，保留对古老品味的应有尊重。","1磅：13x13cm","198.00","44.jpg",1);
INSERT INTO Directory VALUES (null,"Durian King 榴莲飘飘","成熟的榴莲，在深夜及凌晨落地。不泡催熟药水，单颗果重为3.5-4.2kg。珍惜，不易得来的「榴莲飘飘」。","1磅：13x13cm","198.00","45.jpg",2);
INSERT INTO Directory VALUES (null,"Black Forest 黑森林","黑森林蛋糕源自德国南部黑森林地区。樱桃丰收时，使用新鲜的乳脂奶油，浓郁巧克力，大颗黑樱桃，并加入大量樱桃汁。「黑森林」，巧克力覆盖的樱桃盛宴。","1磅：13x13cm","168.00","46.jpg",4);
INSERT INTO Directory VALUES (null,"Blueberry Napoleon 蓝莓拿破仑","拿破仑酥皮，与新西兰乳脂奶油，点缀黝黑，饱满的阿尔卑斯山区地带野生蓝莓。品尝「蓝莓拿破仑」的，松化嫩滑， 酥脆浓郁。","1磅：13x13cm","198.00","47.jpg",2);
INSERT INTO Directory VALUES (null,"Cran Rose 蔓越玫瑰","酸甜覆盆子酱裹着马斯卡彭乳酪，北美寒冷湿地的蔓越莓，和刚刚采摘的玫瑰。相遇，总是不期。","1磅：13x13cm","168.00","48.jpg",3);
INSERT INTO Directory VALUES (null,"Hokkaido Milk 北海道牛乳","用乳脂含量3.6%的北海道特有牛乳，制作奶油与芝士。口感轻盈柔滑，乳香浓郁十足。「北海道牛乳」，呈现箱根牧场特选3.6牛乳，醇香原味。","1磅：13x13cm","198.00","49.jpg",3);
INSERT INTO Directory VALUES (null,"Mango Napoleon 芒果拿破仑","纯手工反复折叠的拿破仑酥皮，加入秘制吉士与卡仕达混合酱。与浓郁芒果，和不经存放的，现打发奶油相衬，层层酥脆。 ","1磅：13x13cm","198.00","50.jpg",2);
INSERT INTO Directory VALUES (null,"Blueberry Cheese 蓝莓芝士","瑞士，阿尔卑斯山区地带，海拔1500-2500公尺，全年平均气温5.6℃，野生蓝莓的天堂。经Kissmilan研发中心粒粒精挑细选，果粒饱满的瑞士野生蓝莓，搭配澳大利亚纯正烘焙乳酪，成就一款香滑浓郁的「蓝莓芝士」。","1磅：13x13cm","198.00","51.jpg",3);
#创建用户表
CREATE TABLE cake_user(
    uid INT PRIMARY KEY AUTO_INCREMENT,    #用户id
    uname VARCHAR(20) unique,
    upwd VARCHAR(12),
    email VARCHAR(32),
    phone VARCHAR(11)
);

#创建购物车表
CREATE TABLE cake_cart(
    uid INT,#用户id
    id INT,#蛋糕id
    cname VARCHAR(200),#蛋糕名字
    csize VARCHAR(50),#蛋糕规格
    cprice DECIMAL(7,2),#蛋糕价格
    cpic VARCHAR(128),#图片
    count INT#商品数量
);

#创建订单表
CREATE TABLE cake_orderform(
    uid INT,#用户id
    id INT,#蛋糕id
    cname VARCHAR(200),#蛋糕名字
    csize VARCHAR(50),#蛋糕规格
    cprice DECIMAL(7,2),#蛋糕价格
    cpic VARCHAR(128),#图片
    count INT,#商品数量
    ordernum INT PRIMARY KEY AUTO_INCREMENT#唯一订单号
);