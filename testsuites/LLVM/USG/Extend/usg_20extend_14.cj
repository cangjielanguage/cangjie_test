// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Foo {
    open prop let v1: Int64 {
        get() { 0 }
    }
    static prop let v2: Int64 {
        get() { 0 }
    }
}
extend Foo {
    override prop let v1: Int64 { // EXPECTED: regex  'override' modifier is illegal for property declaration in extend body
        get() { 0 }
    }
    open prop let v3: Int64 { // EXPECTED: regex 'open' modifier is illegal for property declaration in extend body
        get() { 0 }
    }
    redef static prop let v2: Int64 { // EXPECTED: regex 'redef' modifier is illegal for property declaration in extend body
        get() { 0 }
    }
}

func main() {
    return 0
}