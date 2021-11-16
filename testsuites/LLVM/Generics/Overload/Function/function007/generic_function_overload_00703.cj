// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class X<T>{
    var x: T
    init(input:T){
        x = input
    }
    func test (a:T,b:Int8):Int64{1}
    func test (a:T,b:Int16):Int32{2}
    func i(){var I : Int64 = test(x,1);return I}
}

func main():Int64{
    var I = X<Int32>(1).i()
    if (I != 1) {
        return 1
    }
    return 0
}