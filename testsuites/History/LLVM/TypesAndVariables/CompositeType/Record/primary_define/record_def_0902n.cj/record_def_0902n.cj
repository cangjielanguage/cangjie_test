// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-auto illegal object in toplevel
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data {
    trait Addable {
        func add(a: This): This
    }
}

func main(): Int64 {
    var data: Data = Data()
    return 0
}

