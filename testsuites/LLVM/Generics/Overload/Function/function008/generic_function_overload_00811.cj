// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test <T>(a:T){return 1}
class A<T>{
    func test(a:T){return 2}
    func i(input:T){
        var I = test(input)
        return I
   }
}

func main():Int64{
    var I = A<Int64>().i(1)
    if (I != 2) {
        return 1
    }
    return 0
}