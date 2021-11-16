// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// spec 示例转化
class Point {
    var x: Int32 = 0
    var y: Int32 = 0
    init (a: Int32, b: Int32) {
        x = a
        y = b
    }
    operator func -(): Point {Point(-this.x, -this.y)}
    operator func +(right: Point): Point { Point(this.x + right.x, this.y + right.y)}
}

func main(): Int64 {
    let p1 = Point(8, 24)
    let p2 = -p1
    let p3 = p1 + p2
    if (p2.x == -8 && p3.y == 0) {
        return 0
    }
    return 1
}