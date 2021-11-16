// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f
// TODO： 内部类暂未实现
class Foo {
	static class FooI{

	}
}

class Base{
	
}

extend Foo.FooI <: I { //EXPECTED: regex expected an interface here
    
}

func main(): Int64 {
    return 0
}