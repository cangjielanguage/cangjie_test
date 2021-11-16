// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

open class A {
     static prop var i: Int64 {
        get() { return 0 }
        set(v) {}
    }
}
class B <: A {
    redef prop var i: Int64 { // EXPECTED: regex non-static member 'i' cannot have the same name with static member in parent class or interfaces
            get() { return 0 }
        set(v) {}
    }
}


func main():Int64 {
    return 0
}
