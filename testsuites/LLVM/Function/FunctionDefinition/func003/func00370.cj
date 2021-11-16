// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(a : Int32, b : Int16,
          c : Int8, d : Int64,
          e : UInt32, f : UInt16,
          g : UInt8, h : UInt64
         ): Int64 {
    return 0
}

func main(): Int64 {
    var a : Int32 = 0
    var b : Int16 = 0
    var c : Int8 = 0
    var d : Int64 = 0
    var e : UInt32 = 0
    var f : UInt16 = 0
    var g : UInt8 = 0
    var h : UInt64 = 0
    return test(a,b,c,d,e,f,g,h)
}
