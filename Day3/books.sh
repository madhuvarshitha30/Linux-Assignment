#!/bin/bash

FILE="books.txt"

###########################################
# Display all employees
###########################################
display_records() {

    echo "=========== Book Records ==========="

    cat "$FILE"

}

###########################################
# Search Employee
###########################################
search_employee() {

    echo "Enter Book Name:"
    read name

    if grep -i "$name" "$FILE"
    then
        echo "Book Found"
    else
        echo "Book Not Found"
    fi

}

###########################################
# Count Absent Employees
###########################################
count_absent() {

    count=$(grep -c "Out of stock" "$FILE")

    echo "Out of stock : $count"

}

###########################################
# Replace Absent with Present
###########################################
update_attendance() {

    echo "Enter Book ID:"
 read id

    sed -i "/^$id,/ s/Out of stock/Available/" "$FILE"

    echo "Stock Updated Successfully"

}

###########################################
# Total Salary of Present Employees
###########################################
calculate_salary() {

    total=$(awk -F',' '$4=="Available" {sum+=$5} END {print sum}' "$FILE")

    echo "Total cost of books : Rs.$total"

}

###########################################
# Display Department Employees
###########################################
department_records() {

    echo "Enter Category:"
    read dept

    awk -F',' -v dep="$dept" '

    BEGIN{
        print "Books in Category:",dep
    }

    $3==dep{
        print $0
    }

    ' "$FILE"

}

###########################################
# Highest Salary Employee
###########################################
highest_salary() {

    awk -F',' '
 BEGIN{
        max=0
    }

    {
        if($5>max)
        {
            max=$5
            emp=$2
        }
    }

    END{
        print "Highest Cost Book :",emp
        print "Highest Cost :",max
    }

    ' "$FILE"

}

###########################################
# Menu
###########################################

while true
do

echo
echo "====================================="
echo " Bookstore Management"
echo "====================================="
echo "1.Display Books"
echo "2.Search Books"
echo "3.Count Out of stock Books"
echo "4.Update Books"
echo "5.Total "
echo "6.Department Employees"
echo "7.Highest Cost"
echo "8.Exit"

echo "Enter Choice:"
read choice

case $choice in

1)
display_records
;;

2)
search_employee
;;

3)
count_absent
;;

4)
update_attendance
;;

5)
calculate_salary
;;

6)
department_records
;;

7)
highest_salary
;;

8)
echo "Thank You"
break
;;

*)
echo "Invalid Choice"

esac

done



