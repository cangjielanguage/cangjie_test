//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

record test<T>{
    let a : T
    let i : Int64 = 1
    func x(input:Int64):T{a} 
    var myArray : ArrayList<T> = ArrayList<T>(i,x) // EXPECTED: regex-auto 'x' is not allowed to be accessed before all member variables are initialized
}

func main(): Int64 {
    test<Int64>(a:1)
    return 0
}
