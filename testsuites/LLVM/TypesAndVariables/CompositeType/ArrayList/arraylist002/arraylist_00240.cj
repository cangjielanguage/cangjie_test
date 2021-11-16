// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface test<T>{
    static func out(input:T){
        func x(inp:Int64):T{
            return input
        }
        var i : Int64 = 10
        var myArray : ArrayList<T> = ArrayList<T>(i,x)
    }
}

class B<T><:test<T>{

}

func main(): Int64 {
    B<Int64>.out(1)
    return 0
}