# USAGE
This file has instructions on how to run/test the different types of files. Any text within "{{" and "}}" should be replaced with the appropriate directory/file name (eg. {{algorithm_directory}} => quick_sort).

## C++
Compiling: g++ -o {{algorithm_directory}}/exec_{{c++\_filename}} {{algorithm_directory}}/{{c++\_filename}}
Executing: ./exec_{{c++\_filename}} < {{algorithm_test_cases}}

## Ruby
ruby {{algorithm_directory}}/{{rb_filename}} {{algorithm_test_cases}}

## PHP
php -f {{algorithm_directory}}/{{php_filename}} {{algorithm_test_case}

