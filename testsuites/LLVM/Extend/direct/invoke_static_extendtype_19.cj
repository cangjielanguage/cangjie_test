// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

extend Range<T> where T <: Int64, T <: AddInt64<T>, T <: Comparable<T>, T <: Equatable<T> {
  static func me() {
    return 1
  }
}

func main(): Int64 {
  return Range<Int64>.me() - 1
}