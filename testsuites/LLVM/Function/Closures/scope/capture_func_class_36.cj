// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

class Aoo{
    var a: Int32 = 1
    let b: Int32 = 2
    var c = if(true){
        func foo1(x!:Int32=a){return x} // EXPECTED: regex-auto 'a' is not allowed to be accessed before all member variables are initialized
        func foo2(){var x = a;return x} // EXPECTED: regex-auto 'a' is not allowed to be accessed before all member variables are initialized
        func foo3(){return a} // EXPECTED: regex-auto 'a' is not allowed to be accessed before all member variables are initialized
        func foo4(){ a ; return 1} // EXPECTED: regex-auto 'a' is not allowed to be accessed before all member variables are initialized
        func foo5(){ a } // EXPECTED: regex-auto 'a' is not allowed to be accessed before all member variables are initialized

        func foo10(x!:Int32=b){return x} // EXPECTED: regex-auto 'b' is not allowed to be accessed before all member variables are initialized
        func foo20(){var x = b;return x} // EXPECTED: regex-auto 'b' is not allowed to be accessed before all member variables are initialized
        func foo30(){return b} // EXPECTED: regex-auto 'b' is not allowed to be accessed before all member variables are initialized
        func foo40(){ b ; return 1} // EXPECTED: regex-auto 'b' is not allowed to be accessed before all member variables are initialized
        func foo50(){ b } // EXPECTED: regex-auto 'b' is not allowed to be accessed before all member variables are initialized

        func goo1(){
            var a = foo1
            return a
        }
        func goo2(){
            var a = foo2
            return a
        }
        func goo3(){
            var a = foo3
            return a
        }
        func goo4(){
            var a = foo4
            return a
        }
        func goo5(){
            var a = foo5
            return a
        }
    }
}
