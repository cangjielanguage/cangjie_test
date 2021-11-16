// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A{
    static func test(input:Int64){
        var a : List<Int64> = [input]
        return a.size() - 1
    }
}

class Test <: A{}

func main(): Int64 {
    return Test.test(1)
}
