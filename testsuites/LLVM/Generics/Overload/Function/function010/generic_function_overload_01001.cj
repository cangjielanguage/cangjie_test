// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class Base{}
func f(a: Base): Int64 {0}
func f<X>(a: X): Int64 {1}

func main() {
    f(Base())
}
