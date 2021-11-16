// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class X<T>{
    static func test<T> (a:T,b:Int8):Int64{1}
    static func test<T> (a:T,b:Int64):Int32{2}
}

func main():Int64{
    var I : Int64 = X<Int64>.test(1,1)
    if (I != 1) {
        return 1
    }
    return 0
}