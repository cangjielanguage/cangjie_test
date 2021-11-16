// EXEC: %compiler -frontend %cmp_opt -typecheck %f
// EXEC: if [ -f %n.bc ]||[ -f %n.o ]||[ -f %n ] ;then exit 1 ;fi

func main(): Int64 {
    return run()
}

func run(): Int64 {
    var b:Base = Base(b:5)
    var f = b.foo(a:5)
    var g = foo(a:5)
    return 0
}


class Base{
    init(a!:Int32=1){print("init1\n")}
    init(b!:Int32=1,c!:Int32=1){print("yes\n")}

    func foo(a!:Int32=1){print("yes\n")}
    func foo(b!:Int32=1,c!:Int32=1){print("foo2\n")}
}
func foo(a!:Int32=1){print("yes\n")}
func foo(b!:Int32=1,c!:Int32=1){print("foo2\n")}
