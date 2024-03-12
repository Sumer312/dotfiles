#!/bin/sh

all_pass_list=$(pass)
no_unicode_list=$(echo "$all_pass_list" | tr -dc '[:print:]\n')
echo "$no_unicode_list"
