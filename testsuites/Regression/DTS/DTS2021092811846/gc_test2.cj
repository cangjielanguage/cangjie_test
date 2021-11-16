// DEPENDENCE: GcTestCase.cj MemAllocUtil.cj
// EXEC: %compiler %cmp_opt %f GcTestCase.cj MemAllocUtil.cj GcTestCase.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex is a duplicate source file

package test.memory

var total = 10000

func main(){
    while (true) {
        total -= 1
        try{
            gc_test2()
        } catch (e:Throwable){
            print("Exception Here!")
            e.printStackTrace()
            break
        }
        print("case run ${total}\n")
        if (total < 0){
            break
        }
    }
    return 0
}
