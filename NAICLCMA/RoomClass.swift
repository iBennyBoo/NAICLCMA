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
    
    static var coords: [String: [Double]] = ["0": [0.0, 0.0], "106": [38.666666666666664, 62.03703703703704], "108": [49.06666666666666, 42.592592592592595], "109": [37.333333333333336, 42.87037037037037], "120": [20.133333333333333, 26.111111111111114], "122": [26.13333333333333, 20.555555555555554], "123": [34.13333333333333, 20.925925925925924], "124": [42.266666666666666, 20.833333333333336], "127": [53.333333333333336, 12.685185185185185], "128": [46.400000000000006, 13.055555555555557], "129": [37.86666666666667, 12.777777777777777], "130": [28.26666666666667, 12.685185185185185], "131": [20.133333333333333, 10.925925925925926], "132": [12.8, 10.74074074074074], "133": [11.866666666666667, 22.407407407407405], "134": [11.866666666666667, 25.64814814814815], "150": [11.466666666666667, 78.14814814814814], "151": [11.466666666666667, 81.75925925925925], "152": [11.466666666666667, 85.27777777777777], "153": [11.733333333333333, 89.25925925925927], "154": [11.466666666666667, 92.96296296296296], "155": [11.733333333333333, 96.75925925925925], "156": [20.933333333333334, 93.61111111111111], "158": [22.933333333333334, 88.24074074074075], "159": [34.13333333333333, 87.96296296296296], "160": [41.199999999999996, 87.31481481481481], "162": [41.06666666666667, 92.22222222222223], "163": [50.53333333333333, 95.74074074074073], "164": [50.66666666666667, 92.22222222222223], "165": [50.66666666666667, 88.42592592592592], "166": [50.53333333333333, 82.5], "167": [50.53333333333333, 82.5], "168": [50.53333333333333, 75.18518518518519], "169": [40.666666666666664, 73.33333333333333], "171": [41.46666666666667, 78.70370370370371], "172": [35.25179856115108, 78.10810810810811], "173": [27.218225419664265, 77.74774774774775], "AUD": [26.13333333333333, 52.11538461538462], "FH": [71.73333333333333, 23.46153846153846], "GYM": [74.4, 54.13461538461538], "P. Offices": [13.866666666666665, 65.67307692307692], "Nurse": [12.8, 36.15384615384615], "Front Office": [12.933333333333334, 47.5], "Dean's Office": [12.266666666666666, 43.75], "Tiger Confrence Room": [20.266666666666666, 61.53846153846154], "Student Serveces": [21.6, 41.05769230769231], "Social Worker": [12.266666666666666, 38.55769230769231], "SRO": [54.13333333333333, 38.36538461538462], "200": [13.866666666666665, 43.46153846153846], "201": [12.666666666666668, 51.153846153846146], "201A": [16.933333333333334, 47.59615384615385], "202": [13.733333333333334, 56.05769230769231], "203": [13.200000000000001, 60.86538461538461], "204": [13.866666666666665, 65.76923076923077], "205": [31.774580335731418, 59.81981981981982], "205A": [42.44604316546763, 59.72972972972973], "206": [56.266666666666666, 60.76923076923077], "207": [66.0, 60.57692307692307], "208": [82.93333333333334, 61.057692307692314], "209": [90.53333333333333, 55.19230769230769], "209A": [86.66666666666667, 57.21153846153846], "210": [90.26666666666667, 51.82692307692308], "211": [90.13333333333333, 49.03846153846153], "212": [89.73333333333333, 45.57692307692307], "213": [82.66666666666667, 40.09615384615385], "214": [68.4, 39.80769230769231], "215": [15.466666666666667, 9.711538461538462], "216": [33.2, 39.23076923076923], "217": [13.866666666666665, 39.51923076923077], "218": [13.866666666666665, 34.23076923076923], "220": [29.06666666666667, 20.28846153846154], "221": [28.933333333333334, 14.711538461538462], "222": [28.799999999999997, 9.519230769230768], "223": [28.933333333333334, 4.423076923076923], "224": [15.066666666666666, 4.423076923076923], "225": [15.333333333333332, 9.807692307692308], "226": [15.066666666666666, 21.25], "230 // Band Room": [93.2, 16.442307692307693], "231": [91.33333333333333, 23.942307692307693], "232": [91.2, 25.48076923076923], "234": [80.93333333333334, 29.903846153846153], "235": [88.93333333333334, 30.384615384615383], "250": [13.866666666666665, 77.59615384615385], "251": [13.866666666666665, 81.92307692307692], "252": [14.133333333333335, 85.86538461538461], "253": [14.0, 89.8076923076923], "254 // Choir Room": [13.733333333333334, 93.65384615384616], "255": [14.0, 97.78846153846153], "256": [30.933333333333334, 95.67307692307693], "258": [34.53333333333333, 88.07692307692308], "259": [48.66666666666667, 88.26923076923077], "260 // Computer Room": [63.6, 88.36538461538461], "261": [66.8, 91.15384615384615], "263": [66.4, 95.28846153846153], "264": [83.46666666666667, 97.6923076923077], "265": [83.06666666666666, 93.46153846153847], "266": [88.13333333333333, 87.78846153846153], "267": [88.4, 80.48076923076923], "268": [88.4, 74.42307692307692], "269 // Library": [47.599999999999994, 79.51923076923076], "WR": [99.46666666666667, 33.36538461538461]]
    
    init(level: Bool, name: String, room: String, classes: [String])
    {
        self.name = name
        self.level = level
        self.place = room
        self.classList = classes
    }
}
