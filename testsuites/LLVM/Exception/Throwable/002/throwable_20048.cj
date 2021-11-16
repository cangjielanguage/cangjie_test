// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan finally_in!try!finally_out!success!

class A <: Throwable{}
class B <: Throwable{}

func test(){
    try {
        var f = spawn{
            try{
                throw A()
            } catch(e:B){
                print("catch_in!")
            }finally{
                print("finally_in!")
            }
        }
        f.getResult()
        print("try!")
    } catch (e:Throwable) {
        print("catch_out")
    }  finally {
        print("finally_out!")
    }
}

func main() {
    test()
    print("success!")
    return 0
}
