// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

extend Range<T> where T <: Int64, T <: AddInt64<T>, T <: Comparable<T>, T <: Equatable<T> {
  func me() {
    return 1
  }
}

func main(): Int64 {
	let a = 1..2:1
  return a.me() - 1
}