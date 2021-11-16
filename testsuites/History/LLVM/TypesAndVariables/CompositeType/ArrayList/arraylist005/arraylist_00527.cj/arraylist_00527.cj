// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var x : ArrayList<Unit> = ArrayList<Unit>(10)

func a(input!:ArrayList<Unit>=x){}

trait X{
    func b(input_a:This,input_b!:ArrayList<Unit>=x):ArrayList<Unit>
}

append Int64 with X{
    func b(input_a:Int64,input_b!:ArrayList<Unit>=x):ArrayList<Unit>{input_b}
}

class C{
    func c(input!:ArrayList<Unit>=x):ArrayList<Unit>{input}
}

record R{
    func r(input!:ArrayList<Unit>=x):ArrayList<Unit>{input}
}

interface I{
    func i(input!:ArrayList<Unit>):ArrayList<Unit>{input}
}

func main(): Int64 {
    return 0
}
