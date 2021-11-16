// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test <T>(a:T){return 1}
class A{
    func test(a:Int64){return 2}
    func i(){
        var I = test(1)
        return I
   }
}

func main():Int64{
    var I = A().i()
    if (I != 2) {
        return 1
    }
    return 0
}