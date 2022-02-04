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
    
    static var coords: [Bool: [Int: [Double]]] = [false: [106: [38.0580357142, 60.11396011], 108: [48.99555714, 42.307692307], 109: [37.2767857142, 42.3076923076], 120: [19.1964285714, 26.495726495], 122: [25.0, 21.296296296], 123: [33.59375, 21.22507122507], 124: [41.8526785714, 21.08262108262], 127: [53.34821142285, ]], true: [:]]
    
    
    init(level: Bool, name: String, room: String, classes: [String])
    {
        self.name = name
        self.level = level
        self.place = room
        self.classList = classes
    }
}
