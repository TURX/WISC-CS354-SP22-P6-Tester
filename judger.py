# CS354 SP22 Project 6 Sample Tester
# Authored by Ruixuan Tu

import sys

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("Usage: python3 " + sys.argv[0] + " <expected_output> <actual_output>")
        exit(1)
    expected_output_src = sys.argv[1]
    actual_output_src = sys.argv[2]
    expected_output = open(expected_output_src, 'r').read().split('\n')
    actual_output = open(actual_output_src, 'r').read().split('\n')
    for line_num in range(len(expected_output)):
        expected_output_line = expected_output[line_num].strip()
        actual_output_line = actual_output[line_num].strip()
        if len(expected_output_line) != len(actual_output_line):
            print("Output length mismatch at line " + str(line_num + 1))
            exit(1)
        else:
            if expected_output_line != actual_output_line:
                print("Output mismatch at line " + str(line_num + 1))
                exit(1)
    print("Output correct")
