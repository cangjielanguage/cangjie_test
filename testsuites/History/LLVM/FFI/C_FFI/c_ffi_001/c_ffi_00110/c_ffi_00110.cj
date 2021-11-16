// DEPENDENCE: %n.c
// EXEC: %compiler %cmp_opt %f  -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

record MyRecord {
  var a : Int64
  record Inside {  // EXPECTED: regex illegal record member in record block
    var b : Int64
    var c : Int64
  }
}

foreign func PassToCBigger(input:MyRecord): MyRecord

func PassAndReturnCStructByValueBigger():Int64
{
  var biggerPass = MyRecord(a:1,Inside(1,1))
  var biggerReturn = PassToCBigger(biggerPass)

  return 0
}

func main():Int64 {
  return PassAndReturnCStructByValueBigger()
}
