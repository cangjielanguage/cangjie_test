// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var (a,b) = (foo,goo)

func foo(){return 1}

func goo(){return 1}

func main() : Int64 {
    if ( a() != 1 ){
        return 1
    }
    if ( b() != 1 ){
        return 1
    }
    return 0
}