// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record Rectangle {
    private var length : Int32 = 0
    private var width : Int32 = 0
    var perimeter : Int32 = 0
    init(length: Int32, width: Int32) {
        this.length = length
        this.width = width
    }
    func getPerimeter() {
        return this.perimeter // Ok: 函数可通过 `this.memberName` 的方式访问名为 `memberName` 的实例成员变量；
    }
    
}

func main(){
    var t: Rectangle = Rectangle(1,2)
    var k = t.getPerimeter()
    print("${k}")
    return 0
}

