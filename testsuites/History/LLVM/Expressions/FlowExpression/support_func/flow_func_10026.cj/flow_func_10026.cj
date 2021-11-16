// ERRCHECK: %compiler %cmp_opt %f -o %output

trait X{
    func a(x:This):This
    func b(x:This):This
    func c(x:(This)->This):Int64
}

append<T> T with X{
    func a(x:T):T{x}
    func b(x:T):T{x}
    func c(x:(T)->T):Int64{1}
}

func main(): Int64 {
    1 |> a<Int64>
    a<Int64>~>b<Int64> // EXPECTED: regex this usage is not supported
    1 |> (a<Int64>~>b<Int64>)
    return (a<Int64> ~> b<Int64> |> c<Int64>) - 1
}
