// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan New thread, number = 0\nNew thread, number = 1\nNew thread, number = 2\nNew thread, number = 3\nNew thread, number = 4\nNew thread, number = 5\nNew thread, number = 6\nNew thread, number = 7\nNew thread, number = 8\nNew thread, number = 9\nMain thread, number = 0\nMain thread, number = 1\nMain thread, number = 2\nMain thread, number = 3\nMain thread, number = 4\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
    let fut: Future<Unit> = spawn { =>
        for (i in 0..10) {
            print("New thread, number = ${i}\n")
            sleep(100*1000*1000) // sleep for 100ms.
        }
    }
    fut.getResult() // wait for the thread to finish.
    for (i in 0..5) {
        print("Main thread, number = ${i}\n")
        sleep(100*1000*1000) // sleep for 100ms.
    }
    return 0
}
