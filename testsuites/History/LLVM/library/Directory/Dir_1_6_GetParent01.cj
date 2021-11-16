// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args
from os import os.*
from io import io.*


// CREATE A TEST DIR TO TEST FOR PLATFORM ADAPTION
var pwd_path: String = Directory.GetWorkingDirectory().GetCanonicalPath()
var test_path0 = pwd_path + "/test0"
var nameCnt: Int64 = 0;
var testPathBaseLength = pwd_path.size() + 5
let nameCntLimit = 15;
let maxPathLength = 512

func tryNewName() {
    if ("${nameCnt}".size() < nameCntLimit) {
        test_path0 = test_path0.substring(0, testPathBaseLength) + "_${nameCnt}"
        nameCnt = nameCnt + 1
        return
    }
    nameCnt = 0
    testPathBaseLength = testPathBaseLength + nameCntLimit
    return
}

func createAndGetTestDirInPwd(): String {
    // TO AVOID THERE EXISTS SAME-NAME FILE IN THE CURRENT WORKING DIRECTORY
    while (Directory.Exist(test_path0) && test_path0.size() < maxPathLength) {
        tryNewName()
    }
    if (test_path0.size() >= maxPathLength) {
        return ""
    }
    var test_path1 = test_path0 + "/test1"
    var test_path2 = test_path1 + "/test2"
    var test_path3 = test_path2 + "/test3"
    var test_path_tmp = test_path3 + "/tmp"

    if (!Directory.Create(test_path0)) { return "" }
    if (!Directory.Create(test_path1)) { return "" }
    if (!Directory.Create(test_path2)) { return "" }
    if (!Directory.Create(test_path3)) { return "" }
    if (!Directory.Create(test_path_tmp)) { return "" }
    return test_path3
}

func deleteTestDirInPwd(): Bool {
    if (!Directory.Delete(test_path0, true)) { return false }
    if (Directory.Exist(test_path0)) { return false }
    return true
}


func main(): Int64{

    var test_dir: String = createAndGetTestDirInPwd()
    if (test_dir.size() <= 0) {
        if (test_path0.size() >= maxPathLength) {
            return 1
        }
        if (Directory.Exist(test_path0)) {
            deleteTestDirInPwd()
        }
        return 1
    }
	
    // restore Environment
    if (Directory.Exist(test_dir + "/" + "./Dir1")) {
        Directory.Delete(test_dir + "/" + "./Dir1", true)
    }

    // Round 1: Create Dir1, Dir1/Dir2 with current path
    if (!Directory.Create(test_dir + "/" + "./Dir1")) {
        return 1
    }

    if (!Directory.Create(test_dir + "/" + "./Dir1/Dir2")) {
        return 1
    }


    if (Directory.GetParentDirectory(test_dir + "/" + "./Dir1/Dir2") != test_dir + "/" + "./Dir1") {
        return 1
    }

    if (!Directory.Delete(test_dir + "/" + "./Dir1" ,true)) {
        return 1
    }



    // restore Environment
    if (Directory.Exist(test_dir + "/" + "../Dir1")) {
        Directory.Delete(test_dir + "/" + "../Dir1", true)
    }

    // Round 2: Create Dir1, Dir1/Dir2 with  relative path
    if (!Directory.Create(test_dir + "/" + "../Dir1")) {
        return 1
    }

    if (!Directory.Create(test_dir + "/" + "../Dir1/Dir2")) {
        return 1
    }

    if (Directory.GetParentDirectory(test_dir + "/" + "../Dir1/Dir2") != test_dir + "/" + "../Dir1") {
        return 1
    }

    if (!Directory.Delete(test_dir + "/" + "../Dir1", true)) {
        return 1
    }


    // restore Environment
    if (Directory.Exist(test_dir + "/" + "/tmp/Dir1")) {
        Directory.Delete(test_dir + "/" + "/tmp/Dir1", true)
    }

    // Round 3: Create Dir1, Dir1/Dir2 absolute path
    if (!Directory.Create(test_dir + "/" + "/tmp/Dir1")) {
        return 1
    }

    if (Directory.GetParentDirectory(test_dir + "/" + "/tmp/Dir1") != test_dir + "/" + "/tmp") {
        return 1
    }

    if (!Directory.Delete(test_dir + "/" + "/tmp/Dir1", false)) {
        return 1
    }
	if (!deleteTestDirInPwd()) {
		return 1 
	}
    return 0
}