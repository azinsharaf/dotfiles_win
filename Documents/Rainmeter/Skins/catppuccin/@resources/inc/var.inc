;manual editing of these values is not advised.
;use the included settings skin for customisation.
;if you still wish to proceed, do so with caution.

[variables]
@include=#@#inc\flavors.inc

accent=3
;0-13
;rosewater, flamingo, pink, mauve, red, maroon, peach, yellow, green, teal, sky, sapphire, blue, lavender

flavor=2
;0-4
;latte, frappe, macchiato, mocha, custom

font=Hack Nerd Font
bTextSize=10
fontW=400
iconW=400
bCorner=15
pCorner=15
stkW=0

maxAppCount=10
;do not change

updateR=2
sysIncDecVal=5
appIncDecVal=2

iconSize=12
xPadding=20
edgePadding=10
yPadding=5
bWidth=(#workAreaWidth#-(#xPadding#*2))
bHeight=30
reservedSpace=69

;dynamic vars, do not change
reservedAt=TOP
direction=0

infoGap=26
iconGap=7
spaces=\s

sensitivity=35
barWidth=8
maxBarHeight=(#bHeight#/3)
;if you add -ve to this value, the vis will be inverted :)
minHeight=0
barYPadding=#maxBarHeight#
bGap=1

accuracy=4
FPS=60
visSmooth=10
avgSize=(#visSmooth#/4)
visMultiplier=1.0

appGap=15
popupGap=10
childGap=#popupGap#
iStroke=4
hStroke=-4
mPadding=10
menewwBg=0
invertBg=0

;do not change->
barY=0

bgColor=[#bg[#flavor]D]
bgColorL=[#bg[#flavor]L]
mColor=[#m[#flavor]]

sColor=[#c[#accent][#flavor]]

color0=[#c0[#flavor]]
color1=[#c1[#flavor]]
color2=[#c2[#flavor]]
color3=[#c3[#flavor]]
color4=[#c4[#flavor]]
color5=[#c5[#flavor]]
color6=[#c6[#flavor]]
color7=[#c7[#flavor]]
color8=[#c8[#flavor]]
color9=[#c9[#flavor]]
color10=[#c10[#flavor]]
color11=[#c11[#flavor]]
color12=[#c12[#flavor]]
color13=[#c13[#flavor]]

stkColor=#sColor#
noPacEmojiColor=#mColor#,90
yesPacEmojiColor=#color7#
runningAlpha=200
notRunningAlpha=90
pinAlpha=150
dUserID=944986926400811008
userName=[&sysUserName]
userImgPath=C:\Users\asharaf\iCloudDrive\Photos\1964883_10203078444779190_801508730_n.jpg

p0.Name=GH
p1.Name=YT
p2.Name=RD
p3.Name=RSS
p0.Action=https://www.github.com
p1.Action=https://www.youtube.com
p2.Action=https://www.reddit.com
p3.Action=https://www.inoreader.com/dashboard
folder1=home
folder2=downloads
folder3=repos
folder4=.config
folder5=wallpapers
folder1Path=Shell:MyComputerFolder
folder2Path=Shell:Downloads
folder3Path=C:\Users\asharaf\repos
folder4Path=C:\Users\asharaf\.config
folder5Path=Shell:Downloads\Wallpapers

useImperial=1
menuType=1
loadAnims=1
dNameType=1
useDiscord=0
pinnedApps=0
centerApps=1
replaceWin=0
hideTaskbar=0
pacMode=1
rSpace=0
tFormat=0
AMPM=1
td=1
wifiName=1
iconHide=1
titleS=1
tPopup=1
monStart=1
shadow=0

appsDisp=1
mediaDisp=1
visDisp=1
weatherDisp=1
wifiDisp=1
brightDisp=1
volumeDisp=1
batteryDisp=1
cpuDisp=1
ramDisp=1

dispSum=([#appsDisp]+[#mediaDisp]+[#visDisp])

pinIgnore=none|none
player=spotify|youtube
nullmTitle0=in my h3ad
nullmArtist=the voices
tAS=:\s

25.12=merry christmas!
1.1=happy new year!
31.12=new year's eve
