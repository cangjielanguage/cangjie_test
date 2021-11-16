// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c p1/a.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %f p1.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import p1.Ioo

func main(): Int64 {
    var a = Coo()
    foo(a)
    return 0
}

class Coo <: Ioo{
    func goo(){
        print("class")
    }

}

func foo(x:Ioo){
    x.goo()
}
