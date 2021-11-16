// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record R<T>{
    operator func test (inputB:R<T>):Bool{ // EXPECT: scan illegal operator 'test' for overloading
        return true
    }
}

class C<T>{
    operator func test (inputB:C<T>):Bool{ // EXPECT: scan illegal operator 'test' for overloading
        return true
    }
}

interface I<T>{
    operator func test (inputB:I<T>):Bool{ // EXPECT: scan illegal operator 'test' for overloading
        return true
    }
}

func main():Int64{
    return 1
}
