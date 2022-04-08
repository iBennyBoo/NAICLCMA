import Foundation
public class RoomClass{
    var level: Bool // true = first floor & false = second floor
    var name: String
    var place: String
    var classList: [String]
    static var classes =
    [
        // Art, 0 - 18
        ["-DC- Art Appreciation", "-DC- Art History 1", "-DC- Art History 2", "Visual Art Basics", "Studio Art 1 { 2D - 3D }", "Visual Art & Technology", "Digital Illustration", "Art Independent Study", "Studio Art 2 { 2D }", "Studio Art 2 { 3D }", "Art & Design 1", "Photographic Imaging 1", "Studio Art 3 { 2D }", "Studio Art 3 { 3D }", "Art & Design 2", "Photographic Imaging 2", "Studio Art 4 { 2D - 3D }", "|AP| Studio", "Design & Production"],
        // English, 0 - 26
        ["English 1", "(F) CLIMB English", "Intensive Reading 1", "Targeted Reading 1", "(F) English", "<H> (F) English", "English 2", "(S) CLIMB English", "(S) English", "<H> (S) English", "English 3", "(J) CLIMB English", "(J) English", "<H> (J) English", "|AP| Language Comprehension", "|AP| Literature Comprehension", "English 4", "College / Career Writing", "Best Sellers", "Communication Analysis & Production", "Literature & Culture 1", "Creative Storytelling", "Literature & Culture 2", "Theatrics", "-DC- Composition 1", "-DC- Composition 2", "-DC- Speech"],
        // Math, 0 - 17
        ["Algebra", "Intermediate Algebra", "Geometry", "<H> Geometry", "Algebra II", "<H> Algebra II", "Intro to College Algebra", "Pre-Calc", "<H> Pre-Calc", "-DC- Stats", "-DC- Applied Calculus", "|AP| Stats", "|AP| Calc AB", "|AP| Calc BC", "-DC- Calculus III"],
        // Science, 0 - 17
        ["Basic Biology", "Biology", "<H> Biology", "Basic Earth & Space", "Chemistry", "<H> Chemistry", "Physical Science", "Physics", "|AP| Physics I", "|AP| Physics II", "Societal Science", "<H> Anatomy and Physiology", "Forensics", "Earth and Space", "|AP| Environmental Science", "|AP| Chemistry", "|AP| Biology"],
        // Music, 0 - 16
        ["Guitar", "Music Technology & Production", "|AP| Music Theory", "-DC- Music Appreciation", "Band 1", "Percussion", "Treble Choir 1", "Chorus 1", "Bass Choir 1", "Band 2", "Treble Choir 2", "Chorus 2", "Band 3", "Bell Canto", "Bass Choir", "Band 4", "Acapella"],
        // Business, 0 - 10
        ["Consumer Ed", "Intro to Business", "Accounting I", "Accounting II", "Business Law", "-DC- Computer Business Applications", "-DC- Marketing", "Marketing Internship", "-DC- Virtual Enterprises", "-DC- Incubator", "Achieve", "Interrelated Occupations", "Career Internship"],
        // Computer Science 0 - 6
        ["Introduction to Computer Science", "Mobile App Development", "|AP| Computer Science Principles", "|AP| Computer Science", "Advanced Mobile Apps", "-DC- Advanced Mobile Apps"],
        // Child Development 0 - 5
        ["Orientation to F&C Science", "Adult Living", "Child Development", "Pre-School Labs", "Education Internship"],
        // Foodstuffs 0 - 7
        ["Nutrition & Wellness", "Culinary Arts I", "Culinary Arts II", "Advanced Culinary Arts", "Commercial Culinary Arts I", "-DC- Commercial Culinary Arts II", "-DC- Advanced Commercial Culinary Arts", "Culinary internship"],
        // Fashion 0 - 5
        ["Fashion I", "Fashion II", "Fashion Merchandising", "Housing Design", "Fashion Internship"],
        // Industry 0 - 18
        ["Industrial Orientation", "Robotics and Drones", "Tech Ed. I", "Tech Ed. II", "Tech Design Intro", "Tech Design", "Mechanical Design", "Architecture Design", "Woods I", "Woods II", "Woods III", "Metals I", "-DC- Metals II", "-DC- Metals III", "CNC I", "CNC II"],
        // History 0 - 20
        ["Social Science I", "Social Science II", "World Studies I", "World Studies II", "<H> World Studies I", "<H> World Studies II", "|AP| Human Geography", "|AP| European History", "|AP| United States History", "-DC- Psycology", "|AP| Microeconomics", "|AP| Macroeconomics", "|AP| US Government & Politics", "American History", "US History", "US Law", "Civics and Current Issues", "Sociology", "Psychology", "-DC- US History"],
        // World Language 0 - 14
        ["French I", "French II", "-DC- French III", "-DC- French IV", "German I", "German II", "-DC- German III", "-DC- German IV", "Spanish I", "Spanish II", "-DC- Spanish III", "-DC- Spanish IV", "|AP| Spanish Culture", "-DC- Advanced Spanish Conversation"],
        // Physical Ed, 0 - 8
        ["Health", "Freshman PE", "General PE", "Strength & Conditioning", "Advanced Strength & Conditioning", "Body Fitness", "Walking", "Adaptive Gym"],
        // Misc
        ["Classroom Driver's-Ed", "Behind the Wheel"]
  	]
    
    static var coords: [String: [Double]] = ["---": [-100.0, -100.0], "106": [-11.81804841921585, 10.87219820002546], "108": [-0.9901230602868023, -8.37147031230522], "109": [-12.872824681475576, -8.405082366958181], "120": [-31.007716812929146, -24.829630778128333], "122": [-24.995518415635104, -30.229543041738687], "123": [-16.32171499522145, -30.269645388510014], "124": [-8.163563283712625, -30.26099657588658], "127": [3.3879529276375804, -37.84715154736508], "128": [-4.284069039941388, -38.15813598076351], "129": [-12.513940255583114, -38.15813598076351], "130": [-22.553014095198893, -38.26137489064283], "131": [-31.005534919154336, -40.120942974711795], "132": [-38.70857995194062, -39.960568672353226], "133": [-40.765914960697195, -28.028720576875266], "134": [-39.426254954995244, -24.628785366873476], "150": [-40.09916707083801, 27.3031706066144], "151": [-39.928463054817975, 31.25129701065318], "152": [-39.876085476101146, 34.616915994569204], "153": [-39.991178973766026, 38.16944367714484], "154": [-40.013815062827994, 42.40904554380626], "155": [-39.97113905882299, 46.24273350135116], "156": [-30.241010145681035, 42.952628164652175], "158": [-28.405941973465666, 37.54541156781646], "159": [-16.32863284004824, 37.23070583995829], "160": [-9.151098981997308, 35.59865644976183], "162": [-9.27848640720937, 41.49121444281161], "163": [0.5303453341197518, 45.07798887336366], "164": [0.5303453341197518, 41.2607558721478], "165": [0.5303453341197518, 37.612324777587666], "166": [0.5303453341197518, 31.739850070590197], "167": [0.5303453341197518, 28.21636524639172], "168": [0.47121293745201837, 24.3930093733253], "169": [-9.891414238775207, 22.793697112696208], "171": [-8.064908009871843, 28.391290024898048], "172": [-16.451926407897474, 28.29133300860872], "173": [-25.608825048791257, 27.63305912606664], "AUD": [-18.90223347426307, 1.586557202095093], "FH": [23.39375554735966, -27.52915944884156], "GYM": [26.112942257408523, 3.302433300937662], "P. Offices": [-39.55952460235786, 15.351874759925522], "Nurse": [-39.937591956590026, -14.789532870994787], "Front Office": [-40.046562080484584, -3.368718802426154], "Dean's Office": [-40.740987981846125, -7.44216682717262], "Tiger Conference Room": [-40.0584273631124, 7.0512928437816065], "Student Services": [-30.49059986145421, -9.820025713802877], "Social Worker": [-40.348831102702434, -12.288808522610609], "SRO": [4.55988005499271, -12.589100236311475], "Athletic Director": [-31.090020979647303, 16.12811889735649], "CAFE": [-15.87962962962963, -19.615145872129112], "200": [-38.79671274908196, -7.323582928814218], "201": [-38.85053142930853, -0.660104282827021], "201A": [-35.62679038738809, -3.713845059218694], "202": [-38.60176227986924, 5.126353219467221], "203": [-38.65264726969125, 10.004489673912648], "204": [-38.75441724933527, 14.609723389647842], "205": [-20.435820913410833, 9.4245713541534], "205A": [-8.223952257517844, 9.74674984399682], "206": [6.3854492337127535, 9.582970376222718], "207": [17.2952257845994, 9.725616433878185], "208": [35.09561202445716, 9.695857780946511], "209": [43.04142034598968, 3.7738858475425436], "209A": [38.81264589326122, 6.485069385194804], "210": [43.07447721853079, 0.5738411937209351], "211": [41.53358083290663, -2.0720000361030477], "212": [43.07447721853079, -5.534427937468735], "213": [34.79574740277725, -11.314295502465413], "214": [19.609911646069598, -11.117254562749624], "215": [0.08334505837085418, -11.200250037000805], "216": [-18.034019605955574, -11.466457583916744], "217": [-38.80445763280768, -11.629739925384431], "218": [-38.867353938241344, -16.689554440718354], "220": [-22.82879605265684, -30.604044357886632], "221": [-22.765899747223177, -36.16984032475395], "222": [-22.765899747223177, -41.10315947720453], "223": [-22.765899747223177, -46.458129839266256], "224": [-37.86101305130271, -46.41596471830513], "225": [-37.735220440435384, -41.14532459816564], "226": [-37.54653152413439, -29.63424657578097], "230 // Band Room": [45.940340354377106, -34.84827027063447], "231": [44.22711999090609, -26.941099362306687], "232": [44.26006653635745, -25.37291742238693], "234 // Choir Room": [33.28886690105266, -20.933416437543677], "235": [41.55844980934546, -20.535849185169656], "250": [-38.77314814814815, 26.753569211669763], "251": [-38.726851851851855, 30.92799503414027], "252": [-38.77314814814815, 34.88516449410303], "253": [-38.75, 38.71818746120421], "254": [-38.68055555555556, 42.73743016759776], "255": [-38.67898942949594, 46.85242410367743], "256": [-20.76477668014719, 44.67475383776661], "258": [-16.735942469936408, 37.383066314060954], "259": [-1.4809438039546545, 37.617078681066346], "260 // Computer Room": [14.69207492806046, 37.49986519788097], "261": [19.543980547664994, 40.693932614682396], "263": [17.57699178296046, 44.3568539642253], "264": [35.67328841824224, 46.81833711111813], "265": [35.58586669536647, 42.774471941222764], "266": [35.80442100255588, 37.00170789434314], "267": [35.80442100255588, 29.998202274017093], "268": [35.62957755680436, 23.81519103598867], "269 // Library": [-2.748558785653133, 28.679550588181645], "WR": [45.83333333333333, -14.351851851851851]]
    
    init(level: Bool, name: String, room: String, classes: [String])
    {
        self.name = name
        self.level = level
        self.place = room
        self.classList = classes
    }
}
