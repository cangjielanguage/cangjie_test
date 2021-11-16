// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
var x = 0
var y = 0

func first():Int64  {x = 1;y=y+1;return 1}
func second():?Int64{x = 2;y=y+1;return 2}
func third():??Int64{x = 3;y=y+1;return 3}

func main(): Int64 {
    // only calculate third().
    var b = third() ?? second() ?? first()
    return x + y - 4
}
