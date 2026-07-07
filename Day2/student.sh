echo "Enter student marks for five subjects: "
read a
read b
read c
read d
read e
total="$(($a+$b+$c+$d+$e))"
echo "Total Marks: $total"
avg= "$(( total/5 ))"
echo "Average Marks: $avg"
if [[ $avg =~ [90-100] ]]; then
        echo "Grade: A"
elif [[ $avg =~ [75-89] ]]; then
         echo "Grade: B"
elif [[ $avg =~ [60-74] ]]; then
         echo "Grade: C"
elif [[ $avg =~ [\50-59] ]]; then
         echo "Grade: D"
else
         echo "Fail"
fi


