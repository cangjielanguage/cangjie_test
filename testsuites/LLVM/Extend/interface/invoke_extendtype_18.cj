// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
interface I{
	func foo(){
	  return 1
	}
}

enum TimeUnit{
	Month |
	Year
}

extend TimeUnit <: I{
	func foo(){
	  return 1
	}

    func Day() {
        return foo()
    }
}

func main(): Int64 {
	let a = TimeUnit.Month
	let b = TimeUnit.Year
    return a.Day() - 1
}
