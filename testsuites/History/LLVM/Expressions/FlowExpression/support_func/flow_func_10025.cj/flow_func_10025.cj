// ERRCHECK: %compiler %cmp_opt %f -o %output

trait X{
    func a(x:This):This
    func b(x:This):This
    func c(x:(This)->This):This
}

append Int64 with X{
    func a(x:Int64):Int64{x}
    func b(x:Int64):Int64{x}
    func c(x:(Int64)->Int64):Int64{x(1)}
}

func test<T1,T2,T3>(f:(T1)->T2,g:(T2)->T3):(T1)->T3
{
  return { x:T1 => g(f(x))}
}


func main(): Int64 {
    1 |> a
    a<Int64>~>b<Int64> // EXPECTED: regex this usage is not supported
    test(a<Int64>,b<Int64>)
    1 |> (a<Int64>~>b<Int64>)
    return (a<Int64> ~> b<Int64> |> c<Int64>) - 1
}
