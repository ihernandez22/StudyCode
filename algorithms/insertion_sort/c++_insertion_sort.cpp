/*
 * File: c++_insertion_sort.cpp
 * Author: Isaac Hernandez
 * Date: October 16, 2017
 * Summary: Insertion Sort for C++ (using vectors since C++ does not have variable length arrays)
 */

#include <iostream>
#include <vector>
#include <string>
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
      cout << "**********" << endl;
      print_array(v_i);
      insertion_sort(v_i);
      print_array(v_i);
      cout << "**********" << endl;
    } else {
      vector<string> v_s;
      for (int j=0; j<n2; j++) {
        string v_el;
        cin >> v_el;
        v_s.push_back(v_el);
      }
      cout << "**********" << endl;
      print_array(v_s);
      insertion_sort(v_s);
      print_array(v_s);
      cout << "**********" << endl;
    }
  }

  return 0;
}
