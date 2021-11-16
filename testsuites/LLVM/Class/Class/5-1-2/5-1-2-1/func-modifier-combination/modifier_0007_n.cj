// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex  super class 'Base' is not inheritable, use 'open' modifier instead


class Base {
    public  func get() : Int32 {
        return 1
    }
}

class Data <: Base {
        public override func get() : Int32 {
        return 2
    }
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
