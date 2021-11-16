// ERRCHECK: %compiler %cmp_opt %f -o %output

trait X<T>{
    func a(x:T):T
    func b(x:T):T
    func c(x:(T)->T):T
}

append Bool with X<Int64>{
    func a(x:Int64):Int64{x}
    func b(x:Int64):Int64{x}
    func c(x:(Int64)->Int64):Int64{x(1)}
}

func main(): Int64 {
    1 |> a<Bool,Int64>
    a<Bool,Int64>~>b<Bool,Int64> // EXPECTED: regex this usage is not supported
    1 |> (a<Bool,Int64>~>b<Bool,Int64>)

    return (a<Bool,Int64> ~> b<Bool,Int64> |> c<Bool,Int64>) - 1
}
