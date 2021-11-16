// EXEC: %compiler %cmp_opt -c %f
interface MyInterface{
  func test():Int32{
    var i : Array<Int32>
    return 1
  }
  let i : Array<Int32> = @{1}
}
