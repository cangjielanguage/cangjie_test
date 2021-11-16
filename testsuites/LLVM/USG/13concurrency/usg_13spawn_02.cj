// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan New thread, number = 0
// ASSERT:scan New thread, number = 1
// ASSERT:scan New thread, number = 2
// ASSERT:scan New thread, number = 3
// ASSERT:scan New thread, number = 4
// ASSERT:scan New thread, number = 5
// ASSERT:scan New thread, number = 6
// ASSERT:scan New thread, number = 7
// ASSERT:scan New thread, number = 8
// ASSERT:scan New thread, number = 9
// ASSERT:scan Main thread, number = 0
// ASSERT:scan Main thread, number = 1
// ASSERT:scan Main thread, number = 2
// ASSERT:scan Main thread, number = 3
// ASSERT:scan Main thread, number = 4
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
    let fut: Future<Unit> = spawn { =>
        for (i in 0..10) {
            print("New thread, number = ${i}\n")
            sleep(100*1000*1000) // sleep for 100ms.
        }
    }
    for (i in 0..5) {
        print("Main thread, number = ${i}\n")
        sleep(100*1000*1000) // sleep for 100ms.
    }
    fut.getResult() // wait for the thread to finish.
    return 0
}

