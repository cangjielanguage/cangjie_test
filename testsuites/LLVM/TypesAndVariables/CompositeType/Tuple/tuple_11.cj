// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func foo_tuple(): Int64{
  //  var res1 = true ? (3.14, 'P') : (3, 'P')
  //  var res2 = false ? (3.14, 'P') : (2.3, 'P')
    var res1 = (3.14, 'P')
    var res2 = (2.3, 'P')
    if (res1[0] == 3.14 && res2[0] == 2.3) {
        return 0
    }
        return 1
    }

func main():Int64{
    return foo_tuple()
}
