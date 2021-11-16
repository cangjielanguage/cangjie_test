// DEPENDENCE: %n.c
// EXEC: %compiler -frontend %cmp_opt %f -o %n.bc 2>&1 | compare %f
// ASSERT: regex redefinition of declaration 'unsafePointerCast1'
class BadUnsafePtr{}

foreign func unsafePointerCast1(ptr:BadUnsafePtr): String
foreign func unsafePointerCast1(ptr:String): BadUnsafePtr

func FuncFromC():Int64{
  var input = "a"
  var ptr = unsafePointerCast1(input)
  var str = unsafePointerCast1(ptr)
  if (str == "a") {
    return 0
  }
  return 1
}


func main():Int64 {
  return FuncFromC()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
