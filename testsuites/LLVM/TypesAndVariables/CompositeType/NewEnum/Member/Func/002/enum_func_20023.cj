// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class C{}

enum A{
    a(Int64)
    operator func !():Int64{0}
}


func main(): Int64 {
	  !A.a(1)
    return 0
}
