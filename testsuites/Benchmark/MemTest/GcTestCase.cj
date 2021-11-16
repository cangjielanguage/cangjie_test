package test.memory


var DEFAULT_THREAD_NUM_GC = 10
var GC_THREAD_NOTIFY = DEFAULT_THREAD_NUM_GC
var GC_TEST_NAME = "gc testcase"
var THREAD_SLEEP_TIME_DEFAULT = 1
var THREAD_REPEATS_INFINITE = -1
var THREAD_REPEATS_DEFAULT = 1
var STATIC_REFERENCE_MAX = 100000
var STATIC_SIZE_MAX = 20*1024*1024
var STACK_SIZE_MAX = STATIC_SIZE_MAX
var FINALIZE_SIZE_MAX = STATIC_SIZE_MAX
var STRING_REFERENCE_MAX = 500000
var STACK_REFERENCE_MAX = 100000
var mstaticreference = ArrayList<?AllocUnit>()
var mstaticstring = ArrayList<String>()
var gc_thread_count = 0

class CommonRun <: Runnable {
    var sleepTime: Int64
    var repeats: Int64
    var r : Runnable
    init(
        r: Runnable,
        sleepTime: Int64,
        repeatTimes!: Int64 = THREAD_REPEATS_INFINITE
    ){
        this.sleepTime = sleepTime
        repeats = repeatTimes
        this.r = r
    }

    func run(){
        while (THREAD_REPEATS_INFINITE == repeats || repeats > 0) {
            if (repeats > 0) {
                repeats--
            }
            r.run()
            trySleep(sleepTime)
            if (!mRunning) {
                break
            }
        }
    }
}

class AllocUnitCycleMaster <: AllocUnit{
    var slave : ?AllocUnitCycleSlave = None // TODO: not equal to java.
    init(arrayLength:Int64){
        super(arrayLength)
        slave = AllocUnitCycleSlave(arrayLength, this)
    }
}

class AllocUnitCycleSlave <: AllocUnit{
    var master : AllocUnitCycleMaster
    init(arrayLength:Int64, master:AllocUnitCycleMaster){
        super(arrayLength)
        this.master = master
    }
}

func static_test(){
    static_test_alloc();
    static_test_free();
}

// TODO: need random!
func static_test_alloc(){
    var allocsize = 0
    // var rand = Random()
    var randNumber = 128/2 + 8
    for (i in 0..STATIC_REFERENCE_MAX){
        for (j in 0..10){
            randNumber = 128/2 + 8
            var one = AllocUnitCycleMaster(randNumber)
            addtomstaticreference(one)
            allocsize = allocsize + 2 * randNumber
        }
        if (allocsize > STATIC_SIZE_MAX) {return}
        for (j in 0..10){
            randNumber = 1888/2 + 144
            var one = AllocUnitCycleMaster(randNumber)
            addtomstaticreference(one)
            allocsize = allocsize + 2 * randNumber
        }
        if (allocsize > STATIC_SIZE_MAX) {return}
        randNumber = 12288/2 + 2048
        allocsize = allocsize + 2 * randNumber
        if (allocsize > STATIC_SIZE_MAX) {return}
        var one = AllocUnitCycleMaster(randNumber)
        addtomstaticreference(one)
    }
}

func static_test_preempt(){
    static_test_alloc_preempt()
    thread_test_gc()
}

// TODO: need random!
func static_test_alloc_preempt(){
    var allocsize = 0
    var randNumber = 128/2 + 8
    for(i in 0..STATIC_REFERENCE_MAX){
        for (j in 0..10){
            randNumber = 128/2+8
            var one = AllocUnitCycleMaster(randNumber)
            settomstaticreference(i, one)
            allocsize = allocsize + 2 * randNumber
        }
        if (allocsize > STATIC_SIZE_MAX) {return}
        for (j in 0..10){
            randNumber = 1888/2 + 144
            var one = AllocUnitCycleMaster(randNumber)
            settomstaticreference(i, one)
            allocsize = allocsize + 2 * randNumber
        }
        if (allocsize > STATIC_SIZE_MAX) {return}
        randNumber = 12288/2 + 2048
        allocsize = allocsize + 2 * randNumber
        if (allocsize > STATIC_SIZE_MAX) {return}
        var one = AllocUnitCycleMaster(randNumber)
        settomstaticreference(i, one)
    }
}

var addtomstaticreference_m = Mutex()
func addtomstaticreference(one:AllocUnit){
   synchronized (addtomstaticreference_m) {
        mstaticreference.add(one)
   }
}


var settomstaticreference_m = Mutex()
func settomstaticreference(i:Int64, one:AllocUnit){
   synchronized (settomstaticreference_m) {
        mstaticreference.set(i,one)
   }
}

var static_test_free_m = Mutex()
func static_test_free(){
   synchronized (static_test_free_m) {
        mstaticreference.clear()
        thread_test_gc()
   }
}

var reset_m = Mutex()
func reset_mstaticreference(){
    var s = 0
    synchronized(reset_m)
    {
        s = mstaticreference.size();
    }
    for (i in s..STATIC_REFERENCE_MAX){
        // TODO: compiler bug here.
        //synchronized(reset_m)
        //{
            mstaticreference.add(None<AllocUnit>);
        //}
    }
    //synchronized(reset_m)
    //{
        for (i in 0..mstaticreference.size()){
            match (mstaticreference.get(i)) {
                case Some(V) => mstaticreference.set(i,None<AllocUnit>);()
                case $None => ()
            }
        }
    //}
}


var thread_test_gc_m = Mutex()
func thread_test_gc(){
    synchronized(thread_test_gc_m) {
        if (gc_thread_count >= GC_THREAD_NOTIFY){
            gc_thread_count = 0
            unsafe{
                MCC_NativeGC()
            }
        } else{
            gc_thread_count++
        }
    }
}

foreign func MCC_NativeGC(): Unit

class Gc_TestCase_1 <: Runnable{
    func run(){
        static_test()
    }
}


external func gc_testcase1(){
    print("[INFO]start ${GC_TEST_NAME}_1!\n")
    var list = ArrayList<Thread>()
    for (i in 0..DEFAULT_THREAD_NUM_GC){
        var tmp : Runnable = CommonRun(Gc_TestCase_1(), THREAD_SLEEP_TIME_DEFAULT, repeatTimes:THREAD_REPEATS_DEFAULT)
        var t = Thread(tmp, GC_TEST_NAME + "_testcase1_${i}")
        list.add(t)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    // manually gc here.
    trySleep(1000)
    print("[INFO]end ${GC_TEST_NAME}_1!\n")
}

external func gc_test1(){
    print("[INFO]start ${GC_TEST_NAME}_1!\n")
    var list = ArrayList<Thread>()
    for (i in 0..DEFAULT_THREAD_NUM_GC){
        var tmp : Runnable = CommonRun(Gc_TestCase_1(), THREAD_SLEEP_TIME_DEFAULT, repeatTimes:THREAD_REPEATS_DEFAULT)
        var t = Thread(tmp, GC_TEST_NAME + "_testcase1_${i}")
        list.add(t)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    // manually gc here.
    unsafe{
        MCC_NativeGC()
    }
    trySleep(1000)
    print("[INFO]end ${GC_TEST_NAME}_1!\n")
}


class Gc_TestCase_2 <: Runnable{
    func run(){
        static_test_preempt()
    }
}

external func gc_test2(){
    print("[INFO]start ${GC_TEST_NAME}_2!\n")
    reset_mstaticreference()
    var list = ArrayList<Thread>()
    for (i in 0..DEFAULT_THREAD_NUM_GC){
        var tmp : Runnable = CommonRun(Gc_TestCase_2(), THREAD_SLEEP_TIME_DEFAULT, repeatTimes:THREAD_REPEATS_DEFAULT)
        var t = Thread(tmp, GC_TEST_NAME + "_testcase2_${i}")
        list.add(t)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    mstaticreference.clear()
    unsafe{
        MCC_NativeGC()
    }
    trySleep(1000)
    print("[INFO]end ${GC_TEST_NAME}_2!\n")
}

var addtoStaticString_m = Mutex()
func addtoStaticString(a:String){
    synchronized (addtoStaticString_m){
        mstaticstring.add(a)
        //print("${mstaticstring.size()}\n")
    }
}

var METASTRING = "gctest,gctest/gctest-) gctest"

func string_test_alloc_global(){
    for (i in 0..STRING_REFERENCE_MAX){
        var a = METASTRING + i.toString()
        addtoStaticString(a)
    }
}

func string_test_free(){
    mstaticstring.clear()
    thread_test_gc()
}

class Gc_TestCase_3 <: Runnable{
    func run(){
        string_test_alloc_global()
        string_test_free()
    }
}

external func gc_test3(){
    print("[INFO]start ${GC_TEST_NAME}_3!\n")
    reset_mstaticreference()
    var list = ArrayList<Thread>()
    for (i in 0..DEFAULT_THREAD_NUM_GC){
        var tmp : Runnable = CommonRun(Gc_TestCase_3(), THREAD_SLEEP_TIME_DEFAULT, repeatTimes:THREAD_REPEATS_DEFAULT)
        var t = Thread(tmp, GC_TEST_NAME + "_testcase3_${i}")
        list.add(t)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    unsafe{
        MCC_NativeGC()
    }
    trySleep(1000)
    print("[INFO]end ${GC_TEST_NAME}_3!\n")
}

func string_test_alloc_local(){
    var mString = ArrayList<String>()
    for (i in 0..STRING_REFERENCE_MAX) {
        var a = METASTRING + i.toString()
        mString.add(a)
    }
}

class Gc_TestCase_4 <: Runnable{
    func run(){
        string_test_alloc_local()
    }
}

external func gc_test4(){
    print("[INFO]start ${GC_TEST_NAME}_3!\n")
    reset_mstaticreference()
    var list = ArrayList<Thread>()
    for (i in 0..DEFAULT_THREAD_NUM_GC){
        var tmp : Runnable = CommonRun(Gc_TestCase_4(), THREAD_SLEEP_TIME_DEFAULT, repeatTimes:THREAD_REPEATS_DEFAULT)
        var t = Thread(tmp, GC_TEST_NAME + "_testcase4_${i}")
        list.add(t)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    unsafe{
        MCC_NativeGC()
    }
    trySleep(1000)
    print("[INFO]end ${GC_TEST_NAME}_4!\n")
}

// TODO: need random!
func stack_test(){
    var mlocalrefarray = ArrayList<AllocUnit>(STACK_REFERENCE_MAX)
    var allocsize = 0
    for (i in 0..STACK_REFERENCE_MAX){
        for (j in 0..10){
            var randNumber = 128/2 + 8
            mlocalrefarray.set(i,AllocUnitCycleMaster(randNumber))
            allocsize = allocsize + 2 * randNumber // TODO: is this calculate right? using ArrayList not type[]
        }
        if (allocsize > STACK_SIZE_MAX) { return }
        for (j in 0..10){
            var randNumber = 1888/2 + 144
            mlocalrefarray.set(i,AllocUnitCycleMaster(randNumber))
            allocsize = allocsize + 2 * randNumber
        }
        if (allocsize > STACK_SIZE_MAX) { return }
        var randNumber = 12288/2 + 2048
        allocsize = allocsize + 2 * randNumber
        mlocalrefarray.set(i,AllocUnitCycleMaster(randNumber))
    }
    mlocalrefarray.clear()
    for (i in 0..STACK_REFERENCE_MAX){
        for (j in 0..10){
            var randNumber = 128/2 + 8
            mlocalrefarray.set(i,AllocUnitCycleMaster(randNumber))
            allocsize = allocsize + 2 * randNumber // TODO: is this calculate right? using ArrayList not type[]
        }
        if (allocsize > STACK_SIZE_MAX) { return }
        for (j in 0..10){
            var randNumber = 1888/2 + 144
            mlocalrefarray.set(i,AllocUnitCycleMaster(randNumber))
            allocsize = allocsize + 2 * randNumber
        }
        if (allocsize > STACK_SIZE_MAX) { return }
        var randNumber = 12288/2 + 2048
        allocsize = allocsize + 2 * randNumber
        mlocalrefarray.set(i,AllocUnitCycleMaster(randNumber))
    }
    unsafe{
        MCC_NativeGC()
    }
}

class Gc_TestCase_5 <: Runnable{
    func run(){
        stack_test()
    }
}

external func gc_test5(){
    print("[INFO]start ${GC_TEST_NAME}_5!\n")
    reset_mstaticreference()
    var list = ArrayList<Thread>()
    for (i in 0..DEFAULT_THREAD_NUM_GC){
        var tmp : Runnable = CommonRun(Gc_TestCase_5(), THREAD_SLEEP_TIME_DEFAULT, repeatTimes:THREAD_REPEATS_DEFAULT)
        var t = Thread(tmp, GC_TEST_NAME + "_testcase5_${i}")
        list.add(t)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    unsafe{
        MCC_NativeGC()
    }
    trySleep(1000)
    print("[INFO]end ${GC_TEST_NAME}_5!\n")
}



class AllocUnitCycleMasterF <: AllocUnit{
    var slave : ?AllocUnitCycleSlaveF = None // TODO: not equal to java.
    init(arrayLength:Int64){
        super(arrayLength)
        slave = AllocUnitCycleSlaveF(arrayLength, this)
    }
}

class AllocUnitCycleSlaveF <: AllocUnit{
    var master : AllocUnitCycleMasterF
    init(arrayLength:Int64, master:AllocUnitCycleMasterF){
        super(arrayLength)
        this.master = master
    }
    ~init(){
        //alloc_array.clear()
        //master.alloc_array.clear()
    }
}


// todo: gc_testcase6 need finalizer.
class Gc_TestCase_6 <: Runnable{
    func run(){
        finalize_test(ENUM_RANGE.ENUM_RANGE_ALL);
        trySleep(2000);
        thread_test_gc();
    }
}

func finalize_test(r:ENUM_RANGE){
    var allocsize = 0
    // todo: need random
    var randNumber = 128/2 + 8
    match (r){
        case $ENUM_RANGE_ALL =>
            for ( i in 0..STATIC_REFERENCE_MAX) {
                for (j in 0..10) {
                    randNumber =128/2 + 8;
                    var one = AllocUnitCycleMasterF(randNumber);
                    settomstaticreference(i, one);
                    allocsize = allocsize + 2 * randNumber;
                }
                if (allocsize > FINALIZE_SIZE_MAX) {
                    return;
                }
                for (j in 0..10) {
                    randNumber = 1888/2 + 144;
                    var one = AllocUnitCycleMasterF(randNumber);
                    settomstaticreference(i, one);
                    allocsize = allocsize + 2 * randNumber;
                }
                if (allocsize > FINALIZE_SIZE_MAX) {
                    return;
                }
                randNumber = 12288/2 + 2048;
                allocsize = allocsize + 2 * randNumber;
                while (allocsize > FINALIZE_SIZE_MAX) {
                    return;
                }
                var one = AllocUnitCycleMasterF(randNumber);
                settomstaticreference(i, one);
            }
        case _ => return

    }
}



external func gc_test6(){
    print("[INFO]start ${GC_TEST_NAME}_6!\n")
    reset_mstaticreference()
    var list = ArrayList<Thread>()
    for (i in 0..DEFAULT_THREAD_NUM_GC){
        var tmp : Runnable = CommonRun(Gc_TestCase_6(), THREAD_SLEEP_TIME_DEFAULT, repeatTimes:THREAD_REPEATS_DEFAULT)
        var t = Thread(tmp, GC_TEST_NAME + "_testcase5_${i}")
        list.add(t)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    mstaticreference.clear()
    unsafe{
        MCC_NativeGC()
    }
    NativeGC()
    trySleep(1000)
    print("[INFO]end ${GC_TEST_NAME}_6!\n")
}

external func gc_test7(){
    print("[INFO]start ${GC_TEST_NAME}_7!\n")
    trySleep(5000)
    unsafe{
        MCC_NativeGC()
    }
    trySleep(1000)
    print("[INFO]start ${GC_TEST_NAME}_7!\n")
}

// test native func.
external func gc_test8(){

}
