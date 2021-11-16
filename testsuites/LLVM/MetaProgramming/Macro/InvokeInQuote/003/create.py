import os
from shutil import copyfile

CUR_DIR = os.getcwd()
CUR_DIR_FILE = os.listdir(CUR_DIR)

suffix = '.cj'


def create_new_file(old, new, id):
    if os.path.exists(old):
        temp_data = ''
        with open(old, 'r') as f:
            for line in f:
                if str("%05d" % id) in line:
                    line = line.replace(str("%05d" % id), str("%05d" % (id + 1)))
                temp_data += line
        with open(new, 'w') as f:
            f.write(temp_data)
        print(new + ' created!')


def main():
    cases = [case.split('.')[0] for case in CUR_DIR_FILE if case.endswith(suffix)]
    ids = []
    for case in cases:
        temp = ''
        for i in case:
            if i.isnumeric():
                temp += i
        if len(temp) != 0:
            ids.append(int(temp))
    id = max(ids)
    cases = set([i[:-5] for i in cases])
    for case in cases:
        old = CUR_DIR + '/' + case + str("%05d" % id)
        new = CUR_DIR + '/' + case + str("%05d" % (id + 1))

        create_new_file(old + suffix, new + suffix, id)
        create_new_file(old + '.txt', new + '.txt', id)


if __name__ == "__main__":
    main()
