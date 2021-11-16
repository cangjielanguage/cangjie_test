// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
enum MyEnum{
  a(Int32)
}

func main(): Int64 {
    var aa = MyEnum.a(1)
    var MyTuple = (aa,MyEnum.a(1))
    return 0
}
