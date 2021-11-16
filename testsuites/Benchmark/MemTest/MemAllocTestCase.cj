package test.memory
//import sync.*

from std import collection.*

var STRESS_INDEX : Int64 = 100
let INIT_DEFAULT_THREAD_NUM : Int64 = 10
let INIT_DEFAULT_STRESS_THREAD_NUM : Int64 = 32
var DEFAULT_THREAD_NUM : Int64 = INIT_DEFAULT_THREAD_NUM
var DEFAULT_THREAD_NUM_HALF : Int64 = INIT_DEFAULT_THREAD_NUM / 2
var DEFAULT_STRESS_THREAD_NUM : Int64 = INIT_DEFAULT_STRESS_THREAD_NUM
var DEFAULT_STRESS_THREAD_NUM_HALF : Int64 = INIT_DEFAULT_STRESS_THREAD_NUM / 2
var mAllThreadReference = ArrayList<ArrayList<AllocUnit>>()
var mAllStressThreadReference = ArrayList<ArrayList<AllocUnit>>()
let MAX_SLOT_NUM = GLOBAL_MAX_IDX
let MIN_SLOT_NUM = LOCAL_MIN_IDX

let K : Int64 = 1024
let ALLOC_16K : Int64 = 16 * K
let ALLOC_12K : Int64 = 12 * K
let ALLOC_8K : Int64 = 8 * K
let ALLOC_4K : Int64 = 4 * K
let ALLOC_2K : Int64 = 2 * K
var mRunning : Bool = true // TODO: control by app UI.
var mRest : Bool = false
var mRestTime : Int64 = 5000
var mThreadList : ArrayList<Thread> = ArrayList<Thread>()
let DEFAULT_REPEAT_TIMES = 1


external func tryRest(){
    if (mRest) {
        trySleep(mRestTime)
        return true
    }
    return false
}


enum ENUM_RANGE{
    ENUM_RANGE_NONE|ENUM_RANGE_LOCAL|ENUM_RANGE_GLOBAL|ENUM_RANGE_BOTH|ENUM_RANGE_LARGEOBJ|ENUM_RANGE_ALL
}


abstract class MemAllocMethod {
    protected var mAllocSize : Int64 = 0
    protected var mRange : ENUM_RANGE = ENUM_RANGE_NONE
    protected var mChosen = 0
    protected var mProp = 0
    protected var mRandom : Bool = false
    func alloc(isStress:Bool):ArrayList<AllocUnit>
}

class RandomAllocMethod <: MemAllocMethod{
    init(size:Int64, range:ENUM_RANGE, chosen:Int64, prop_:Int64, random:Bool){
        mAllocSize = size
        mRange = range
        mChosen = chosen
        mProp = prop_
        mRandom = random
    }
    func alloc(isStress:Bool){
        var ret = alloc_choose_idx(mAllocSize, mRange, mChosen, mProp, mRandom, isStress)
        return ret
    }
}


// implements Runnable in java design.
class MemAlloc <: Runnable{
    var mAllocSize : Int64 = 4 * K
    var mSaveNum : Int64 = -1
    var mFreeImmediately : Bool = false
    var mSlot : Int64 = 0
    var mSleepTime : Int64 = 5
    var mSaveTo : ArrayList<ArrayList<AllocUnit>> = ArrayList<ArrayList<AllocUnit>>()
    var mSaveIndex : Int64 = 0
    static let SAVE_ALL : Int64 = -1
    static let SAVE_HALF : Int64 = -2
    static let SAVE_HALF_RANDOM : Int64 = -3
    static let SAVE_HALF_MINUS : Int64 = -4
    private var mRepeatTimes = 1
    private var mAllocMethod : ?MemAllocMethod
    private var mCallBackAfterFree : ?Runnable
    private var mIsStress : Bool = false
    init(
        allocSize:Int64,
        slot:Int64,
        saveTo:ArrayList<ArrayList<AllocUnit>>,
        saveIndex:Int64,
        saveNum:Int64,
        freeImmediately:Bool,
        sleepTime:Int64,
        allocMethod!:?MemAllocMethod = None,
        repeatTimes!:Int64=1,
        callBackAfterFree!:?Runnable = None,
        isStress!:Bool=false
    ){
        mAllocSize = allocSize;
        mFreeImmediately = freeImmediately;
        mSaveNum = saveNum;
        mSlot = slot;
        mSleepTime = sleepTime;
        mSaveTo = saveTo;
        mSaveIndex = saveIndex;
        mRepeatTimes = repeatTimes;
        mCallBackAfterFree = callBackAfterFree;
        mAllocMethod = allocMethod;
        mIsStress = isStress;
    }
    // in java implement, call MemAlloc here.
    func run(){
        var j = 0
        while(j < mRepeatTimes || mRepeatTimes < 0){
            if (!mRunning) {
                break
            }
            j++
            tryRest()
            var ret : Option<ArrayList<AllocUnit>> = None
            match (mAllocMethod) {
                case Some(v) => ret = v.alloc(mIsStress);
                case $None => ret = alloc_byte_idx(mAllocSize, mSlot, 0, mIsStress);
            }
            match (ret) {
                case Some(v) => () // do nothing
                case $None => continue
            }
            trySleep(mSleepTime)
            if (mFreeImmediately) {
                ret?.clear()
                mCallBackAfterFree?.run() // default None.
                continue
            }
            //  TODO: default mSave size is 0.
            var x = ret?.size()??0
            match (ret){
                case Some(v) =>if (mSaveTo.size() > 0 && mSaveNum != 0){
                                    if (mSaveNum == SAVE_ALL && mSaveIndex < mSaveTo.size()) {
                                    // do nothing here.
                                    } else if (mSaveNum == SAVE_HALF && mSaveIndex < mSaveTo.size()) {
                                        var half : Int64 = v.size() / 2;
                                        for (i in v.size()-1..=half:-1){
                                            v.removeAt(i)
                                        }
                                    } else if (mSaveNum == SAVE_HALF_MINUS && mSaveIndex < mSaveTo.size()) {
                                        var half : Int64 = v.size() / 2 - 1;
                                        if (half < 0) { half = 0 }
                                        for (i in v.size()-1..=half:-1){
                                            v.removeAt(i)
                                        }
                                    } else if (mSaveNum == SAVE_HALF_RANDOM && mSaveIndex < mSaveTo.size()) {
                                        print("need random pkg!\n")
                                        // TODO: need Random
                                        //Set<Integer> free = getRandomIndex(v, v.size() / 2 + 1);
                                        //for (Integer index : free) {
                                        //    v.set(index, null);
                                        //}
                                    } else {
                                        for (i in v.size()-1..=0:-1){
                                            v.removeAt(i)
                                        }
                                    }
                                    mCallBackAfterFree?.run()
                                    var m = Mutex()
                                    synchronized (m) {
                                        mSaveTo.set(mSaveIndex, v);
                                    }
                                }
                case None => () // do nothing.
            }
            trySleep(mSleepTime);
        }
    }
}

func getRandomIndex(arrayToFree: ArrayList<AllocUnit>, freeNum:Int64){
        var result : HashSet<Int64> = HashSet<Int64>()

}

func randomSet(min_:Int64, max_:Int64, n:Int64, set:HashSet<Int64>){
    if (n > (max_ - min_ +1) || max_ < min_) {
        return
    }
    for (i in 0..n) {
        // TODO: need set, random here!
        //var num: Int64 = Int64(math.random() * (max_ - min_)) + min_;
        var num: Int64 = min_ + (max_ - min_) /2
        //set.add(num)
    }
    var s = set.size()
    if (s < n) {
        randomSet(min_,max_, n - s, set)
    }
}


class FreeReference <: Runnable{
    private var mAllReference : ArrayList<ArrayList<AllocUnit>>
    private var mThreadIdx : Int64 = 0
    private var mLoop : Bool = false
    private var mSync : Bool = false
    private var mMutex : Mutex = Mutex()
    init(
        reference : ArrayList<ArrayList<AllocUnit>>,
        threadIdx : Int64,
        loop : Bool,
        sync !: Bool = false
    )
    {
        mAllReference = reference
        mThreadIdx = threadIdx
        mLoop = loop
        mSync = sync
    }
    private func release(){
        if (mSync){
            synchronized (mMutex) {
                releaseOperate()
            }
        } else {
            releaseOperate()
        }
    }
    private func releaseOperate(){
        if (mThreadIdx >= mAllReference.size()) {
            return
        }
        var cur : ArrayList<AllocUnit> = mAllReference.removeAt(mThreadIdx)
        cur.clear()
        return
    }
    func run(){
        if (!mLoop) {
            release()
            return
        }
        while (mLoop) {
            // mRunning is False in java, when user press stop bottom.
            if (!mRunning){
                break
            }
            release()
            trySleep(1)
        }
    }
}

func GetCurrentNanoTime() : Int64 {0}

class ContinueRandomAllocMethod <: MemAllocMethod{
    private var mSleep : Int64
    private var mTotalTimes : Int64
    private var mTimes : Int64 = 0
    private var mFreeImmediately : Bool
    init(
        size: Int64,
        range: ENUM_RANGE,
        chosen: Int64,
        prop_: Int64,
        random: Bool,
        sleep: Int64,
        totalTimes: Int64,
        times: Int64,
        freeImmediately: Bool
    ){
        mAllocSize = size;
        mRange = range;
        mChosen = chosen;
        mProp = prop_;
        mRandom = random;
        mSleep = sleep;
        mTotalTimes = totalTimes;
        mTimes = times;
        mFreeImmediately = freeImmediately;
    }
    func alloc(isStress:Bool) {
        var ret : ArrayList<AllocUnit> = ArrayList<AllocUnit>()
        var tmp : ArrayList<AllocUnit>
        if (mTotalTimes == 0 && mTimes == 0) {
            ret = alloc_choose_idx(mAllocSize, mRange, mChosen, mProp, mRandom, isStress)
            return ret
        }
        var ellipseTime : Int64 = 0
        var find = false
        // TODO: need package time. Temporarily use GetCurrentNanoTime.
        while (ellipseTime < mTotalTimes) {
            var now = GetCurrentNanoTime()
            tmp = alloc_choose_idx(mAllocSize, mRange, mChosen, mProp, mRandom, isStress)
            if (!mFreeImmediately){
                ret.addAll(tmp)
            } else {
                // tmp = null
                tmp.clear()
            }
            find = true
            trySleep(mSleep)
            ellipseTime += GetCurrentNanoTime() - now
        }
        if (!find) {
            var t = 0
            while (t < mTotalTimes){
                tmp = alloc_choose_idx(mAllocSize, mRange, mChosen, mProp, mRandom, isStress)
                if (!mFreeImmediately){
                    ret.addAll(tmp)
                } else {
                    // tmp = null
                    tmp.clear()
                }
                t++
                trySleep(mSleep)
            }
        }
        return ret
    }

}

// differ with java design, start an app should stop and reset. We can just start another case.
/*
func resetTestEnv(refList:ArrayList<ArrayList<AllocUnit>>) {
    var mx = Mutex()
    var size : Int64 = 0
    synchronized(mx) {
        size = refList.size()
    }
    while (size < 2 * INIT_DEFAULT_THREAD_NUM) {
        size++
        synchronized(mx) {
            refList.add(ArrayList<AllocUnit>())
        }
    }
    var i : Int64 = 0
    synchronized(mx) {
        for (j in 0..refList.size()){
            refList[j].clear()
        }
        refList.clear()
    }
}
*/
func resetTestEnv(){
    mThreadList.clear()
}

external func testcase_1(){
    resetTestEnv()
    print("[INFO]start testcase_1!\n")
    var list = ArrayList<Thread>()
    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
    //for (i in 0..1) {
        slot = i % MAX_SLOT_NUM
        var m = MemAlloc(ALLOC_4K, slot, mAllThreadReference, i, MemAlloc.SAVE_ALL, false, 1)
        var x = StopAbleThread(m, "testcase1_${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    resetTestEnv()
    print("[INFO]end testcase_1!\n")
}

external func testcase_2(){
    resetTestEnv()
    print("[INFO]start testcase_2!\n")
    var list = ArrayList<Thread>()
    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        var remain = MemAlloc(ALLOC_4K, slot, mAllThreadReference, i, MemAlloc.SAVE_HALF_RANDOM, true, 1)
        var m = MemAlloc(ALLOC_4K, slot, mAllThreadReference, i, MemAlloc.SAVE_ALL, true, 1,  callBackAfterFree:remain, repeatTimes:DEFAULT_REPEAT_TIMES)
        var x = StopAbleThread(m, "testcase2_${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    resetTestEnv()
    print("[INFO]end testcase_2!\n")
}

external func testcase_3(){
    resetTestEnv()
    print("[INFO]start testcase_3!\n")
    var list = ArrayList<Thread>()
    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        var remain = MemAlloc(ALLOC_2K, slot, mAllThreadReference, i, MemAlloc.SAVE_HALF_RANDOM, true, 1)
        var m = MemAlloc(ALLOC_4K, slot, mAllThreadReference, i, MemAlloc.SAVE_HALF, false, 1,  callBackAfterFree:remain, repeatTimes:DEFAULT_REPEAT_TIMES)
        var x = StopAbleThread(m, "testcase3_${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    resetTestEnv()
    print("[INFO]end testcase_3!\n")
}

/* TODO: need random in java.
external func testcase_4(){
    resetTestEnv()
    print("[INFO]start testcase_4!\n")
    var list = ArrayList<Thread>()
    var slot = 0
    // ArrayList<Integer> slots = new ArrayList<>();
    // Random r = new Random(System.currentTimeMillis());
    for (int i = 0; i < (MAX_SLOT_NUM * STRESS_INDEX / 100); i++) {
        slots.add(r.nextInt(MAX_SLOT_NUM));
    }
    for (i in 0..DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        var remain = MemAlloc(ALLOC_2K, slot, mAllThreadReference, i, MemAlloc.SAVE_HALF_RANDOM, true, 1)
        var m = MemAlloc(ALLOC_4K, slot, mAllThreadReference, i, MemAlloc.SAVE_HALF_RANDOM, false, 1,  callBackAfterFree:remain, repeatTimes:DEFAULT_REPEAT_TIMES)
        var x = StopAbleThread(m, "testcase4_${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    resetTestEnv()
    print("[INFO]end testcase_4!\n")
}
*/

external func testcase_5(){
    resetTestEnv()
    print("[INFO]start testcase_5!\n")
    var list = ArrayList<Thread>()
    var slot = 0
    var average = ALLOC_4K / DEFAULT_THREAD_NUM;
    for (i in 0..DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        var m = MemAlloc(ALLOC_4K + max(idx_to_size(slot), average), slot, mAllThreadReference, i, MemAlloc.SAVE_ALL, false, 1, repeatTimes:DEFAULT_REPEAT_TIMES)
        var x = StopAbleThread(m, "testcase5_${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    resetTestEnv()
    print("[INFO]end testcase_5!\n")
}


external func testcase_6(){
    resetTestEnv()
    print("[INFO]start testcase_6!\n")
    var list = ArrayList<Thread>()

    // TODO: need random in java.
    // var m_ = MemAlloc(ALLOC_4K, math.random()*MAX_SLOT_NUM , mAllThreadReference, 0, 1 /* save number */, false, 1, repeatTimes:DEFAULT_REPEAT_TIMES)
    var m_ = MemAlloc(ALLOC_4K, MAX_SLOT_NUM/2 , mAllThreadReference, 0, 1, false, 1, repeatTimes:DEFAULT_REPEAT_TIMES)
    var x_ = StopAbleThread(m_, "testcase6_0")
    list.add(x_)
    var futures_ = startAllThread(list)
    waitAllThreadFinish(futures_)
    list.clear()
    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        var m = MemAlloc(ALLOC_8K - idx_to_size(slot), slot, mAllThreadReference, i, MemAlloc.SAVE_ALL, false, 1)
        var x = StopAbleThread(m, "testcase6_${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    resetTestEnv()
    print("[INFO]end testcase_6!\n")
}


external func testcase_6_1(){
    resetTestEnv()
    print("[INFO]start testcase_6_1!\n")
    var list = ArrayList<Thread>()

    // TODO: need random in java.
    // var m_ = MemAlloc(ALLOC_4K, math.random()*MAX_SLOT_NUM , mAllThreadReference, 0, 1 /* save number */, false, 1, repeatTimes:DEFAULT_REPEAT_TIMES)
    var m_ = MemAlloc(ALLOC_4K, MAX_SLOT_NUM/2 , mAllThreadReference, 0, 1, false, 1, repeatTimes:DEFAULT_REPEAT_TIMES)
    var x_ = StopAbleThread(m_, "testcase6_1_0")
    list.add(x_)
    var futures_ = startAllThread(list)
    waitAllThreadFinish(futures_)
    list.clear()
    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        var m = MemAlloc(ALLOC_8K, slot, mAllThreadReference, i, MemAlloc.SAVE_ALL, false, 1)
        var x = StopAbleThread(m, "testcase6_1_${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    resetTestEnv()
    print("[INFO]end testcase_6_1!\n")
}


external func testcase_7(){
    resetTestEnv()
    print("[INFO]start testcase_7!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        var m = MemAlloc(ALLOC_8K + idx_to_size(slot), slot, mAllThreadReference, i, MemAlloc.SAVE_ALL, false, 1)
        var x = StopAbleThread(m, "testcase7_${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    resetTestEnv()
    print("[INFO]end testcase_7!\n")
}

external func testcase_8(){
    resetTestEnv()
    print("[INFO]start testcase_8!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        var m = MemAlloc(ALLOC_8K + ALLOC_4K, slot, mAllThreadReference, i, MemAlloc.SAVE_ALL, false, 1)
        var x = StopAbleThread(m, "testcase8_${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    resetTestEnv()
    print("[INFO]end testcase_8!\n")
}

// TODO: nothing different with testcase 8?
external func testcase_9(){
    resetTestEnv()
    print("[INFO]start testcase_9!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        var m = MemAlloc(ALLOC_12K, slot, mAllThreadReference, i, MemAlloc.SAVE_ALL, false, 1)
        var x = StopAbleThread(m, "testcase9_${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    resetTestEnv()
    print("[INFO]end testcase_9!\n")
}

external func testcase_10(){
    resetTestEnv()
    print("[INFO]start testcase_10!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        var m = MemAlloc(ALLOC_16K, slot, mAllThreadReference, i, MemAlloc.SAVE_ALL, false, 1)
        var x = StopAbleThread(m, "testcase_10_${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    resetTestEnv()
    print("[INFO]end testcase_10!\n")
}


external func testcase_11(){
    resetTestEnv()
    print("[INFO]start testcase_11!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        var m = MemAlloc(ALLOC_4K, slot, mAllThreadReference, i, MemAlloc.SAVE_ALL, false, 1)
        var x = StopAbleThread(m, "testcase_11_${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    list.clear()
    for (i in 0..DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        var m = FreeReference(mAllThreadReference, i, false)
        var x = StopAbleThread(m, "testcase_11_free_${i+1}")
        list.add(x)
    }
    var futures_ = startAllThread(list)
    waitAllThreadFinish(futures_)
    resetTestEnv()
    print("[INFO]end testcase_11!\n")
}


external func testcase_12(){
    print("[INFO]start testcase_12!\n")
    for (i in 0..3){
        testcase_11()
    }
    print("[INFO]end testcase_12!\n")
}

external func testcase_13(){
    resetTestEnv()
    print("[INFO]start testcase_13!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        // TODO: need random here.
        // var allocMethod = RandomAllocMethod(ALLOC_4K * 3, ENUM_RANGE_LOCAL, 3, 0, Math.random() > 0.5)
        var allocMethod = RandomAllocMethod(ALLOC_4K * 3, ENUM_RANGE_LOCAL, 3, 0, true)

        var m = MemAlloc(ALLOC_4K, slot, mAllThreadReference, i, MemAlloc.SAVE_ALL, false, 1, allocMethod: allocMethod, repeatTimes:DEFAULT_REPEAT_TIMES)
        var x = StopAbleThread(m, "testcase_13_${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    list.clear()
    for (i in 0..DEFAULT_THREAD_NUM) {
        var m = FreeReference(mAllThreadReference, i, false)
        var x = StopAbleThread(m, "testcase_13_free_${i+1}")
        list.add(x)
    }
    var futures_ = startAllThread(list)
    waitAllThreadFinish(futures_)
    resetTestEnv()
    print("[INFO]end testcase_13!\n")
}

external func testcase_14(){
    resetTestEnv()
    print("[INFO]start testcase_14!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        // TODO: need random here.
        // var allocMethod = RandomAllocMethod(ALLOC_8K * 11, ENUM_RANGE_BOTH, 11, 0, Math.random() > 0.5)
        var allocMethod = RandomAllocMethod(ALLOC_8K * 11, ENUM_RANGE_BOTH, 11, 0, true)
        var remain = MemAlloc(ALLOC_4K, slot, mAllThreadReference, i, MemAlloc.SAVE_HALF_RANDOM, false, 1, allocMethod: allocMethod, repeatTimes:DEFAULT_REPEAT_TIMES)
        var m = MemAlloc(ALLOC_8K * 11, slot, mAllThreadReference, i, MemAlloc.SAVE_HALF, false, 1, allocMethod: allocMethod, repeatTimes:DEFAULT_REPEAT_TIMES, callBackAfterFree:remain)
        var x = StopAbleThread(m, "testcase_14_${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    resetTestEnv()
    print("[INFO]end testcase_14!\n")
}

external func testcase_15(){
    resetTestEnv()
    print("[INFO]start testcase_15!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        // TODO: need random here.
        // var allocMethod = RandomAllocMethod(ALLOC_4K * 3, ENUM_RANGE_LOCAL, 3, 0, Math.random() > 0.5)
        var allocMethod = RandomAllocMethod(ALLOC_8K * 11, ENUM_RANGE_BOTH, 11, 0, true)

        var m = MemAlloc(ALLOC_8K * 11, slot, mAllThreadReference, i, MemAlloc.SAVE_ALL, false, 1, allocMethod: allocMethod, repeatTimes:DEFAULT_REPEAT_TIMES)
        var x = StopAbleThread(m, "testcase_15_alloc_${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    list.clear()
    for (i in 0..DEFAULT_THREAD_NUM) {
        var m = FreeReference(mAllThreadReference, i, false)
        var x = StopAbleThread(m, "testcase_15_free_${i+1}")
        list.add(x)
    }
    var futures_ = startAllThread(list)
    waitAllThreadFinish(futures_)
    resetTestEnv()
    print("[INFO]end testcase_15!\n")
}

external func testcase_16(){
    resetTestEnv()
    print("[INFO]start testcase_16!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        // TODO: need random here.
        // var allocMethod = RandomAllocMethod(ALLOC_4K * 3, ENUM_RANGE_LOCAL, 3, 0, Math.random() > 0.5)
        var allocMethod = RandomAllocMethod(ALLOC_8K * 11, ENUM_RANGE_BOTH, 11, 80, true)

        var m = MemAlloc(ALLOC_8K * 11, slot, mAllThreadReference, i, MemAlloc.SAVE_ALL, false, 1, allocMethod: allocMethod, repeatTimes:DEFAULT_REPEAT_TIMES)
        var x = StopAbleThread(m, "testcase_16_alloc_${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    list.clear()
    for (i in 0..DEFAULT_THREAD_NUM) {
        var m = FreeReference(mAllThreadReference, i, false)
        var x = StopAbleThread(m, "testcase_16_free_${i+1}")
        list.add(x)
    }
    var futures_ = startAllThread(list)
    waitAllThreadFinish(futures_)
    resetTestEnv()
    print("[INFO]end testcase_16!\n")
}

external func testcase_17(){
    resetTestEnv()
    print("[INFO]start testcase_17!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..2 * DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        // TODO: need random here.
        // var allocMethod = RandomAllocMethod(ALLOC_4K * 3, ENUM_RANGE_LOCAL, 3, 0, Math.random() > 0.5)
        var allocMethod = RandomAllocMethod(ALLOC_4K * 6, ENUM_RANGE_ALL, 6, 0, false)

        var m = MemAlloc(ALLOC_4K * 6, slot, mAllThreadReference, i, MemAlloc.SAVE_ALL, false, 1, allocMethod: allocMethod, repeatTimes:DEFAULT_REPEAT_TIMES)
        var x = StopAbleThread(m, "testcase_17${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    resetTestEnv()
    print("[INFO]end testcase_17!\n")
}

external func testcase_18(){
    resetTestEnv()
    print("[INFO]start testcase_18!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..2*DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        // TODO: need random here.
        // var allocMethod = RandomAllocMethod(ALLOC_4K * 3, ENUM_RANGE_LOCAL, 3, 0, Math.random() > 0.5)
        var allocMethod = RandomAllocMethod(ALLOC_4K * 6, ENUM_RANGE_ALL, 6, 0, true)
        var m = MemAlloc(ALLOC_4K * 6, slot, mAllThreadReference, i, MemAlloc.SAVE_ALL, false, 1, allocMethod: allocMethod, repeatTimes:DEFAULT_REPEAT_TIMES)
        var x = StopAbleThread(m, "testcase_18${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    resetTestEnv()
    print("[INFO]end testcase_18!\n")
}

external func testcase_19(){
    resetTestEnv()
    print("[INFO]start testcase_19!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..2*DEFAULT_THREAD_NUM) {
        slot = i % MAX_SLOT_NUM
        // TODO: need random here.
        // var allocMethod = RandomAllocMethod(ALLOC_4K * 3, ENUM_RANGE_LOCAL, 3, 0, Math.random() > 0.5)
        var allocMethod = RandomAllocMethod(ALLOC_8K * 6, ENUM_RANGE_ALL, 6, 80, true)
        var m = MemAlloc(ALLOC_8K * 6, slot, mAllThreadReference, i, MemAlloc.SAVE_ALL, false, 1, allocMethod: allocMethod, repeatTimes:DEFAULT_REPEAT_TIMES)
        var x = StopAbleThread(m, "testcase_19${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    resetTestEnv()
    print("[INFO]end testcase_19!\n")
}


external func testcase_20(){
    resetTestEnv()
    print("[INFO]start testcase_20!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
        // TODO: need random here.
        // slot = Random().nextInt(MAX_SLOT_NUM)
        // var size = Random().nextInt(ALLOC_12K) + ALLOC_4K
        // RandomAllocMethod allocMethod = new RandomAllocMethod(size, ENUM_RANGE.ENUM_RANGE_ALL, 6, (int) Math.random() * 100, Math.random() > 0.5d);

        slot = MAX_SLOT_NUM/2
        var size = ALLOC_12K/2 + ALLOC_4K
        var allocMethod = RandomAllocMethod(size, ENUM_RANGE_ALL, 6, 50, true)
        var m = MemAlloc(size, slot, mAllStressThreadReference, i, MemAlloc.SAVE_ALL, false, 1000, allocMethod: allocMethod, repeatTimes:-1, isStress:true)
        var x = StopAbleThread(m, "testcase_20${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    resetTestEnv()
    print("[INFO]end testcase_20!\n")
}

external func testcase_21(){
    resetTestEnv()
    print("[INFO]start testcase_21!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
        // TODO: need random here.
        // slot = Random().nextInt(MAX_SLOT_NUM)
        // var size = Random().nextInt(ALLOC_12K) + ALLOC_4K
        // RandomAllocMethod allocMethod = new RandomAllocMethod(size, ENUM_RANGE.ENUM_RANGE_ALL, 6, (int) Math.random() * 100, Math.random() > 0.5d);

        slot = MAX_SLOT_NUM/2
        var size = ALLOC_12K/2 + ALLOC_4K
        var allocMethod = RandomAllocMethod(size, ENUM_RANGE_ALL, 6, 50, true)
        var m = MemAlloc(size, slot, mAllStressThreadReference, i, MemAlloc.SAVE_ALL, true, 1000, allocMethod: allocMethod, repeatTimes:DEFAULT_REPEAT_TIMES, isStress:true)
        var x = StopAbleThread(m, "testcase_21${i+1}")
        list.add(x)
    }
    mThreadList.addAll(list);
    var futures = startAllThread(list)
    print("[INFO]end testcase_21!\n")
}

external func testcase_22(){
    resetTestEnv()
    print("[INFO]start testcase_22!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
        // TODO: need random here.
        slot = MAX_SLOT_NUM/2
        var size = ALLOC_12K/2 + ALLOC_4K
        var allocMethod = RandomAllocMethod(size, ENUM_RANGE_ALL, 6, 50, true)
        var m = MemAlloc(size, slot, mAllThreadReference, i % DEFAULT_THREAD_NUM_HALF, MemAlloc.SAVE_ALL, true, 1000, allocMethod: allocMethod, repeatTimes:DEFAULT_REPEAT_TIMES, isStress:true)
        var x = StopAbleThread(m, "testcase_22_alloc${i+1}")
        list.add(x)
    }
    for (i in 0..DEFAULT_THREAD_NUM) {
        // TODO: need random here.
        slot = MAX_SLOT_NUM/2
        var size = ALLOC_12K/2 + ALLOC_4K
        var allocMethod = RandomAllocMethod(size, ENUM_RANGE_ALL, 6, 50, true)
        var m = MemAlloc(size, slot, mAllThreadReference, i % DEFAULT_THREAD_NUM_HALF, MemAlloc.SAVE_ALL, true, 1000, allocMethod: allocMethod, repeatTimes:DEFAULT_REPEAT_TIMES, isStress:true)
        var x = StopAbleThread(m, "testcase_22_alloc${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)

    print("[INFO]end testcase_21!\n")
}

external func testcase_23(){
    resetTestEnv()
    print("[INFO]start testcase_23!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..DEFAULT_THREAD_NUM) {
        // TODO: need random here.
        // int slot = new Random().nextInt(MAX_SLOT_NUM);
        // int size = new Random().nextInt(ALLOC_12K) + ALLOC_4K;
        // MemAllocMethod allocMethod = new ContinueRandomAllocMethod(size, ENUM_RANGE.ENUM_RANGE_ALL, 6, (int) Math.random() * 100, Math.random() > 0.5d, 100, 400, 0, false);

        slot = MAX_SLOT_NUM/2
        var size = ALLOC_12K/2 + ALLOC_4K
        var allocMethod = ContinueRandomAllocMethod(size, ENUM_RANGE_ALL, 6, 50, true, 100, 400, 0, false)
        var m = MemAlloc(size, slot, mAllStressThreadReference, i, MemAlloc.SAVE_ALL, true, 1000, allocMethod: allocMethod, repeatTimes:DEFAULT_REPEAT_TIMES)
        var x = StopAbleThread(m, "testcase_23${i+1}")
        list.add(x)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    resetTestEnv()
    print("[INFO]end testcase_23!\n")
}


external func testcase_24(){
    resetTestEnv()
    print("[INFO]start testcase_24!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..DEFAULT_STRESS_THREAD_NUM_HALF) {
        // TODO: need random here.
        //    RandomAllocMethod allocMethod = new RandomAllocMethod(ALLOC_8K * 11, ENUM_RANGE.ENUM_RANGE_ALL, 11, 0, Math.random() > 0.5d);
        slot = i % MAX_SLOT_NUM
        var allocMethod = RandomAllocMethod(ALLOC_8K * 11, ENUM_RANGE_ALL, 11, 0, true)
        var remain = MemAlloc(ALLOC_4K * 11, slot, mAllStressThreadReference, i, MemAlloc.SAVE_HALF, false, 1, isStress:true)
        var m = MemAlloc(ALLOC_8K * 11, slot, mAllStressThreadReference, i, MemAlloc.SAVE_HALF, false, 100, allocMethod: allocMethod, callBackAfterFree:remain, repeatTimes:-1, isStress:true)
        var x = StopAbleThread(m, "testcase_24${i+1}")
        list.add(x)
    }
    mThreadList.addAll(list);
    var futures = startAllThread(list)
    print("[INFO]end testcase_24!\n")
}

external func testcase_25(){
    resetTestEnv()
    print("[INFO]start testcase_25!\n")
    var list = ArrayList<Thread>()

    var slot = 0
    for (i in 0..DEFAULT_STRESS_THREAD_NUM_HALF) {
        // TODO: need random here.
        slot = i % MAX_SLOT_NUM
        var remain = MemAlloc(ALLOC_4K, slot, mAllStressThreadReference, i, MemAlloc.SAVE_HALF, false, 1, isStress:true)
        var m = MemAlloc(ALLOC_8K, slot, mAllStressThreadReference, i, MemAlloc.SAVE_HALF, false, 100, callBackAfterFree:remain, repeatTimes:-1, isStress:true)
        var x = StopAbleThread(m, "testcase_25${i+1}")
        list.add(x)
    }
    mThreadList.addAll(list);
    var futures = startAllThread(list)
    print("[INFO]end testcase_25!\n")
}

// N alloc, N release
external func testcase_26(){
    resetTestEnv()
    print("[INFO]start testcase_26!\n")
    var list = ArrayList<Thread>()
    var slot = 0
    for (i in 0..DEFAULT_STRESS_THREAD_NUM_HALF) {
        // TODO: need random here.
        // int size = ALLOC_4K + new Random().nextInt(ALLOC_12K);
        slot = i % MAX_SLOT_NUM
        var size = ALLOC_4K + ALLOC_12K/2
        var allocMethod = RandomAllocMethod(size, ENUM_RANGE_GLOBAL, 10, 0, true)
        var m = MemAlloc(size, slot, mAllStressThreadReference, i, MemAlloc.SAVE_ALL, false, 100, repeatTimes:-1, isStress:true)
        var x = StopAbleThread(m, "testcase_26_alloc${i+1}")
        list.add(x)
        var m_ = FreeReference(mAllStressThreadReference, i, false, sync:true)
        x = StopAbleThread(m_, "testcase_26_free_${i+1}")
        list.add(x)
    }
    mThreadList.addAll(list);
    var futures = startAllThread(list)
    print("[INFO]end testcase_26!\n")
}

external func testcase_27(){
    //RCWeakProxyTest.RCWeakProxyTestEntry(STRESS_INDEX);
}

// TODO: test native func.
external func testcase_28(){}

// AllocUnitwithVerifyCleaner
external func testcase_29(){}


//  mAllStressCase do not need wait. run forever.
/*
    public static TestCaseData[] mAllStressCase = new TestCaseData[] {
            new TestCaseData(R.string.testcase_20, true, "testCase20"),
            new TestCaseData(R.string.testcase_21, true, "testCase21"),
            new TestCaseData(R.string.testcase_24, true, "testCase24"),
            new TestCaseData(R.string.testcase_25, true, "testCase25"),
            new TestCaseData(R.string.testcase_26, true, "testCase26"),

    };
*/

// mAllTestCase will end. So we should wait for result.And not run in while true.
/*
    public static TestCaseData[]mAllTestCase = new TestCaseData[] {
            new TestCaseData(R.string.testcase_1, true, "testCase1"),
            new TestCaseData(R.string.testcase_2, true, "testCase2"),
            new TestCaseData(R.string.testcase_3, true, "testCase3"),
            new TestCaseData(R.string.testcase_4, true, "testCase4"),
            new TestCaseData(R.string.testcase_5, true, "testCase5"),
            new TestCaseData(R.string.testcase_6, true, "testCase6"),
            new TestCaseData(R.string.testcase_6_1, true, "testCase6_1"),
            new TestCaseData(R.string.testcase_7, true, "testCase7"),
            new TestCaseData(R.string.testcase_8, true, "testCase8"),
            new TestCaseData(R.string.testcase_9, true, "testCase9"),
            new TestCaseData(R.string.testcase_10, true, "testCase10"),
            new TestCaseData(R.string.testcase_11, true, "testCase11"),
            new TestCaseData(R.string.testcase_12, true, "testCase12"),
            new TestCaseData(R.string.testcase_13, true, "testCase13"),
            new TestCaseData(R.string.testcase_14, true, "testCase14"),
            new TestCaseData(R.string.testcase_15, true, "testCase15"),
            new TestCaseData(R.string.testcase_16, true, "testCase16"),
            new TestCaseData(R.string.testcase_17, true, "testCase17"),
            new TestCaseData(R.string.testcase_18, true, "testCase18"),
            new TestCaseData(R.string.testcase_19, true, "testCase19"),
            new TestCaseData(R.string.testcase_22, true, "testCase22"),
            new TestCaseData(R.string.testcase_23, true, "testCase23"),
            new TestCaseData(R.string.testcase_27, true, "testCase27"),
            new TestCaseData(R.string.testcase_28, true, "testCase28"),
            new TestCaseData(R.string.testcase_29, true, "testCase29"),
      };
*/

external func oom_testcase_1(){
    print("[INFO]start oom_testcase_1!\n")
    var list = ArrayList<Thread>()
    var index = 0
    var threadReference = ArrayList<ArrayList<AllocUnit>>()
    var slot = 0
    while (true){
        index++
        for (i in 0..2*DEFAULT_THREAD_NUM){
            //threadReference.add(None<ArrayList<AllocUnit>>)
            threadReference.add(ArrayList<AllocUnit>())
            slot = i % MAX_SLOT_NUM
            var size = ALLOC_2K
            var t =  MemAlloc(size, slot, threadReference, index*DEFAULT_THREAD_NUM + i,MemAlloc.SAVE_ALL, false, 0, repeatTimes:1)
            var s = StopAbleThread(t, "oom_testcase_1_${i}")
            list.add(s)
        }
        var futures = startAllThread(list)
        waitAllThreadFinish(futures)
        list.clear()
    }
}

