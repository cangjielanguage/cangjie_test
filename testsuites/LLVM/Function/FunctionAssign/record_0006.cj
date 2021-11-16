// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f

record R<T>{
    static func funca(a:Int32): Int32{
      return a
    }
}

let a = R.funca  // EXPECTED: regex generic type should be used with type argument
var b = R.funca  // EXPECTED: regex generic type should be used with type argument

func main(): Int64{
    return 0
}
