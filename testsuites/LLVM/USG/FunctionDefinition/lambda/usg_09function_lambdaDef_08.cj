// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check the lambda definition and call without return keyword
func h(x : Int64, f : (Int64) -> Int64) {
      return f(x)
}

func main(): Int64 {
    var f = h(2, {x => x * 2 - 4})
    return f
}