// EXEC-PIPE-1: %compiler %cmp_opt  -c %f 2>&1 | compare %f

class Base<T> {
    func f() : Int32 {
        return 1
    }
    static func get<U>() : Int32 {
        match f(){ //EXPECTED: regex-auto missing '(' in match expression
            case _ => 5
        }
        return 1
    }

    private static func get<U>(a: Int64) : Int32 {
        match f(){ //EXPECTED: regex-auto missing '(' in match expression
            case _ => 5
        }
        return 1
    }

    protected static func get(a: Int64, b: Bool) : Int32 {
        match f(){ //EXPECTED: regex-auto missing '(' in match expression
            case _ => 5
        }
        return 1
    }

    public static func get(a: Int64, b: Bool, c: Int64, d!: Bool =
    {f(); true}()// EXPECTED: regex invalid use of non-static member 'f' in static lambda expression
    ) : Int32 {
        match f(){ //EXPECTED: regex-auto missing '(' in match expression
            case _ => 5
        }
        return 1
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
