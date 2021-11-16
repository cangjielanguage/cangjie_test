// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan non-static generic member function 'test' is not supported

class A <: Throwable{}

extend A{
    func test<T>(a:T){throw A()}
}

func main() {
    A().test<Int64>(1)
    return 5 // throw before main.
}
