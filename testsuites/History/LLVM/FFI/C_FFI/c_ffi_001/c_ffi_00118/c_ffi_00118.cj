// DEPENDENCE: %n.c
// EXEC: %compiler -frontend %cmp_opt -no-prelude %f -o %n.bc 2>&1 | compare %f
// ASSERT: regex function declaration must have function body

record MyRecord {
  var a : Int64
  var b : Int64
  var c : Int64
}

func PassToCBigger(input:MyRecord): MyRecord

func PassAndReturnCStructByValueBigger():Int64
{
  var a = MyRecord(1,1,1)
  var biggerReturn = PassToCBigger(a)
  return 1
}

func main():Int64 {
  return PassAndReturnCStructByValueBigger()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
