#!/bin/sh
# WM detection logic was taken from ufetch. All ASCII art was taken from neofetch. Link: https://github.com/dylanaraps/neofetch
LC_ALL=C # No universal typeface = go faster
LANG=C   # This line and the above taken from neofetch
OS=$(cat /etc/os-release | awk '/_NAME/' | awk -F'[""]' '{print $2}')
id=$(xprop -root -notype _NET_SUPPORTING_WM_CHECK)
id=${id##* }
wm=$(xprop -id "$id" -notype -len 25 -f _NET_WM_NAME 8t)
wm=${wm##*_NET_WM_NAME = \"}
wm=${wm%%\"*}
if [ "$OS" = "OpenSUSE" ]; then uptime=`uptime | sed 's/,//' | awk '{print $3" "$4" "$5}'`; else uptime=`uptime -p | sed 's/up //'`; fi
case $OS in
Arch* | Artix* | Manjaro*)
pkg=`pacman -Q | wc -l`
;;
Gentoo*)
pkg=`qlist -IRv | wc -l`
;;
Void*)
pkg=`xbps-query -list-pkgs | wc -l`
;;
Debian* | Pop!_OS* | popos* | pop_os* | Ubuntu*)
pkg=`apt list --installed 2>/dev/null | wc -l`
;;
Solus*)
pkg=`ls -lah /var/lib/eopkg/package/ | wc -l`
;;
OpenSUSE*)
pkg=`zypper search -i | grep "^i+" | wc -l`
;;
Mac\ OS\ X* | MacOS*)
pkg=`dir "$(brew --cellar)/* $(brew --caskroom)/*" | wc -l`
;;
*)
pkg="IDK How many packages you have because I don't know your distro"
;;
esac
#figlet -f lean <words> | tr ' _/' ' /'
case $OS in
Arch*)
c1='\033[1;36m'
c2='\033[0m'
echo -e "${c1}
      ////                        //
   //    //  //  ////    //////  //////
  ////////  ////      //        //    //
 //    //  //        //        //    //
//    //  //          //////  //    //${c2}"
;;
Debian*)
c1='\033[1;31m'
c2='\033[0m'
echo -e " ${c1}
    //////              //        ${c2}//${c1}
   //    //    ////    //////          //////  //////
  //    //  ///___//  //    //  //  //    //  //    //
 //    //  //        //    //  //  //    //  //    //
//////      //////  //////    //    //////  //    //${c2}"
;;
Gentoo*)
c1='\033[1;35m'
c2='\033[0m'
echo -e "
     ${c1}//////                        //
    //          ////    //////    ////////    ////      ////
   //  ////  ////////  //    //    //      //    //  //    //
  //    //  //        //    //    //      //    //  //    //
   //////    //////  //    //      ////    ////      ////${c2}"
;;
Void*)
c1='\033[1;38;5;34m'
c2='033[0m'
echo -e "
  ${c1}//      //            //        //
 //      //    ////          //////
//      //  //    //  //  //    //
 //  //    //    //  //  //    //
  //        ////    //    //////${c2}"
;;
Artix*)
c1='\033[1;36m'
c2='\033[0m'
echo -e "
     ${c1} ////                //      //
   //    //  //  ////  ////////      //    //
  ////////  ////        //      //    ////
 //    //  //          //      //  //    //
//    //  //          //      //  //    //${c2}"
;;
Ubuntu*)
c1='\033[1;38;5;202m'
c2='\033[0m'
echo -e "
   ${c1}//    //  //                              //
  //    //  //////    //    //  //////    ////////  //    //
 //    //  //    //  //    //  //    //    //      //    //
//    //  //    //  //    //  //    //    //      //    //
 ////    //////      //////  //    //    //        //////${c2}"
;;
Solus*)
c1='\033[1;34m'
c2='\033[0m'
echo -e "
   ${c1}   //////            //
   //          ////    //  //    //    //////
    ////    //    //  //  //    //  ////
       //  //    //  //  //    //      ////
//////      ////    //    //////  //////${c2}"
;;
Pop!_OS* | popos* | pop_os*)
c1='\033[1;38;5;29m'
c2='033[0m'
echo -e "
${c1}    //////                        //             ////      //////
   //    //    ////    //////    //           //    //  //
  //////    //    //  //    //  //           //    //    ////
 //        //    //  //    //               //    //        //
//          ////    //////    //             ////    //////
	           //
		  //             //////////${c2}"
;;
Manjaro*)
c1='\033[1;32m'
c2='\033[0m'
echo -e "
   ${c1} //      //                      //
   ////  ////    //////  //////          //////  //  ////    ////
  //  //  //  //    //  //    //  //  //    //  ////      //    //
 //      //  //    //  //    //  //  //    //  //        //    //
//      //    //////  //    //  //    //////  //          ////
	                       //
	                    //${c2}"
;;
OpenSUSE* | openSUSE*)
c1='\033[1;32m'
c2='\033[0m'
echo -e "
   ${c1}  ////
  //    //  //////      ////    //////
 //    //  //    //  ////////  //    //
//    //  //    //  //        //    //
 ////    //////      //////  //    //
        //
       //

       //////  //    //    //////  ////////
    //        //    //  //        //
      ////    //    //    ////    //////
	  //  //    //        //  //
   //////      ////    //////    ////////${c2}"
;;
Mac\ OS\ X* | MacOS*)
c1='\033[1;32m'
c2='\033[0m'
c3='\033[1;31m'
c4='\033[1;33m'
c5='\033[1;34m'
echo -e "
  ${c3}  //      //                        ////      //////
  ${c4} ////  ////    //////    //////  //    //  //
  //  //  //  //    //  //        //    //    ////
${c1} //      //  //    //  //        //    //        //
${c5}//      //    //////    //////    ////    //////${c2}"
;;
*)
c1='\033[1;33m'
c2='\033[0m'
echo -e "    
   ${c1} //////  //////    //    //
     //    //    //  //  //
    //    //    //  ////
   //    //    //  //  //
//////  //////    //    //${c2}"
;;
esac
echo -e "
${c1}`whoami`${c2}@${c1}`if [ -x /etc/conf.d/hostname ]; then cat /etc/conf.d/hostname; else cat /etc/hostname; fi`
OS:${c2} $OS `uname -m`${c1}
Kernel: ${c2}`uname -r`${c1}
Uptime: ${c2}$uptime${c1}
Packages: ${c2}$pkg${c1}
Shell: ${c2}$SHELL `$SHELL --version | awk '/, version/{print $4}'`${c1}
Resolution: ${c2}`xrandr --nograb --current | awk 'match($0,/[0-9]*\.[0-9]*\*/){printf $1 " @ " substr($0,RSTART,RLENGTH) "Hz "}'`${c1}
WM: ${c2}`if [ -n "${XDG_SESSION_DESKTOP}" ]; then echo $XDG_SESSION_DESKTOP; else echo ${wm}; fi`${c1}
Terminal: ${c2}$TERM${c1}
CPU: ${c2}`lscpu | awk '/name:/{print $3" "$4" "$5" "$6}'` `lscpu | sed '5! d' | awk '{print "("$2")"}'` @ `lscpu | awk '/max/ {print $4}' | cut -c 1-4`MHz${c1}
GPU: ${c2}`lspci | awk '/VGA/{$1=$2=$3=$4="";print $0}' | cut -c 5- | awk -F'[()]' '{print $1}'`${c1}
Memory: ${c2}`free -h --si | awk '/Mem:/{print $3 "/" $2}'`${c2}"
