// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args

// 定义与BiggerStruct布局相同的record类型
@c
record BiggerStruct {
   BiggerStruct(var a: Int64, var b: Int64, var c: Int64) {} // int64映射C侧long long
}
// 声明native函数，函数参数返回值用record类型直接映射C Struct类型
foreign func PassToCBigger(x:BiggerStruct): BiggerStruct

func PassAndReturnCStructByValueBigger():Int64
{
  var biggerPass = BiggerStruct(11,22,33) // 创建record
  var biggerReturn = unsafe { PassToCBigger(biggerPass) }// 传入C侧
  var ret = biggerReturn.a + biggerReturn.b + biggerReturn.c
  if (ret == 132) {
    return 0
  }
  return 1
}

func main():Int64 {
  return PassAndReturnCStructByValueBigger()
}
