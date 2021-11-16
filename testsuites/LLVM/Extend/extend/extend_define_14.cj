// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

enum TimeUnit{
	Month |
	Year
}

extend TimeUnit.Month { //EXPECTED: regex extending type 'Invalid' is not allowed
    func Day() {

    }
}

func main(): Int64 {
    return 0
}
