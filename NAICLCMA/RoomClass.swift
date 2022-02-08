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
        // Music, 0 - 16
        ["Guitar", "Music Technology & Production", "|AP| Music Theory", "-DC- Music Appreciation", "Band 1", "Percussion", "Treble Choir 1", "Chorus 1", "Bass Choir 1", "Band 2", "Treble Choir 2", "Chorus 2", "Band 3", "Bell Canto", "Bass Choir", "Band 4", "Acapella"],
        // Pain, 0 - ∞
        []
    ]
    
    static var coords: [Bool: [String: [Double]]] = [false: ["106": [39.4484412470024, 60.99099099099], "108": [49.040767386091126, 41.7117117117115], "109": [38.489208633093526, 41.981981981981], "120": [22.422062350119905, 24.405405405405], "122": [27.697841726618705, 19.729729729729], "123": [35.37170263788969, 19.819189189189], "124": [42.68585131894484, 19.81981981981982], "127": [52.99760191846523, 11.711711711711711], "128": [46.28297362110312, 11.711711711711711], "129": [38.72901678657074, 11.621621621621623], "130": [29.97601918465228, 11.801801801801801], "131": [22.18225419664269, 9.54954954954955], "132": [15.227817745803357, 9.54954954954955], "133": [14.748201438848922, 22.34234234234234], "134": [14.86810551558753, 25.135135135135133], "150": [14.268585131894485, 77.47747747747748], "151": [14.268585131894485, 81.08108108108108], "152": [14.388489208633093, 85.04504504504504], "153": [14.388489208633093, 88.55855855855856], "154": [14.268585131894485, 92.52252252252252], "155": [14.268585131894485, 95.94594594594594], "156": [23.021582733812952, 92.7927927927928], "158": [24.700239808153476, 87.11711711711712], "159": [35.25179856115108, 87.11711711711712], "160": [41.84652278177458, 85.94594594594595], "162": [41.84652278177458, 91.35135135135135], "163": [50.35971223021583, 94.77477477477477], "164": [50.719424460431654, 91.44144144144144], "165": [50.47961630695443, 87.65765765765767], "166": [50.47961630695443, 81.44144144144144], "167": [50.83932853717026, 78.28828828828829], "168": [50.59952038369304, 74.50450450450451], "169": [41.12709832134293, 72.52252252252252], "171": [41.84652278177458, 78.1981981981982], "172": [35.25179856115108, 78.10810810810811], "173": [27.218225419664265, 77.74774774774775]], true: ["200": [14.508393285371701, 43.06306306306306], "201": [14.628297362110313, 42.792792792792795], "201a": [17.86570743405276, 46.306306306306304], "202": [14.508393285371701, 55.22522522522523]]]
    
    init(level: Bool, name: String, room: String, classes: [String])
    {
        self.name = name
        self.level = level
        self.place = room
        self.classList = classes
    }
}
