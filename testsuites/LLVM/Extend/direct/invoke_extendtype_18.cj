// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit{
	Month |
	Year
}

extend TimeUnit {
    func Day() {
        return 0
    }
}

func main(): Int64 {
    let a = TimeUnit.Month
	let b = TimeUnit.Year
    return a.Day()
}
