// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import collection.*
func main(): Int64 {
    var a: Buffer<Int64> = Buffer<Int64>(10)
    a.add(97)
    a.add(100)
    a.set(1,120)
    var b = a.get(1)
    print("b=${b.getOrThrow()}")
    if ( match(b){ case Some(x) => x;case None => 1} != 120 ){
        return 1
    }
    return 0
}

