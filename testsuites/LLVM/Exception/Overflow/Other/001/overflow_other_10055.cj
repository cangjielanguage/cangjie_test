// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

@overflowThrowing
func test():Int8{
    @overflowThrowing
    func test():Int8{
        @overflowThrowing
        func test():Int8{
            @overflowThrowing
            func test():Int8{
                @overflowThrowing
                func test():Int8{
                    @overflowSaturating
                    func test():Int8{
                        var x : Int8 = 100
                        return x+x
                    }
                    test()
                }
                test()
            }
            test()
        }
        test()
    }
    test()
}


func main(){
    var res = test()
    print("success")
    return Int64(res) - 127
}
