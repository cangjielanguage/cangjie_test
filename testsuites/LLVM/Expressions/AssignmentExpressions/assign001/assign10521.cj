// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record LA{
  var a : Array<Unit>
  init(input:Unit){
    a = @{input}
  }
}

func main(): Int64 {
    var l_a = LA(())
    
    l_a.a[0] = do {} while (false)
    if (l_a.a[0] == ()) {
        return 0
    }
    return 1
}
