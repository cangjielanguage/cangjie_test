// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface B{ let b : Int32 = 0}
class A <: B{}


func g<T>(a:T){
    var b : B = A()
    var c : A = A()
    var e : Int32 = B.b
    e++
    var f : Array<Int32> = @{1}
    if e == 2{
        e = e + f[0]
    } else {
        e = e - f[0]
    }
    while false{
        print("error")
    }
    var g : Int32*Int32 = (1,1)
    var h = Int64(e)
    var j : Unit = ()
    return 0
}

func main(){
    return g<A>(A())
}