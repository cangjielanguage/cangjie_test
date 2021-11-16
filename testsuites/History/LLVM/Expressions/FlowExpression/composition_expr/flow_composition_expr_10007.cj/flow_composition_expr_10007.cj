// ERRCHECK: %compiler %cmp_opt %f -o %output

trait X{func asFunc(x:This,y:Int64):Int64}
append Int64 with X{func asFunc(x:Int64,y:Int64):Int64{x}}


func main(): Int64 {
    1&1 |> 1&1 ~> 1&1) // EXPECTED: regex-auto  type check of flow expression fails for operator ~>
    return 0
}
