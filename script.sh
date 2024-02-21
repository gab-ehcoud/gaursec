#!/bin/bash
#!/bin/bash
file=$1
# '-z' if domain param is empty
if [[ -z $file ]]; then
    echo -e "Usage: ./recon.sh <domain.com>"
    exit 1
fi

echo -e "\e[91m[-] This script will gather the following information for you\e[0m"
echo -e "\e[34m[+]\e[0mAll existing domains in $file"
echo -e "\e[34m[+]\e[0mAll Live domains in $file"
echo -e "\e[34m[+]\e[0mAll URLs/Links in $file"
echo -e "\e[34m[+]\e[0mAll JS files in $file"
echo "	"
echo -e "\e[41m This will take some time. Have a cup of coffee "
echo "	"
echo "	"

target="${file%.*}"
mkdir "output_$target";


for domain in $(cat $file); do
    echo -e "\e[34m[+]\e[0mChecking $domain"
    echo -e "\e[93mEnumerating subdomains with SubFinder...\e[0m"#
    subfinder -d $domain -silent >> output_$target/all_subdomains.txt | sort -u
    echo -e "[- Task Done -] \e[92mAll domains of $domain are saved in all-subdomains.txt\e[0m"
done

cat output_$target/all_subdomains.txt | httpx -mc 200 > output_$target/200.txt
cat output_$target/all_subdomains.txt | httpx -mc 301,302 > output_$target/30x.txt
cat output_$target/all_subdomains.txt | httpx -mc 401,404,403 > output_$target/40x.txt

echo "	"
# echo -e "\e[93mFetching all URLs/links of $domain, this may take some time..\e[0m"
# cat $domain/live-domains.txt | waybackurls | sort -u > $domain/urls.txt
# echo -e "[- Task Done -] \e[92mAll urls/links of $domain are saved in urls.txt\e[0m"

# echo "	"
# echo -e "\e[93mEnumerating all JS files from $domain, this may take some time\e[0m"
# cat $domain/urls.txt | grep "\.js" | uniq | sort > $domain/js-files.txt
# echo -e "[- Task Done -] \e[92mJs files of $domain are saved in js-files.txt\e[0m"

# echo "	"
# echo -e "\e[95m~ All files are saved in $domain directory\e[0m"
# echo -e "\e[5m			Happy Hacking :)\e[0m"
