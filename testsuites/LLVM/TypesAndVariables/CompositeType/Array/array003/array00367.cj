// EXEC: %compiler %cmp_opt %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class A{
  let a : Int32 = 5
}

class B <: A{
  let b = Array<Int32>(5,super.a) // EXPECTED: regex 'super' is not allowed to initialize non-static member
}

func main(): Int64{
    let a = B()
    return 0
}
