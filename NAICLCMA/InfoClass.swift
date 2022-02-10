import Foundation

public class InfoClass{
    
    var first, second, third, fourth, fifth, sixth, seventh, eighth, ninth: String
    
    init(first: String, second: String, third: String, fourth: String, fifth: String, sixth: String, seventh: String, eighth: String, ninth: String) {
        self.first = first
        self.second = second
        self.third = third
        self.fourth = fourth
        self.fifth = fifth
        self.sixth = sixth
        self.seventh = seventh
        self.eighth = eighth
        self.ninth = ninth
    }
    
    func getFirst() -> String{
        return first
    }
    
    func getSecond() -> String{
        return second
    }
    
    func getThird() -> String{
        return third
    }
    
    func getFourth() -> String{
        return fourth
    }
    
    func getFifth() -> String{
        return fifth
    }
    
    func getSixth() -> String{
        return sixth
    }
    
    func getSeventh() -> String{
        return seventh
    }
    
    func getEighth() -> String{
        return eighth
    }
    
    func getNinth() -> String{
        return ninth
    }
}
