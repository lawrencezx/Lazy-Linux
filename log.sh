#!/bin/bash
# Author: zouxu

ll_print_head() {
  printf "\n"
  printf "\033[32mLAZY LINUX...\n\033[0m"
  printf "\n"
}

ll_print_term() {
  pad=$(printf '%0.1s' "."{1..100})
  padlength=80
  printf "\033[33m%s\033[0m" "${1}"
  printf "\033[33m%*.*s\n\033[0m" 0 $((padlength - ${#1})) "$pad"
}

ll_print_error() {
  printf "\033[31m%s\n\033[0m" "error: ${1}"
}
