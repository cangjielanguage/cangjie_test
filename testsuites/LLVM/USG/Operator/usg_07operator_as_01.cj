// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    var name: String = "Alice"
}
class Derived1 <: Base {
    var age: UInt8 = 18
}

func CheckResult<T>(a: Option<T>) {
    return match (a) {
        case Some(V) => print("success ")
        case $None => print("failure ")
    }
}

func main() {
    let base1: Base = Base()
    let base2: Base = Derived1()
    var castOP1 = base1 as Base        // castOP1 = Option<Base>.Some(Base())
    CheckResult<Base>(castOP1)
    var castOP2 = base1 as Derived1    // castOP2 = Option<Derived1>.None
    CheckResult<Derived1>(castOP2)
    var castOP3 = base2 as Base        // castOP3 = Option<Base>.Some(Derived1())
    CheckResult<Base>(castOP3)
    var castOP4 = base2 as Derived1    // castOP4 = Option<Derived1>.Some(Derived1())
    CheckResult<Derived1>(castOP4)
    return 0
}