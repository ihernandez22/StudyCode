/*
 * File: c++_insertion_sort.cpp
 * Author: Isaac Hernandez
 * Date: October 16, 2017
 * Summary: Insertion Sort for C++ (using vectors since C++ does not have variable length arrays)
 */

#include <iostream>
#include <vector>
#include <string>
#include <ctime>
#include <sstream>
using namespace std;

template <typename vctr_type>
void insertion_sort(vector<vctr_type>& v) {
  vctr_type x;
  int j;
  for(int i=0; i<v.size(); i++) {
    x = v[i];
    j = i-1;
    while((j>=0) && (v[j]>x)) {
      v[j+1] = v[j];
      j--;
    }
    v[j+1] = x;
  }
}

template <typename vctr_type>
void print_array(vector<vctr_type> v) {
  cout << "[";
  for (int i=0; i<v.size(); i++) {
    cout << v[i];
    if (i < v.size() - 1) {
      cout << ", ";
    }
  }
  cout << "]" << endl;
}

template <typename vctr_type>
void measure_algo_time(vector<vctr_type> v) {
  cout << "================" << endl;
  cout << "UNSORTED: ";
  print_array(v);
  clock_t start_time = clock();
  insertion_sort(v);
  clock_t end_time = clock();
  double elapsed_time = 1000.0 * (start_time - end_time) / CLOCKS_PER_SEC;
  cout << "SORTED  : ";
  print_array(v);
  ostringstream oss;
  oss << elapsed_time;
  string elapsed_time_str = oss.str();
  cout << "CPU TIME: " << elapsed_time_str << " ms" << endl;
  cout << "=================" << endl;
}

int main() {
  int n;
  cin >> n;
  for (int i=0; i<n; i++) {
    string t;
    int n2;
    cin >> t;
    cin >> n2;
    if (t == "int") {
      vector<int> v_i;
      for (int j=0; j<n2; j++) {
        int v_el;
        cin >> v_el;
        v_i.push_back(v_el);
      }
      measure_algo_time(v_i);
    } else {
      vector<string> v_s;
      for (int j=0; j<n2; j++) {
        string v_el;
        cin >> v_el;
        v_s.push_back(v_el);
      }
      measure_algo_time(v_s);
    }
  }

  return 0;
}
