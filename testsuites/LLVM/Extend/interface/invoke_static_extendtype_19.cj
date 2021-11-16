// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

extend Range<T> <: I where T <: Int32, T <: AddInt64<T>, T <: Comparable<T>, T <: Equatable<T> {
  static func me() { 
    return foo()
  }
}

interface I{
  static func foo(){
    1
  }
}


func main(): Int64 {
  return Range<Int32>.me() - 1
}