#!/bin/bash

#made by h03 
#credit me on twitter @didjemss...

if [ ! -d "recon" ];then
echo "Création of recon directory !";
mkdir recon
fi

if [ ! -d "temporaire" ];then
echo "Création of temporary directory !";
mkdir temporaire
fi
i=0;
j=0;
k=0;
l=0;
m=0;
n=0;
o=0;
p=0;
q=0;
r=0;
s=0;
t=0;
u=0;
v=0;
w=0;
x=0;
while true; do
    read -p "Do you have a file? y/n : " yn
    case $yn in
        [Yy]* ) read -p "Enter the path of your file: " monfifi
		echo "process of crt.sh ..."
		for crt in `cat $monfifi`
		do
			i=`expr $i + 1`
			`curl -s https://crt.sh/\?q\=\$crt\&output\=json | jq -r '.[].name_value' | grep -Po '(\w+\.\w+\.\w+)$' | anew >> recon/crtsh$i.txt`
		done
		#echo "process of google dorking..."
		#for ggdorking in `cat $monfifi`
		#do
#		̀`curl -s https://www.google.com/search?q=site:$ggdorking | grep -oP '(?<=href=")[^"]+\.'$1'\.'$2'' | grep -oP 'q=\Khttp[^"]+' >> recon/googleDork.txt`
		#done
		echo "process of subfinder..."
		for subfinding in `cat $monfifi`
		do
			j=`expr $j + 1`
			subfinder -d $monfifi -all -recursive -silent -o recon/subfinder$j.txt
		done
		echo "process of sublist3r..."
		for sublisting in `cat $monfifi`
		do
			k=`expr $k + 1`
			sublist3r -d $sublisting -o recon/sublist3r$k.txt
		done
		echo "process of findomain..."
		for finding in `cat $monfifi`
		do
			l=`expr $l + 1`
			findomain -q -t $finding -u recon/findomain$l.txt
		done
		echo "process of massdns..."
		for massdnsing in `cat $monfifi`
		do
			m=`expr $m + 1`
			`python3 /"full_path_here"/massdns/scripts/recon.py -q -d $massdnsing -l /home/jager/massdns/lists/best-dns-wordlist.txt --o recon/massdns$m.txt`
		done
		echo "chaos api initialisation..."
		export PDCP_API_KEY="your_api_key_here"
		echo "process of chaos..."
		for chaosing in `cat $monfifi`
		do
			n=`expr $n + 1`
			chaos -silent -d $chaosing -o recon/chaos$n.txt
		done
		echo "creation of dublons file and without dublons..."

		for crtkt in `cat recon/crtsh.txt`
		do
			p=`expr $p + 1`
		        echo $crtkt >> FinAvecDoublon$p.txt
		done
		for findo in `cat recon/findomain.txt`
		do
			q=`expr $q + 1`
		        echo $findo >> FinAvecDoublon$q.txt
		done
		#for ggdork in `cat googleDork.txt`
		#do
		#        echo $ggdork >> FinAvecDoublon.txt
		#done
		for subfifi in `cat recon/subfinder.txt`
		do
			r=`expr $r + 1`
		        echo $subfifi >> FinAvecDoublon$r.txt
		done
		for sublili in `cat recon/sublist3r.txt`
		do
			s=`expr $s + 1`
		        echo $sublili >> FinAvecDoublon$s.txt
		done
		for dnsenmass in `cat recon/massDns.txt`
		do
			t=`expr $t + 1`
		        echo $dnsenmass >> FinAvecDoublon$t.txt
		done
		for chachao in `cat recon/chaos.txt`
		do
			u=`expr $u + 1`
		        echo $chachao >> FinAvecDoublon$u.txt
		done
		#creation d'un fichier sans doublon
		echo "creation of a file without dublon..."
		for ouiouicdesdoublons in `cat FinAvecDoublon.txt`
		do
			v=`expr $v + 1`
			echo $ouiouicdesdoublons.txt | anew >> FinSansDoublon$v.txt
		done
		echo "process of sudomy..."
		aujourd=$(date +%m-%d-%Y)
		for sudomying in `cat $monfifi`
		do
			o=`expr $o + 1`
			/"full_path_here"/Sudomy/sudomy -d $sudomying --dnsx -s Shodan,Certspotter,Binaryedge,Hackertarget,Threatminer,CrtSH,DnsDB,BufferOver,Sypse,Threatcrowd,Dnsdumpster,Riddler,Webarchive,SecurityTrails,RapidDNS,AlienVaultCommonCrawl,FBcert,URLScan,RiskIQ̀
			#regrouper les resultats en un seul fichier
			for tkt in `cat output/$aujourd/$sudomying/dnsx_subdomain.txt`
			do
			        echo $tkt >> FinAvecDoublon$o.txt
			done
			for tkt2 in `cat output/$aujourd/$sudomying/httprobe_subdomain.txt`
			do
			        echo $tkt2 >> FinAvecDoublon$o.txt
			done
			for tkt3 in `cat output/$aujourd/$sudomying/ip_resolver.txt`
			do
        			echo $tkt3 >> FinAvecDoublon$o.txt
			done
			for tkt4 in `cat output/$aujourd/$sudomying/subdomain.txt`
			do
        			echo $tkt4 >> FinAvecDoublon$o.txt
			done
			# on supprime les doublons
			#echo "dublons removings..."
			#echo "root password please: "
			#`cat recon/temposudomy$o.txt | anew >> recon/sudomy$o.txt`
			#on supprime le fichier temporaire
			#echo "temporary files removing..."
			#`rm recon/temposudomy$o.txt`
		done
		#creation d'un fichier sans doublon en inegrant sudomy
		echo "creation of a file without dublon with sudomy files..."
		for ouiouicdesdoublons in `cat FinAvecDoublon.txt`
		do
			w=`expr $w + 1`
			echo $ouiouicdesdoublons.txt | anew >> FinSansDoublon$w.txt
		done
		echo "amass enum process.."
		for amassing in `cat $monfifi`
		do
			x=`expr $x + 1`
			amass enum -passive -norecursive -d $amassing -o temporaire/tempoamass$x.txt
			# Filtrer les résultats pour obtenir uniquement les sous-domaines au format "www.marvel.com"
			echo "Amass file created ! Filtered now..."
			`grep -oP '^[^.]+\.'$amassing temporaire/tempoamass$x.txt >> amass$x.txt`
			# Supprimer les fichiers temporaires
			#rm temporaire/tempoamass$x.txt
			echo "new amass enum file available !"
        	done
		break;;
	[Nn]* ) read -p "Enter a domain attack : " mondodo
		echo "Subdomain enumeration with crt.sh"
		`curl -s https://crt.sh/\?q\=\$mondodo\&output\=json | jq -r '.[].name_value' | grep -Po '(\w+\.\w+\.\w+)$' | anew > recon/crtsh.txt`
		#echo "google dork process..."
		#`curl -s https://www.google.com/search?q=site:$1.$2 | grep -oP '(?<=href=")[^"]+\.'$1'\.'$2'' | grep -oP 'q=\Khttp[^"]+' > recon/googleDork$1.txt`
		echo "subfinder process..."
		subfinder -silent -d $mondodo -all -recursive -o recon/subfinder.txt
		echo "sublist3r process..."
		sublist3r -d $mondodo -o recon/sublist3r.txt
		echo "findomain process..."
		findomain -q -t $mondodo -u recon/findomain.txt
		echo "recon.py of massdns process..."
		`python3 /home/jager/massdns/scripts/recon.py -d $mondodo -l /home/jager/massdns/lists/best-dns-wordlist.txt --o recon/massDns.txt`
		echo "chaos api initialisation..."
		export PDCP_API_KEY="e78d739e-8ca9-4d09-b531-c49c47eb1376"
		echo "chaos process..."
		chaos -silent -d $mondodo -o recon/chaos.txt
		echo "sudomy process..."
		/home/jager/Sudomy/sudomy -d $mondodo --dnsx -s Shodan,Certspotter,Binaryedge,Hackertarget,Threatminer,CrtSH,DnsDB,BufferOver,Sypse,Threatcrowd,Dnsdumpster,Riddler,Webarchive,SecurityTrails,RapidDNS,AlienVaultCommonCrawl,FBcert,URLScan,RiskIQ
		aujourd=$(date +%m-%d-%Y)
		#regrouper les resultats en un seul fichier
		for tkt in `cat output/$aujourd/$mondodo/dnsx_subdomain.txt`
		do
			echo $tkt >> recon/temposudomy.txt
		done
		for tkt2 in `cat output/$aujourd/$mondodo/httprobe_subdomain.txt`
		do
			echo $tkt2 >> recon/temposudomy.txt
		done
		for tkt3 in `cat output/$aujourd/$mondodo/ip_resolver.txt`
		do
			echo $tkt3 >> recon/temposudomy.txt
		done
		for tkt4 in `cat output/$aujourd/$mondodo/subdomain.txt`
		do
			echo $tkt4 >> recon/temposudomy.txt
		done
		#on supprime les doublons
		echo "dublons removings..."
		echo "root password please : "
		`sudo cat recon/temposudomy.txt | anew > recon/sudomy.txt`
		#on supprime le fichier temporaire
		echo "temporary files removing..."
		`sudo rm recon/temposudomy.txt`
		echo "creation of dublons files and without dublons ..."
		for crtkt in `cat recon/crtsh.txt`
		do
			echo $crtkt >> FinAvecDoublon.txt
		done
		for findo in `cat recon/findomain.txt`
		do
			echo $findo >> FinAvecDoublon.txt
		done
		#for ggdork in `cat recon/googleDork.txt`
		#do
		#echo $ggdork >> FinAvecDoublon.txt
		#done
		for subfifi in `cat recon/subfinder.txt`
		do
			echo $subfifi >> FinAvecDoublon.txt
		done
		for sublili in `cat recon/sublist3r.txt`
		do
			echo $sublili >> FinAvecDoublon.txt
		done
		for dnsenmass in `cat recon/massDns.txt`
		do
			echo $dnsenmass >> FinAvecDoublon.txt
		done
		for chachao in `cat recon/chaos.txt`
		do
			echo $chachao >> FinAvecDoublon.txt
		done
		echo "sudomy files process..."
		for sudomymy in `cat output/$aujourd/$mondodo/subdomain.txt`
		do
			echo $sudomymy >> FinAvecDoublon.txt
		done
		for sudomymy1 in `cat output/$aujourd/$mondodo/dnsx_subdomain.txt`
		do
			echo $sudomymy1 >> FinAvecDoublon.txt
		done
		for sudomymy2 in `cat output/$aujourd/$mondodo/httprobe_subdomain.txt`
		do
			echo $sudomymy2 >> FinAvecDoublon.txt
		done
		for sudomymy3 in `cat output/$aujourd/$mondodo/ip_resolver.txt`
		do
			echo $sudomymy3 >> FinAvecDoublon.txt
		done
		for mondernierchat in `cat recon/sudomy.txt`
		do
			echo $mondernierchat >> FinAvecDoublon.txt
		done
		for mesDoudoulons in `cat FinAvecDoublon.txt`
		do
			echo $mesDoudoulons | anew >> FinSansDoublon.txt
		done
		echo "amass enum process..."
		amass enum -passive -norecursive -d $mondodo -o temporaire/tempoamass.txt
		# Filtrer les résultats pour obtenir uniquement les sous-domaines au format "www.marvel.com"
		echo "Amass file created ! We filter now..."
		`grep -oP '^[^.]+\.'$mondodo temporaire/tempoamass.txt >> amass.txt`
		# Supprimer les fichiers temporaires
		rm temporaire/tempoamass.txt
		echo "new amass enum file available !"
		break;;
        * ) echo "Please answer yes or no.";;
    esac
done
