// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan true

func main(): Int64 {
    var a : Int64 = 1
    func x(input:Int64):Bool{true}
    var b : ArrayList<Bool> = ArrayList<Bool>(a,x)
    func f(input:Int64*Bool){
        print(input[1].toString())
    }
    b.forEachWithIndex(f)
    return 0
}