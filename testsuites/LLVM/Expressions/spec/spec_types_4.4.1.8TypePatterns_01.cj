// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Point {
    var x: Int32 = 1
    var y: Int32 = 2
    init(x: Int32, y: Int32) {
        this.x = x
        this.y = y
    }
}
class ColoredPoint <: Point {
    var color: String = "green"
    init(x: Int32, y: Int32, color: String) {
        super(x, y)
        this.color = color
    }
}

func main():Int64{ 
    let normalPt = Point(5,10)
    let colorPt = ColoredPoint(8,24,"red")
    var rectangleArea1: Int32 = match (normalPt) {
        case _: Point => normalPt.x * normalPt.y
        case _ => 0
    }
    var rectangleArea2: Int32 = match (colorPt) {
        case cpt: Point => cpt.x * cpt.y
        case _ => 0
    }
    return 0
}

