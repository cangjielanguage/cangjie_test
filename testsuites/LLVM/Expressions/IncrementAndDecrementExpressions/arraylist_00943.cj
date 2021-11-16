// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A{}

func main(): Int64 {
    var a : Int64 = 10
    func x(input:Int64):A{A()}
    a--
    a++
    var b : ArrayList<A> = ArrayList<A>(a,x)

    a--
    a++
    b.add(A())

    return 0
}