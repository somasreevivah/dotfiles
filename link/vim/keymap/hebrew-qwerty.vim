" Vim Keymap file for hebrew
" Maintainer  : Ron Aaron <ron@ronware.org>
" Last Updated: Thu 08 Mar 2001 13:49:01
" This is my version of a phonetic Hebrew

" Use this short name in the status line.
let b:keymap_name = "heb"

loadkeymap

w       <char-0x5e9> " ù - shin
n       <char-0x5e0> " ð - nun
b       <char-0x5d1> " á - bet
g       <char-0x5d2> " â - gimel
q       <char-0x5e7> " ÷ - qof
k       <char-0x5db> " ë - kaf
e       <char-0x5e2> " ò - ayin
y       <char-0x5d9> " é - yod
N       <char-0x5df> " ï - final nun
j       <char-0x5d7> " ç - het
l       <char-0x5dc> " ì - lamed
K       <char-0x5da> " ê - final kaf
x       <char-0x5e6> " ö - tsadi
m       <char-0x5de> " î - mem
M       <char-0x5dd> " í - final mem
p       <char-0x5e4> " ô - pe
f       <char-0x5e4><char-0x5bc> " ô - fe + dagesh
r       <char-0x5e8> " ø - resh
d       <char-0x5d3> " ã - dalet
a       <char-0x5d0> " à - alef
v       <char-0x5d5> " å - vav
h       <char-0x5d4> " ä - he
s       <char-0x5e1> " ñ - samekh
z       <char-0x5d6> " æ - zayin
T       <char-0x5d8> " è - tet
t       <char-0x5ea> " ú - tav
X       <char-0x5e5> " õ - final tsadi
P       <char-0x5e3> " ó - final pe
F       <char-0x5e3><char-0x5bc> " ô - final fe + dagesh
A:      <char-0x5b0> " sheva
HE      <char-0x5b1> " hataf segol
HA      <char-0x5b2> " hataf patah
HO      <char-0x5b3> " hataf qamats
I       <char-0x5b4> " hiriq
AY      <char-0x5b5> " tsere
E       <char-0x5b6> " segol
AA      <char-0x5b7> " patah
AO      <char-0x5b8> " qamats
O       <char-0x5b9> " holam
U       <char-0x5bb> " qubuts
D       <char-0x5bc> " dagesh
]T      <char-0x5bd> " meteg
]Q      <char-0x5be> " maqaf
]R      <char-0x5bf> " rafe
]p      <char-0x5c0> " paseq
"SR      <char-0x5c1> " shin-dot
"SL      <char-0x5c2> " sin-dot
"]P      <char-0x5c3> " sof-pasuq
VV      <char-0x5f0> " double-vav
VY      <char-0x5f1> " vav-yod
YY      <char-0x5f2> " yod-yod

" cantillation:

C:      <char-0x591>  " etnahta
Cs      <char-0x592>  " segol
CS      <char-0x593>  " shalshelet
Cz      <char-0x594>  " zaqef qatan
CZ      <char-0x595>  " zaqef gadol
Ct      <char-0x596>  " tipeha
Cr      <char-0x597>  " revia
Cq      <char-0x598>  " zarqa
Cp      <char-0x599>  " pashta
C!      <char-0x59a>  " yetiv
Cv      <char-0x59b>  " tevir
Cg      <char-0x59c>  " geresh
C*      <char-0x59d>  " geresh qadim
CG      <char-0x59e>  " gershayim
CP      <char-0x59f>  " qarnei-parah
Cy      <char-0x5aa>  " yerach-ben-yomo
Co      <char-0x5ab>  " ole
Ci      <char-0x5ac>  " iluy
Cd      <char-0x5ad>  " dehi
Cn      <char-0x5ae>  " zinor
CC      <char-0x5af>  " masora circle
X`      <char-0xfb20> " Alternative `ayin
X'      <char-0xfb21> " Alternative 'alef
X-d     <char-0xfb22> " Alternative dalet
X-h     <char-0xfb23> " Alternative he
X-k     <char-0xfb24> " Alternative kaf
X-l     <char-0xfb25> " Alternative lamed
X-m     <char-0xfb26> " Alternative mem-sofit
X-r     <char-0xfb27> " Alternative resh
X-t     <char-0xfb28> " Alternative tav
X-+     <char-0xfb29> " Alternative plus
XW      <char-0xfb2a> " shin+shin-dot
Xw      <char-0xfb2b> " shin+sin-dot
X..W    <char-0xfb2c> " shin+shin-dot+dagesh
X..w    <char-0xfb2d> " shin+sin-dot+dagesh
XA      <char-0xfb2e> " alef+patah
XO      <char-0xfb2f> " alef+qamats
XI      <char-0xfb30> " alef+hiriq (mapiq)
X.b     <char-0xfb31> " bet+dagesh
X.g     <char-0xfb32> " gimel+dagesh
X.d     <char-0xfb33> " dalet+dagesh
X.h     <char-0xfb34> " he+dagesh
Xu      <char-0xfb35> " vav+dagesh
X.z     <char-0xfb36> " zayin+dagesh
X.T     <char-0xfb38> " tet+dagesh
X.y     <char-0xfb39> " yud+dagesh
X.K     <char-0xfb3a> " kaf sofit+dagesh
X.k     <char-0xfb3b> " kaf+dagesh
X.l     <char-0xfb3c> " lamed+dagesh
X.m     <char-0xfb3e> " mem+dagesh
X.n     <char-0xfb40> " nun+dagesh
X.s     <char-0xfb41> " samech+dagesh
X.P     <char-0xfb43> " pe sofit+dagesh
X.p     <char-0xfb44> " pe+dagesh
X.x     <char-0xfb46> " tsadi+dagesh
X.q     <char-0xfb47> " qof+dagesh
X.r     <char-0xfb48> " resh+dagesh
X.w     <char-0xfb49> " shin+dagesh
X.t     <char-0xfb4a> " tav+dagesh
Xo      <char-0xfb4b> " vav+holam
XRb     <char-0xfb4c> " bet+rafe
XRk     <char-0xfb4d> " kaf+rafe
XRp     <char-0xfb4e> " pe+rafe
Xal     <char-0xfb4f> " alef-lamed
