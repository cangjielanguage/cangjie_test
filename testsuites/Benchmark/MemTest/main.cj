// DEPENDENCE: GcTestCase.cj MemAllocTestCase.cj MemAllocUtil.cj ThreadTest.cj
// EXEC: %compiler %cmp_opt GcTestCase.cj MemAllocTestCase.cj MemAllocUtil.cj ThreadTest.cj %f
// Only compile, not run on ci.

package test.memory

var total = 10000

func main(){
    while (true) {
        total -= 1
        try{
            gc_test1()
            gc_test2()
            gc_test3()
            gc_test4()
            gc_test5()
            gc_test6()
            gc_test7()
            gc_test8()
            testcase_1()
            testcase_2()
            testcase_3()
            testcase_5()
            testcase_6()
            testcase_6_1()
            testcase_7()
            testcase_8()
            testcase_9()
            testcase_10()
            testcase_11()
            testcase_12()
            testcase_13()
            testcase_14()
            testcase_15()
            testcase_16()
            testcase_17()
            testcase_18()
            testcase_19()
            testcase_20()
            testcase_21()
            testcase_22()
            testcase_23()
            testcase_24()
            testcase_25()
            testcase_26()
            thread_testcase30()
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
