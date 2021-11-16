// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

package pkg

var b = match (Data.T) {
    case _:pkg.T => 1
    case x:Data => 0
    case _ => 2
}


class T {}

enum Data{
    T | V
}

func main(): Int64 {
    if ( b != 0 ){
        return 1
    }
    return 0
}