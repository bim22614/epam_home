# !/bin/bash



# 1. From which ip were the most requests?
echo '1. From which ip were the most requests?'

most_ip_var=`cut -d' ' -f1 apache_logs.txt | sort | uniq -c | sort -k 1 -n | tail -n 1`

echo $most_ip_var | cut -d' ' -f2



# 2. What is the most requested page?
echo '2. What is the most requested page?'

most_page_var=`cat apache_logs.txt | grep -P -o 'http://.*"' | sort | uniq -c | sort -n | tail -n 1`

echo $most_page_var | cut -d' ' -f2 | sed 's/)"//g'


# 3. How many requests were there from each ip?
echo '3. How many requests were there from each ip?'

echo 'Request             IP'
echo ''

cut -d' ' -f1 apache_logs.txt | sort | uniq -c


# 4. What non-existent pages were clients referred to? 
echo '4. What non-existent pages were clients referred to?' 

cat apache_logs.txt | grep -v -P 'http://.*"' | cut -d' ' -f7 | sort | uniq



# 5. What time did site get the most requests? 
echo '5. What time did site get the most requests?'

l5=`cut -d' ' -f4,5 apache_logs.txt | sort | uniq -c | sort -k 1 -n | tail -n 1`
l5n=`echo $l5 | cut -d' ' -f1`


echo 'Request             Time'
cut -d' ' -f4,5 apache_logs.txt | sort | uniq -c | sort -k 1 -n | grep '5 .[0-9][0-9]'\/


# 6. What search bots have accessed the site? (UA + IP)
echo '6. What search bots have accessed the site? (IP + UA)'

cut -d' ' -f1,14 apache_logs.txt | grep -i bot | sort | uniq | column -t








