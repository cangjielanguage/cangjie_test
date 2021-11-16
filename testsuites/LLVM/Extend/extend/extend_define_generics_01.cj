// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class Foo<T> {

}

extend Foo { //EXPECTED: regex generic type should be used with type argument

}

func main(): Int64 {
    return 0
}