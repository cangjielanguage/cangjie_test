// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
interface I{
	func foo(){
	  return 1
	}
}

extend Range<T> <: I where T <: Int64, T <: AddInt64<T>, T <: Comparable<T>, T <: Equatable<T> {
	func foo(){
	  return 1
	}

  func me() {
    return foo()
  }
}

func main(): Int64 {
	let a = 1..2:1
  return a.me() - 1
}