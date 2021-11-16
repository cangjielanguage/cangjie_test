// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var x : Option<Option<Int64>> = Some<Option<Int64>>(Some<Int64>(1))
    var y : Option<Int64> = Some<Int64>(2)
    var z : Int64 = 3
    // calculate y ?? z first.
    // y ?? z == 2, 2 can be Int64 or ?Int64 or ??Int64 ...
    // but x ?? 2 need 2 to be ?Int64 (x ?? 2 == Some(1))
    // so b should at least be ?Int64
    var b : ?Int64 =  x ?? y ?? z
    var c : Int64 = b ?? 4
    return c - 1
}
