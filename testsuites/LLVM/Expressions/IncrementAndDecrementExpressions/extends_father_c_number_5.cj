// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Parent {
    protected var field : Int32 = 1
}

class Child <: Parent {
    func main(): Int64 {
        var child : Child = Child()
    field--
    field++
        if (child.field != 1) {
            return 1
        }
        return 0
    }
}
func main():Int64{
  var child = Child()
  return child.main()
}
