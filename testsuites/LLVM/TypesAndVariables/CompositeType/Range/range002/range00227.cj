// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

extend Range<T> where T<:Int64, T <: AddInt64<T>, T <: Comparable<T>, T <: Equatable<T>  {
  func plus(b: Range<Int64>): Range<Int64> {
    var a_index = 0
    var b_index = 0
    for (i in this) {
      a_index++
    }
    for (i in b) {
      b_index++
    }
    return a_index..b_index
  }
}

func main(): Int64 {
  var range1 = 0..1
  var range2 = 0..10
  var range3 = range1.plus(range2) // range3 == 1..10
  var a = Array<Int64>([10,1,2,3,4,5,6,7,8,9])
  var res = 0
  for (i in a[range3]) {
      res = res + i
  }
  if (res == 45) {
      return 0
  }
  return 1
}
