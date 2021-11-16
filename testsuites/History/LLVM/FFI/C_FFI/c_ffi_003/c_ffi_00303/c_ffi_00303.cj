// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
@c
record UnsafePtr {
    private var address : Int64 = 0
}

foreign func BadunsafePointerCast1(ptr:UnsafePtr): String
foreign func BadunsafePointerCast2(ptr:String): UnsafePtr

func FuncFromC():Int64{
  var input = "a"
  var ptr = unsafe { BadunsafePointerCast2(input) }
  var str = unsafe { BadunsafePointerCast1(ptr) }
  if (str == "a") {
    return 0
  }
  return 1
}


func main():Int64 {
  return FuncFromC()
}
