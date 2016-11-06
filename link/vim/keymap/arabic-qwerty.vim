" Vim QWERTY Keymap file for Arabic
" Maintainer   : Alejandro Gallo <aamsgallo@gmail.com>
" Created by   : Alejandro Gallo <aamsgallo@gmail.com>
" Last Updated : 2016-11-06
" Based on arabic_utf-8.vim default vim keymap

" Use this short name in the status line.
let b:keymap_name = "arab"

loadkeymap

Z  <char-0x0638>      " (1592)  - ZAH
v  <char-0x0637>      " (1591)  - TAH

D  <char-0x0630>      " (1584)  - THAL
d  <char-0x062f>      " (1583)  - DAL

c  <char-0x0635>      " (1589)  - SAD
C  <char-0x0636>      " (1590)  - DAD

q  <char-0x0642>      " (1602)  - QAF
f  <char-0x0641>      " (1601)  - FEH

g  <char-0x063a>      " (1594)  - GHAIN
e  <char-0x0639>      " (1593)  - AIN

o  <char-0x0647>      " (1607)  - HEH
O  <char-0x0629>      " (1577)  - TEH MARBUTA

h  <char-0x062d>      " (1581)  - HAH
H  <char-0x062e>      " (1582)  - KHAH
j  <char-0x062c>      " (1580)  - JEEM

S  <char-0x0634>      " (1588)  - SHEEN
s  <char-0x0633>      " (1587)  - SEEN

t  <char-0x062a>      " (1578)  - TEH
T  <char-0x062b>      " (1579)  - THEH

r  <char-0x0631>      " (1585)  - REH
z  <char-0x0632>      " (1586)  - ZAIN

b  <char-0x0628>      " (1576)  - BEH
n  <char-0x0646>      " (1606)  - NOON
l  <char-0x0644>      " (1604)  - LAM
m  <char-0x0645>      " (1605)  - MEEM
k  <char-0x0643>      " (1603)  - KAF

" Long vowels
A  <char-0x0649>      " (1609)  - ALEF MAKSURA
~a <char-0x0622>      " (1570)  - ALEF with MADDA ABOVE
'a <char-0x0623>      " (1571)  - ALEF with HAMZA ABOVE
aa <char-0x0627>      " (1575)  - ALEF
'i <char-0x0625>      " (1573)  - ALEF with HAMZA BELOW
w  <char-0x0648>      " (1608)  - WAW
'u <char-0x0624>      " (1572)  - WAW with HAMZA ABOVE
uu <char-0x0648>      " (1608)  - WAW
y  <char-0x064a>      " (1610)  - YEH
'y <char-0x0626>      " (1574)  - YEH with HAMZA ABOVE
ii <char-0x064a>      " (1610)  - YEH

0  <char-0x0660>      " (1632)  - Arabic 0
1  <char-0x0661>      " (1633)  - Arabic 1
2  <char-0x0662>      " (1634)  - Arabic 2
3  <char-0x0663>      " (1635)  - Arabic 3
4  <char-0x0664>      " (1636)  - Arabic 4
5  <char-0x0665>      " (1637)  - Arabic 5
6  <char-0x0666>      " (1638)  - Arabic 6
7  <char-0x0667>      " (1639)  - Arabic 7
8  <char-0x0668>      " (1640)  - Arabic 8
9  <char-0x0669>      " (1641)  - Arabic 9

" TODO: Automatic shadda
" TODO: Null character to cut the shadda
"|  <char-0x001f>       " NULL
"rr <char-0x0631><char-0x0651> " (1585)  - REH

" Tanween and symbols
<C-a> <char-0xfdf2>   "Allah
^  <char-0x0651>      " (1617)  - Tanween -- SHADDA
'  <char-0x0621>      " (1569)  - HAMZA
°  <char-0x0652>      " (1618)  - Tanween -- SUKUN
a  <char-0x064e>      " (1614)  - Tanween -- FATHA
aN <char-0x064b>      " (1611)  - Tanween -- FATHATAN
u  <char-0x064f>      " (1615)  - Tanween -- DAMMA
uN <char-0x064c>      " (1612)  - Tanween -- DAMMATAN
i  <char-0x0650>      " (1616)  - Tanween -- KASRA
iN <char-0x064d>      " (1613)  - Tanween -- KASRATAN
;  <char-0x061b>      " (1563)  - Arabic Semicolon
J  <char-0x0640>      " (1600)  - TATWEEL
,  <char-0x060c>      " (1548)  - Arabic Comma
?  <char-0x061f>      " (1567)  - Arabic Question Mark

" Extras
L  <char-0x0644><char-0x0627>  " (1604/1575)  - LAA (lam alef)
~L  <char-0x0644><char-0x0622>  " (1604/1570)  - LAA  with MADDA ABOVE
'L  <char-0x0644><char-0x0623>  " (1604/1571)  - LAA  with HAMZA ABOVE
"'L  <char-0x0644><char-0x0625>  " (1604/1573)  - LAA  with HAMZA BELOW
"N  <char-0x0622>      " (1570)  - ALEF with MADDA ABOVE
