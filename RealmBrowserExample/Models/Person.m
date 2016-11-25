//
//  Person.m
//  RealmBrowser
//
//  Created by Tim Oliver on 24/11/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (NSArray<Person *> *)generateTestData
{
    return @[
         [[Person alloc] initWithValue:@[@1, @"Willie Bowman", @"wbowman0@mail.ru", @35, @5.64, @73.72, @"Male", @"https://xrea.com/fringilla/rhoncus/mauris.aspx"]],
         [[Person alloc] initWithValue:@[@2, @"Harold Meyer", @"hmeyer1@sciencedirect.com", @24, @5.64, @73.72, @"Male", @"http://multiply.com/lacinia/erat/vestibulum.jsp"]],
         [[Person alloc] initWithValue:@[@3, @"George Dean", @"gdean2@pbs.org", @28, @5.64, @73.72, @"Male", @"https://globo.com/curabitur/gravida/nisi/at/nibh/in.jpg"]],
         [[Person alloc] initWithValue:@[@4, @"John Ramirez", @"jramirez3@prlog.org", @22, @5.64, @73.72, @"Male", @"http://google.nl/convallis/nunc/proin.xml"]],
         [[Person alloc] initWithValue:@[@5, @"Theresa Ray", @"tray4@time.com", @24, @5.64, @73.72, @"Female", @"http://icq.com/nibh/in/quis/justo.json"]],
         [[Person alloc] initWithValue:@[@6, @"Shawn Oliver", @"soliver5@cargocollective.com", @26, @5.64, @73.72, @"Male", @"http://cbc.ca/magna/vestibulum.jpg"]],
         [[Person alloc] initWithValue:@[@7, @"Carolyn West", @"cwest6@imageshack.us", @28, @5.64, @73.72, @"Female", @"http://whitehouse.gov/consequat/morbi/a/ipsum.png"]],
         [[Person alloc] initWithValue:@[@8, @"Laura Bryant", @"lbryant7@technorati.com", @41, @5.64, @73.72, @"Female", @"http://usda.gov/massa/quis/augue/luctus/tincidunt/nulla/mollis.json"]],
         [[Person alloc] initWithValue:@[@9, @"Frances Collins", @"fcollins8@weibo.com", @33, @5.64, @73.72, @"Male", @"http://etsy.com/id/ornare/imperdiet/sapien.jpg"]],
         [[Person alloc] initWithValue:@[@10, @"Judith Williamson", @"jwilliamson9@hostgator.com", @32, @5.64, @73.72, @"Female", @"http://si.edu/volutpat/sapien/arcu/sed/augue/aliquam/erat.js"]],
         [[Person alloc] initWithValue:@[@11, @"Judy Simpson", @"jsimpsona@ustream.tv", @39, @5.64, @73.72, @"Female", @"http://usnews.com/faucibus/cursus/urna.html"]],
         [[Person alloc] initWithValue:@[@12, @"Donald Berry", @"dberryb@mayoclinic.com", @21, @5.64, @73.72, @"Male", @"http://latimes.com/odio/in/hac/habitasse/platea.aspx"]],
         [[Person alloc] initWithValue:@[@13, @"Stephen Cole", @"scolec@virginia.edu", @24, @5.64, @73.72, @"Male", @"http://unesco.org/parturient/montes/nascetur/ridiculus/mus/etiam.aspx"]],
         [[Person alloc] initWithValue:@[@14, @"Lois Armstrong", @"larmstrongd@dion.ne.jp", @29, @5.64, @73.7, @"Male", @"http://google.pl/maecenas/rhoncus/aliquam/lacus/morbi/quis/tortor.html"]],
         [[Person alloc] initWithValue:@[@15, @"Gerald Ward", @"gwarde@icio.us", @34, @5.64, @73.72, @"Male", @"https://umn.edu/mauris.jpg"]],
         [[Person alloc] initWithValue:@[@16, @"Lois Gardner", @"lgardnerf@economist.com", @39, @5.64, @73.72, @"Female", @"http://unesco.org/ipsum/primis/in.json"]],
         [[Person alloc] initWithValue:@[@17, @"Bruce Woods", @"bwoodsg@gov.uk", @31, @5.64, @73.72, @"Male", @"https://mediafire.com/in/purus/eu.json"]],
         [[Person alloc] initWithValue:@[@18, @"Michelle Matthews", @"mmatthewsh@imdb.com", @37, @5.64, @73.72, @"Female", @"https://facebook.com/praesent/lectus/vestibulum/quam/sapien.html"]],
         [[Person alloc] initWithValue:@[@19, @"Teresa Gomez", @"tgomezi@qq.com", @29, @5.64, @73.72, @"Female", @"https://google.com.hk/semper/interdum/mauris/ullamcorper.jpg"]],
         [[Person alloc] initWithValue:@[@20, @"George Dunn", @"gdunnj@free.fr", @24, @5.64, @73.72, @"Male", @"http://lycos.com/lorem/vitae/mattis/nibh.js"]],
         [[Person alloc] initWithValue:@[@21, @"Christine Wallace", @"cwallacek@sun.com", @26, @5.64, @73.72, @"Female", @"http://amazonaws.com/donec/ut/dolor/morbi/vel.json"]],
         [[Person alloc] initWithValue:@[@22, @"Anthony Gordon", @"agordonl@163.com", @25, @5.64, @73.72, @"Male", @"https://hao123.com/euismod/scelerisque.js"]],
         [[Person alloc] initWithValue:@[@23, @"Brian Martinez", @"bmartinezm@ezinearticles.com", @20, @5.64, @73.72, @"Male", @"https://illinois.edu/turpis/a/pede/posuere/nonummy.png"]],
         [[Person alloc] initWithValue:@[@24, @"Dennis Matthews", @"dmatthewsn@biglobe.ne.jp", @29, @5.64, @73.72, @"Male", @"https://fda.gov/sed/tincidunt/eu/felis/fusce/posuere.jpg"]],
         [[Person alloc] initWithValue:@[@24, @"Jacqueline James", @"jjameso@yahoo.co.jp", @30, @5.64, @73.72, @"Female", @"http://wisc.edu/ac/est.json"]],
         [[Person alloc] initWithValue:@[@25, @"Dennis Wilson", @"dwilsonp@deviantart.com", @40, @5.64, @73.72, @"Male", @"https://4shared.com/massa/donec.jpg"]],
         [[Person alloc] initWithValue:@[@26, @"Jeremy Grant", @"jgrantq@amazon.com", @31, @5.64, @73.72, @"Male", @"https://pinterest.com/integer.json"]],
         [[Person alloc] initWithValue:@[@27, @"Emily Romero", @"eromeror@home.pl", @36, @5.64, @73.72, @"Female", @"https://walmart.com/elementum.aspx"]],
         [[Person alloc] initWithValue:@[@28, @"Ryan Perry", @"rperrys@hhs.gov", @26, @5.64, @73.72, @"Male", @"https://archive.org/habitasse/platea.html"]],
         [[Person alloc] initWithValue:@[@29, @"Harold Gibson", @"hgibsont@cafepress.com", @24, @5.64, @73.72, @"Male", @"https://gravatar.com/lacinia/erat/vestibulum.png"]],
         [[Person alloc] initWithValue:@[@30, @"Jennifer Gilbert", @"jgilbertu@shinystat.com", @27, @5.64, @73.72, @"Female", @"https://1688.com/eget/tincidunt/eget.html"]],
         [[Person alloc] initWithValue:@[@31, @"Julie Reynolds", @"jreynoldsv@jimdo.com", @25, @5.64, @73.72, @"Female", @"http://sina.com.cn/vel/sem.jpg"]],
         [[Person alloc] initWithValue:@[@32, @"Louis Mills", @"lmillsw@paginegialle.it", @29, @5.64, @73.72, @"Male", @"https://imdb.com/phasellus/sit.jpg"]],
         [[Person alloc] initWithValue:@[@33, @"Patricia Martin", @"pmartinx@theatlantic.com", @21, @5.64, @73.72, @"Female", @"http://elpais.com/nibh/in/lectus/pellentesque/at/nulla/suspendisse.jsp"]],
         [[Person alloc] initWithValue:@[@34, @"Craig Harris", @"charrisy@naver.com", @28, @5.64, @73.72, @"Male", @"https://redcross.org/cursus/urna/ut/tellus.jpg"]],
         [[Person alloc] initWithValue:@[@35, @"Raymond Hansen", @"rhansenz@booking.com", @25, @5.64, @73.72, @"Male", @"http://google.it/in/congue/etiam/justo/etiam/pretium.jsp"]],
         [[Person alloc] initWithValue:@[@36, @"Martin Carter", @"mcarter10@deliciousdays.com", @28, @5.64, @73.72, @"Male", @"https://mlb.com/ipsum/ac/tellus.json"]],
         [[Person alloc] initWithValue:@[@37, @"Fred Garza", @"fgarza11@jiathis.com", @30, @5.64, @73.72, @"Male", @"https://goo.ne.jp/quisque/porta.js"]],
         [[Person alloc] initWithValue:@[@38, @"Jessica Chapman", @"jchapman12@ebay.com", @31, @5.64, @73.72, @"Female", @"https://dagondesign.com/ante/vestibulum.js"]],
         [[Person alloc] initWithValue:@[@39, @"Shirley Lynch", @"slynch13@wikispaces.com", @36, @5.64, @73.72, @"Female", @"https://livejournal.com/sed.xml"]],
         [[Person alloc] initWithValue:@[@40, @"Marie Young", @"myoung14@fema.gov", @38, @5.64, @73.72, @"Female", @"http://ox.ac.uk/massa/id/lobortis/convallis/tortor.html"]],
         [[Person alloc] initWithValue:@[@31, @"George Carr", @"gcarr15@scientificamerican.com", @33, @5.64, @73.72, @"Male", @"https://nps.gov/tincidunt.xml"]],
         [[Person alloc] initWithValue:@[@32, @"Victor Cook", @"vcook16@auda.org.au", @32, @5.64, @73.72, @"Male", @"https://homestead.com/parturient/montes/nascetur/ridiculus.jsp"]],
         [[Person alloc] initWithValue:@[@33, @"Christina Morris", @"cmorris17@typepad.com", @31, @5.64, @73.72, @"Female", @"https://yolasite.com/rutrum/rutrum/neque/aenean/auctor/gravida.jpg"]],
         [[Person alloc] initWithValue:@[@34, @"Clarence Ramirez", @"cramirez18@i2i.jp", @39, @5.64, @73.72, @"Male", @"https://jimdo.com/eleifend.xml"]],
         [[Person alloc] initWithValue:@[@35, @"Susan Morrison", @"smorrison19@nytimes.com", @41, @5.64, @73.72, @"Female", @"http://mac.com/ut/mauris/eget.xml"]],
         [[Person alloc] initWithValue:@[@36, @"Kathryn Brown", @"kbrown1a@pinterest.com", @23, @5.64, @73.72, @"Female", @"http://oaic.gov.au/tellus/in/sagittis/dui.xml"]],
         [[Person alloc] initWithValue:@[@37, @"Joan Castillo", @"jcastillo1b@amazon.com", @24, @5.64, @73.72, @"Male", @"http://wsj.com/volutpat/quam/pede/lobortis/ligula.js"]],
         [[Person alloc] initWithValue:@[@38, @"Kathleen Cruz", @"kcruz1c@ustream.tv", @27, @5.64, @73.72, @"Female", @"https://imdb.com/feugiat/et/eros/vestibulum.jpg"]],
         [[Person alloc] initWithValue:@[@39, @"Dorothy Martinez", @"dmartinez1d@businessweek.com", @21, @5.64, @73.72, @"Female", @"https://4shared.com/quis/libero.png"]],
         [[Person alloc] initWithValue:@[@40, @"Amanda Rice", @"arice1e@nasa.gov", @29, @5.64, @73.72, @"Female", @"http://umich.edu/lacus/at/velit.jsp"]]
    ];
}

@end
