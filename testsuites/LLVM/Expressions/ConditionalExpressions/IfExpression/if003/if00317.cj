// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A {
    var a : Int32
    init(){
        this.a = 1
    }
    func test(){
        if (true) {
            A()
        }
    }
}

func main(): Int64 {
    if (true) {
        return 0
    }
    return 1
}
