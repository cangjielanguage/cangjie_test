// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a : Int32 = 1
    var b = match (a)
    {
      case _ => "match"
    }
    var MyTuple = (
    match (a) {
      case _ => "match"
    },
    b
   )
    return 0
}
