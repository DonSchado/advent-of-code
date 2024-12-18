input = DATA.read.split("\n\n")

puts 'For each group, count the number of questions to which _ANYONE_ answered "yes". What is the sum of those counts?'
puts input.sum { |l| l.gsub("\n", '').chars.uniq.count }
# => 6748

puts
puts 'For each group, count the number of questions to which _EVERYONE_ answered "yes". What is the sum of those counts?'
answers = input.map { |l| l.split("\n") }.map do |group|
  group.join.chars.tally.count { |char, n| n >= group.size }
end
puts answers.sum
# => 3445

__END__
syz
cywjs
jptzy
pjkyr
nhdbvyoqlxm

sljgqfuvrkpzhbax
balxvkgjquhzpsrf
jghpasuerbfvlkxiz

e
phue
eid
ez

igndfazbomyjkevwr
bejkdvzmgnofirway
afredowmyzgbnivjk

jotunfx
futnzbw
etufn
utznf
fntu

dsjwfhi
dhfsvw
wdfs
fdkgsw
wdvsf

ijgowbynhxkcu
amzpkdhyfesjuvt
sqrjeyhluk

j
w
j

typfurv
fzvytjurp

hykudlvmcpsbxznojfgeiwt
nscojvdpklgxbuiteyfmwhz
etjnuicwbyzkfghvopdxslm
bwijymcdnlfskphteougxzv

pjhwa
hwpj
tpjdhw

zvkyaju
mcjygolzas
aycjr
qfwjypdabth
yjacx

kbxuaypqizegj
qrdusglmiwzk
wuirhkqtnzg

tgxukmjqy
kjgqutvpsny
gtmukxqyj
koyqjgtu
joyugqtk

pdbarxj
obrd
uwblcrdqehvz

qyfgtumd
qmyutgfz

evcbwhr
crxwevsyb
ercbwvl

mtzgbwydxpcnrefhiso
hvaofetidsj
ieqkuosthfd

musaqnvctwokrb
qbhcvswmnru
csuqmwvnhbr

idupje
cue
zuexbgyklofanmt

niycgdemzftqohkxjvw
epjmyoqvgwchzdkirntf
vultgkmocbfqnzsijwye

rqhwmocn
mudblste

blrnysadq
aeudqyln
rynuadq
idytnaqox
fqeaynd

t
t

em
e
e
e
e

chrtqlvosz
rzyuqsh
sjhzrqx

yvxkiuzh
ykohxvaustebi
uxhykiv

qrytxewpbg
hjzeq
aviqfuolc
tpnxkqs

vjexkoltifucpd
uxcpetivdkjolf
cjvuidfkoxtelp

wnrebtkqhlayuopfzd
bmdvgqhrfnlckxwte

embvfqkcjw
fmvsbewqck
wbvkmceqhuf
mvbfqeswckp
bdqykvfiemcrw

ayl
atlkn
xal

tkernwq
geqbkwnt
qleufjwk
tgqkywbe

xmgefrvyoidupksl
udkloxpyvmgefsir
pkiefdgyvsxmurlo
osplefyduxbgikrvm
eprlsyxcgokdifvum

pkbast
skabtp
qkpbtsa

e
k
ul

qgpf
pgfq
gqpf
fsqpg

p
p
p
p
vpg

hpuzj
iruzjhp

cutnaobqd
ouaemqbkldihvnw
aynosbdurq
ybaosqundp

qzkxgbpcaetnhivrdfmlso
meqpkbfxhdcyglsrvniotaj
szaodencphwmbtvqgkxlirfu

hfxpvgrwkjbiyuzqdma
qxldczstri

nd
dn
nd
nd
tbdghn

nrsoyzhd
weiytfodsbzvrh
hyrnzdaso
yrxhnzosd
ozhrdnsy

hrjxdpywcztauqsblvkmg
fasuijxhbwtnzdqemvlprygkc

kqiycjdz
qkcjyzdi
dzjkqicy

tyanw
wanty
tynaw

sqtvuz
zuktspfd

kxigyptofv
tvrhyfpikxog
pykitfxogvc
oyxvpkiftg

izrcupmlfkqndh
ufkylmcasxzpegw
fzqckmtuvpjl

jhdbnoqzkgtscvmpaur
nscihmtqpkrdbugjv

vtpoqnki
otugapkviq
tipoykejxmdl

dr
vak

ealopb
kmwqeayux

vkheapbqumslg
mcaequkbvsgh
evqkghbdmaus
ebagokuhmqvs
fdmvaqhkesgyub

yofwljqmerabnguzsd
rbmnszqaugwdlejyfo
ezbomlasfjgnwdruqyt
jfmdiyuslanrqowezb

aicbx
cnwigbf
bicl

awuniboelyxrd
wodbxry
kxordywb
jybwoxrd
pwdxbygor

sdagzt
dzgtsa
gtsadz
zagstd

thbpazyrn
znarbp
bynzprta
kzpdancrb
hrapnzb

k
k
k
k

rbgaxoeq
qxhbro
hoxqrbw
xrowbq

ezlkafdwc
lewcdkzaf

ejrpuy
jreuy
ykejufrc
euyjqr

chdmyqrtfnolje
ljcmbhqfnyro

bjfmhguenyzwpktoav
hxduavymkfbrgpinetljwczoq
unhowftgbaszypvkjme
jztkbyweungmhopasvf

xcfobayn
wjr

ljearbx
eatubjrxl
lxrbapjkce
rbhjalzexo

trqbedujx
rzukegco

ycmxrgj
mjcgiq
mxnpjgyc

qdkctaripyowux
jxpcudwtksoryaqil

kt
tk
kat
ktns

uq
uq
uq
uq

lmgywjfvrckuxsbnhzetoq
elqvnoycwujgrzmbkfxhs
encbomlskxqjhuvygfrzw
wcymolebjrqnxzvfkshgu
shlrzunbqovwckxmgyfej

ceuan
dztenuy
snuke

nd
d
d
d
d

rptbkixnfucvjlmgowaz
unzkliovacfxjwgrmbtp
mzcwksbvtgnoapfujlxir

tkslmwavghnou
qwjpzydxrbi

lgmachyenvkpfxoit
dieljkwmgfpchosqvnuz

u
u
ub

wkzr
wmhjkzd

htavjseluxn
lvseutxhajn
lehnasjxutv
tasjxvhneul
atsnelhvjxu

vamlqrbzyfihe
qhszxlkvibudc
qlhgvijebpnz
holbqwvzai

byjcixm
ciymjbx
bcmyjxi
bcrxmiyjg

aewfthvkog
gthswavof
tagozvhkfe
yofvghta
vfloumqtxapgh

wisnvaz
vizhdsln
sivgnakwz
nzvxis

es
es
se
se
se

sqvpbdgocuhlefrmt
squhdgbmcaolvrfetp
dsfobvgmhquztrlpecn

rlwmyhvzpxabdoskijq
zywbdjokmxpihqgacs

oms
c
g
d
d

jixqoay
ypjmqrotx
qyondjxa

wjburgmop
owkbjrugpm
bjlpudmhgxrowq

otcxjzlvyisrb
jryszblvc
pyvczjblrs

pegzbli
ogsnqchy

sofzdqjcrpvmthgx
axveqfhcwzdg
vcwxgdqfzh

vda
vad
dav
asxvdi

gfehlqjy
hsjyeqxgdf
qzhefpgjtry

cafujrdy
jdpcuayofr

fgjp
f
mfwnoz
ifvckqtr
sfb

dxlsrficmtzayvknbwhop
kwtrvdxlmhnpyisoczfab
tkrifomzhslcbpayvwdxn
cxlisywrtmnfdhbpzkaov
ramwinblkpxczdyhvsoft

w
ez
tmw
t
hc

zguhfmxdvprqtcokanbw
hrgkzxvwbdnftaqom
itzjdrfyexvaqnbhmwlo

ijkfnqz
zjbrmdyh
zji
uqazjgk
zqisja

spwmx
miwasb

afmy
pfmawg

tkygwqvcxizs
wicgsvtzxkqy
ksvtxqiyzgwc
wjtzgxiqkvysc

kbdxunyhj
jbcxuynkdh
jydxukhbn

qvkuhbl
vbuhkql
bhklvuq
lbqkuvh
kbqhluv

evjcdtwqonfzghapml
fdqazwpeykbcmh
mdyebrzcphwfiqa

ydoztvqa
taozqvy
tyozvaq

zhxumnlojy
ziotnuhay
hcysuofzb
vkeuorqpwzh

la
av

wxdzyfbotpuemlghas
lkirngcvw

lwyisnkuxdmfe
fymcbixvrselondjku
xuqfksdylinme
ienmydkfuxls
mlxiywknsfduqe

cm
uc
mc
c
acv

ubyxf
wsujbf
wufbnj

ezklg
zaerkgl

e
xte
e

sympkv
kmyvjrtps

obzyuqveswl
btyqvslur

cfhk
czhrxfn
hclfj
ckhf
hfkc

gmwnxkeiphadrbs
fnpkiaqdwheorsbumcg
ayimhrgwpdebkns
ekisrwdgmxahnblpv
wadnrhkbezsmjgpi

ebjvmfxulygr
wmxgyujeznlrbv
uselxgjbvyr

hrfiptwjxgbnv
dujanfbiyghpcvr
bpfjinrhgv
jrfhimgpbnv

cjilvoaryexmwktngbqdhpsz
ivsndcklqbewgotyxmahpjrz
rxdguelifotkqmbsvyawnjzphc
tmaxosglwqdhpzicnbkjyver

bsjdniyxwpruvgozcklmta
eznluwcgxvsamtkdyi
iszgwcntamdulxkyv

yjpncrzw
nkawcjzyp
ykpncxwejz

kpcbzjyuhsilraef
uhqjzgpayslrkc
agykjzlschpruw
khuqcaprzylsj
pzakgsnulrhcyj

vlip
plv
pxvl
lpv
lvp

kjbgdzhoasletq
wqthoklasegbz

quaprk
uk

vokcgaw
gkrfvao
kovgaf
qvkago

poyradmbht
txfpuodbm
itpdolbjemz
pbtmygod

wfl
lgcw
wul

vcxsalqwri
azwlrxosicvmq
lisqvanxrcw
ialcqrwvnsx

wnxsmazobkpheyd
sgdnbhkwapzymxeo
epykhmsdxzobawn
johwktpamfxbvsydcenqlz
pswkbheaydnxozm

axtzclequ
cltzeu
ybtzvfgrliceu
elotcuz

tmu
mlut
mtu
uyvtmj
mltu

fljpx
cfpy
pfy
fpc

htiyf
fthyi

turzcikd
itwbzdrku
kiztrud
yirznktdfu

z
z
z
z
a

tufogmyvxerq
qzbg
qzjdg
ngqw

ksxtv
svkt
vstkm
sxcrktdv
kstvqx

slfapq
ljsbpxmqa
vephkzoyun

geciwzs
soa
sci
zps
msndv

axdzughpmblokjcrqiwveftsny
xgiudrpzeyfanskqbhcwtmvolj

uqmrdas
zoshwvxc
epalrsid

sqk
qs
sq
sq

lvmr
rlf
xlrj
lr
lry

wqr
rcqw
drfqya
rq
rcq

wdnlsfpovaiu
rgoytfuknjevpimdhwal
awuplcnosfidv
fvnploauidw
xainldbwqvufspo

winvacfeodrgkjpzl
vnplxodwczkgjarfe
lewdpjorngafzvck

nbyejs
fnwurdbsh
cjnvbfgswaut
plxkzqsomibn

vdgtpesyhriaknlm
knlsmrdypgheatv

nrqetuizbvkmpya
bnazcmetriksjy

n
l

chvwfstei
cnziqpe
dlnczixe

ydgepskimc
mgecswpkdi
idhpskcmeg
kmpecsdig
nsdmgkepic

jvwsexc
jxcswv
vcswxj
jsxvwc
cwvsjx

sgyouhwfvzpq
wfypghszov
swhovygpfz
gvofpzwysh

yvrznt
ntbyrvz
zvnxrwyt
rvtynz

ixgdbjeoqlmn
rcgdxun
sdgkhnx
rknxwgacd
yndgxz

fnpilgyjembrqxk
gmpbyjkqlxenri
icbkejaqypurxlnmg
shjnikrbympxlqeg
lrjqkgymntpeibxdvo

nujyfxlkozpvd
kulhcpxzd
iuzkpdlrx
ahswkiclzqduxp

msweqtzfacbvdlkjhrxoug
mfglurkxteqowbshvjdzac
omczrhjlexsvqufgtkwbda
cjbohsxragqutzvldwefkm
kcjgbzmhxvwadrlesftoqu

kdmruzoveyjabln
onkdyrauzbevm
redbmzuaokvyn
kabznyorvedum
vkemobynrdzau

aoqckjlsuwdhrn
upthcqaxgrkynleb

gubnvtkd
kavmdil
xkfnvd
ukydvqnw
vfkd

zutixybwpe
tewxmbu

oah
yn
cw
kc
xklcyw

xwynlbigvrqmsfcd
yvcfmzxwiqsolgbu
bwvghlipmxfsykcaeq
ibsqvmygcxwlf
bsmuicwjqflyrgxv

oxsdje
hqsoj
kbgicsopun
oqrws

ljcmrwbqfku
djifkmluwrzc
yurcmzwfvjlk
ngmwkaejfhtlrucsp

vqtbgacyflsezk
qoxfmjdrhtngw

oamzed
adzeom
zmeoad
ezmoda

weylubormjzivhsqpgct
bcixgodqwulpjystfrvh
rfloistdwpvyqbjhguc
hlktiogqjpvfbruwxycs
ciphotjyvluqbwrsg

kpbu
pku

nmhjfedrzipwg
rpwavgjzmqie
gpremizkwtyjq
egiwmzjpbur

yaojgdq
qogday

ylvduhestkqgbpf
glbqzhtxkpovdw

dtamfhxzql
ylxmzfhaqud
fzdqmahlx
zkmdfxlpcahq

petkohzrwvlxsif
rtxfkhzioplesvw

shabodwfmgkvlzpqyrjut
tzmhkrlgqdbsjvaoufypw
lfvwbptzmyjorkaghusqd
amwytlpfhrvzogkudsjb
wohfujyklvzmbastprgcd

hrlnt
ltnoh
kxtlnh
jhlntr
nhtlz

evci
veic
viche
ciev
viejc

gqdtixovuraznwecfkmyphlsb
gdlkqrspucwfxaozvynbethi
lhirfcguoaskntdxewzqvbpy

dbqwokayzmjpnsirvflgt
kxfodwgqcvytaispnjlzu
tdvpywlobgfjiaszknq

qmzplaswfukgxj
lagujfxmdokzwsqp
gwlqkfsmxnjuazp

pinzolyk
hxodirpzy
stbjaoqzpimy
dokzyhperuil

eolhkjwbm
ewhbkmljo
leobkjhmw
jhobmekwl
jowbhmkle

zjrup
oneukpjzr
pujrwzy
ruphaizj
pujrz

srzywptla
pstyrazw
szwyrapt
tyaszprw

gjzbyd
kjwuydi
yjd

uvebw
ouvbwe
bvweu
ewvub
vbeuw

reiblo
joatibfewdm
phybioue
yvoiqxbre

gnrpwk
gdhbrenap
gnxryp
rnptwg

xgnrhajdmyiocspqvktlbeu
vlsmcjytqaedbigkxnpuhor
ukdypvxjhrtowcqnmzliafsgeb
sxjmtnqyebglprkdchaouvi

evytnpjzfh
nyejhzfvpt
jyazwtvdmnfuphes
tlnpjyfvhze

xgimelbozhtrsucwdnjpqy
mwcyqpnzosrudgjbilthxe
mzrheyquxodcjwpilnstbg

gcadv
gmjc
egno

b
b
b
b
i

hsdxn
lfxmohe

ap
vbu
cyzojmtgrd

rpskiyjmt
mirsjtkyp
iprmkyjst

dxlfprzhqest
ldjyaqorsew
dlrwbosjicqe

qtco
fqct

axdforpgwmnhjiz
ila
lviya

sioxbfd
dfbsxoia
bxisdof
oxwdfbsi

pjgdylotqerzhwmfunxaibk
mfpnkzljiywocurgeqaxth

cvwlxgndpi
vkdjtwafyb
vmswqyud

ufaxtehdc
chsefxakt
thxdaefckw
jxoqecfhtpinav
dxtfmecshag

lmroevtgif
lvbohcnryg
zvrxpodgsjlqa
olvuygrt

lgjokbmwxtys
wjtocksgbmxy
tsbcgkoxywmj
jtcymsgkxwbo

mldeqisr
edrmis
rmsdie
reimsd

apuckbmsyo
uhoybksmf
kbrytsqmu

d
dy
djg
d

zfgxhiou
ghfxziu
xfhugzi
gizuhfx
iuzgxhf

kbwtnusvmclyahqxj
nkfdsbmucalwqoejhtvxy
htjluqsxyanwkcmvb

tfbv
qftm
fzlrt
cktsfi
zft

snrdqy
ydsnrq
syrqnwdg
nydrsq
ayqndrs

q
d
u
d
n

guhxb
bughx
xughb
uhbxg
hxbuyg

gabrmuo
omgrb
mndwfhr

ixkbpemoywcn
emhld
erm
me

wv
vw
vw
vw

dtnbiuyhxecp
rclypijnvxtudm
znyamxplkdsuiwtvgc

hqfb
afqd
fqh
wbfq

yqefgskdlrph
hreglysdqcvfp

ixjdocevurwfspzkgayh
sxeukzhpifoycvjdga
ghscfpkvzauyojeidx
aoyshejvgucxdkzpfi
jyvgekuzicdpaxfhso

hovwxqicp
vaticpfxwlkd
qwrxpivjgce
bixuwmocvqp
xpwcvsim

ildan
lin
nsitl
lnuki
uiln

ckhuslgxfaowbeipqm
idyszgafcvwtokblrxqeunpj

sjkltbwnheoqxzgirfpdcmv
verlgjbstidmckoxznqw
cdswjxemlqayzbovgrnikut

dqhlwxyacsigkvjbzfm
gycalzimwhjdfvkb
wdayflgmizcbvjhk
vbgfimlazwjdkcyh
cvhmawfjgldizbky

gtjp
mhkg
hgk

pzvm
pvmz
zmvp
mvpz

rjltyuqckx
uxrzqtklcsjn
clpbegkurzjqx
qkiujmdfcrxlwhao
rnqculvkjyex

hgasf
vmsh
uhiyzxpn
qvmh

qgivh
jhgv
hgsv

xlbhpizm
pyanmsuvxowqz

ihtefolb
gfhqb
fhgqb

jnqbhfs
fsjqhnp
fjhqns
fjhnsq

ghmwzbq
mhzgbw
wzgmh
mwgrzh
vgwaemcntzh

omqk
mqok

dyjlxicepnuorsqtwh
uhrqiavsydzw
ikuqyrdwahs
hrfyguiswqd

xhsrzgyem
hqyig
cytjigh

noirtzelg
intlegr

hsep
hqes
shqe
rseh

fmucjbpvywogq
dmocyqvufb
mcqbfvoyu

mhbukeptil
lcaupsbntvkx

chqdgx
ltwvmjahyc
zhpkrcb
ucqeikhg
qhgdcozn

a
wifv

abdrfc
arbcf
afxbwcr
fcabr

zquedrsbivnfoatjxphkymgc
bsyurfnmvizxotqcgpkajhe
nxozqyepmjrscgtuhafbikv

a
a
a
a
a

y
u
u

carzk
ckqi
zpncv
dscxbgfymuwlj

kpjnusmvhdq
vqyshkupnd

gotqj
fqe
qkp

hiyonlukctbrgfmz
ctlmgzyiubknorfh
hcouytrkbfmzgnil
nzrhbimgcykotufl
tnbrkomfhgyzcuil

jvufgqpc
jvgpcus
cjgpuv
cjgpunrobvl
gucqvkjp

tz
zt
tnz
tmvnz
btxiez

okgznb
wnhjcuzx

tbaferpgv
gftvneparxb
rgevfbatp

fjwlbpnxycdgrzv
cbtkdryflgwvpanjx
bfvlrwdhzgxjpcny

qokfcbj
qojkb
jqarnkb
qcjkyb

tkgzwopyibxq
kzpwtvio

wnprlkvqomtcgbxsiyz
cdzikrqywolgntsx
sijgxrtnczofuqylwh

jkaqdgpn
wgjnpkdqa

hrja
rha
harz
athdr
huar

jxsyg
xvt

oaqegwtd
jwxgtdvsqoiab
qkwogacfyut
teowqidaxg
owsatiqg

redfl
ldref
ervfld

kirzwbmdqpoe
zdbwmoepqkir
miwzepobdqrk

e
nhf

unisztdlebk
eavxpwjongyf
xmchneqyrp

mxdhq
caxmfui
sbtrkwp
ixmglfzevdu

ofqlipswjuhzrbeanmck
mbjwiunezcfkvsaqxlpr
nedajucswqgpibtylfzmk

ctuiahbxomq
aobumhi
ahgofpwubim
iohuabqm
bkoemhiau

lvfyzcadjusgmkwi
kxygbiwumcjfznsdhae
aujicfdzkgsmwyl
zgcfujlakmiwyds

j
g
v
j

b
gmncbol
bquhd
bzd

yzhosamrnwtixbvdq
isxfljdebnwhrvzaqguocmt
hbikdxznraymsoqwvt
tiqrnxydbszvmwaoh
vqwxsobtinmzdarhk

s
s

gxfqkuir
rsxfqiguk
bqxdgkruimf
ucgaoxfiqkr

fzukydcojvsxw
pqrgztjofchm

ikgwrhtls
rhigkwslt

spgdumjioz
bghmuilods
mugiosd
hsiugolmd

pim
pi
ipgz
pi

wqushefymtxzvgloinrd
rxmdlenqzwhyfgoustvi
vinyzhlumosedqgrwtxf
odqmrnlcxtgezhwyifusv
nrevlhgqmywudtxsfioz

h
h
h
h

pfskclxgveizyaodj
mgavxjsyleckfopzid
xsoijceldpgvyakzf
axopyvsdijcklzfge

zishdmnblckvpqye
pqizehyblmkncsdv
mpceqnvlkszydibh

dwqcreikunghslypv
klndcwrygiepqhvu
ehyqvncdligprkuw
iryeucxgdvlqkwphnz

bpmsutfni
btpfrinm
itbqnfmpkw
nptysfimub

vxcefdhsjugn
sdkyxctbiv

fvqzbjasi
sijazf
fzpsjitan
axzjergfsl
fsztanj

cahes
csa
usac
sac
sxnca

glaonqujdpvkisfmzc
iaevoucwryhxdbgfqtmj

hvmnt
thnvm
mvhnt

qszfwgedt
ljwztmxspdb
thgidzsw
zidsvwt

qstpeabrydm
dpyfmqtrbhaes
bsymtrpeadq

oeaxlb
oxleab

kbxqpcgsvz
klygqsbfpvc
qncbsgkvop
xpdvgkcbsmq
skvgcbqp

zeqmlrosafxtdphjvy
wmdsknibv

fj
j

orhlekyugfwdi
ncptmbsq
zjvxta

incwxtqbrvhpgkje
scbjtrmwkyhoaqivzgu
nhctkvqigjwrbx
tcvwhgdinjfrlkbq

su
rys
su
s

vkgslpnrh
hgv
hvg

nbluwkimxvpzcts
mpbnwvkslxtizu
xbmvtkwipulzsn

stovbrhdje
iftbzxdoresy
rbodztse

cjhszen
hrfwuqs
nshjcem
hjdvtis

vpayjhmsbqr
qjayprbhvmw
soajyphqmbrv
hyjaprgqvmbi

zcrolfeun
bd
xtbg
kqjm
tq

pzk
pkc
tkpx
psjqfk

kf
kf

sflknxj
kjnflsx
sflxknjm

xpjfwelovgack
jawelcvoxgkp
jvgkxpolaecwf
cxgopvlwkeatjh

dqueipokaltc
mdgaiqtuwopcjef

rovdesw
gdervwxsb
dmwtzvser
vxeodrsw

vrogjlicfawzsp
cizjgsvpowfr
pcnjszwgfvior
fipzcswgrumvoj
rgzivfsjcpow

ivczsybaumfw
ycubmfsaknivz
fiuorsjaxbedmqvzpc

bhrtmsjvycugo
qtcmuzvijgwo
imjcvugot
ktcfjvumangdqo

j
j
j
j

za
pz
z
bsfz
dz

hmwonxvap
hblkxipg

akxnubovgqrmethsljfyzp
bujrpkaqxlvchnseyogz

qlczeuwabjhvrio
xpequraivwlybo

pxwikfabnchuetglysjzdoq
lvhfqyetwcsjkxbonzirdgpau

e
e
e

klrbyvuftpcz
cuyrkahfwzp
pmuycksizhfr

kwlvo
wepmktxisjy

k
k
k
k
k

dhgnwrvpek
ajwtz

yacvhuemrtfsxlq
lfthcxqevusmrya
ruelsatcymxqhfv

th
th
th
th

yqjr
vryjq
jqyr
jyrq
jrqy

tahgsc
gzmk

zpvcrxbsmih
rhizxpcvsm
ixmtcvoprzh
pzivhxrcm

rbqduhsvnfzk
rxlbkygnafv
funwbhqvpkmrs

sjadyxvrqhobnpc
kdmnulszox
mogwxsdn
tunesidoxw

ahvsedrqbknimuopyxgtzjlfwc
dwfbjaycghexmvruzqospntilk
kogcduhfjqytpzxmnrabwviles

bsyfzeqhtj
wisxmcuvfedrhqpogk
fhqbnsae

hdvbnclafkeomi
ivodaekhfbln
flknidhavoeb

xcmwfapzdbykel
pymawczdxbfkel
dxleyzkbawcmfp

fkurqjcy
jefpyqncus
iqfuyejc

obtxlcksuwpga
riyemjnqvhb

zqwjpkuhb
pwkbhuqz
bkzhquwp
hwezktbuqpd

id
ifd

dscfkeqygmwbjh
jbchemdywgszkq
qobtdmgkysecnjhw
esnbwdjgcrqmtkzhy

q
m
j
j
f

njrpisbwzadqmxoehtufv
hdguestbnmcoywvjriqzkalpf

lrsonbymx
lyrnobfs
bkrslnyo

vgcodqenikzuxaw
qvdiofcg
viqolcdg
igcoqvd

fjbiwxasygutmpekhzo
ospmijwbheyxfzatkuq
cxbofehvjtpkduiarnmwzys
owihxpbufjzealgktmsy

tj
thj
tjd
jt

qtdujcnxvwzb
vtujndzxbqc

msg
sqmg
gms

webhxajqyodtkrfi
hqyoferxiskdjt
rdeuxzkqcgoyjfhti

lchkxdoaistu
icgurhxadjtlw
lpbvxhudiaoftmc
tibdlxacuh

dk
qdk
dk

cirlxzasbewtqhu
uwhbtrlisezxqac
btxuahselcrqizw
lestuhzqixwbacr

vuagosxhlwknqf
faxqjohiskg
ifoxakgqjhs
kjaohgsxfq

uzqweghvcyaxdjr
vuxcezfhakwrnjd

jmvkqrpwncthyedzf
prjctvmdhnzwyeqb
diwqtyarjvcphomez

zvjdrt
jerd
gudrnjyi
jrupdy
nxdrj

rfqchv
qvrbcw

yavdkqfgblmnrjzt
mzkrbldqfanvxygtj
qftbkalnjgzrvdym

vjcymkrxfoze
jqaryxft
xfwjsary
jtxyrngawlf

isxcbhg
ghisxbc
beihvxcgs
hcixsbg

redhcn
erchmd
crndhe

d
l
d

rywl
x
x
xb

psamodnt

chlouyspebfgqwtrzx
bepoqlszhyctgwfxru
oxbhqpcsuyfwtgrlez
uzycspwhqxrefltbago

plh
plhy
phl
hprl
hpl

expoilumtaqswbvfr
ogtqpvfixejukrm

ta
tawz
cazjtu
tan
hoxtvdla

pvnzmau
qapbztn

ujtlbmiyfzndcar
dzmynrltbfjiauhc
drmfzubayljitnc
bzymcanlirftujd

jrxnuhiowaqpte
xroapikqhwuetnyj
ajwxtuirphqeon
hqspnwutojeraxi
juaetrqihwnpox

yiefhrjqzvdmtxsc
xevqhfwnidcrztsj

onix
qxoni
nixo
noix

ognwrdsblz
szndwrogbl
ornsldbwzg
orzgdlsbwn
bsrwglzdno

wofyhk
udplqarzvctji

rqxozpsaibntmej
ojrbqtdycapex

fvxkbh
ypvukbjtxolds
kvemnbx
vnaxbk
vbmkxh

varjgoetfybz
bkzawthr
btznraxd

l
l

mjcgqfxwb
bksjgf
peuvglyfbt
jfgrib

xfz
fsxozi
uxsfz
ftkxzdl
azexbcvf

dhxajrmfnbswpzogevkqt
celtbzqdwshfoarkpgmxjnvi
zedsbhjptfrwovnkqxagm

mxspckqzbnljdg
temluosvpzrqajwyihfb

bpxyihds
sbvydxl
xysdb
bxyds

eads
fbo
eti
kq
vkea

djmtozaelq
fajweltko
aojlted
hlparcjtevon

rbyq
zb
b

qxtvmfg
gfnmov

xspvygam
axmegpvfjs
xglawvus
vxrdsibztaqnohg
gavkysx

x
x
vx

xhb
oazjhgti

ldneqv
dqenv
nqved

gupdfahosmeqwvnxcyjktzri
hmxuazkrwogtnvfedisqjyp
kixtsgbfdryhnowazquemvpj

zuikhyslpf
abpyshfizj

dqtwlxhcyoarfksgiz
pirkqdlzhwtxgsc
uzgrkqlechtxdnswvi

kizowal
owikal
oixkla
oiaklw
qtsiguhcopbralfk

luzhpkn
kluzpnh
pulhnzk
znphluk

bdnxlirpvf
jirxzdlpnfb
kniydgxpzfblr
mprdelfixnb
uirbfndxoqpcyl

frsu
rusf
rusfzv
srfu

pyzsgecva
ykpwvczgsae
gfjdsloeaycpvzbu
yczgavespnq

ktlpuiwrnx
ripwulnkxb
rkulinpwx
iuxlrjkngpw
neuipklwxr

sradxf
adxrs
sxard

bjnohgcvr
zfpkhbvcg
psgdcrtvhb
eabyiqvughx

kxhwus
wivusgfxlkhp
hsakzuxw
khswxu

f
f
fs
f

padbnywfuscoqjztxveh
acxiwvhnsztpdoebqjrufk

wupafhjl
hjuapiwlf
ujlhfapw
lfjnwuehopa
pwhualjf

zgrqmnldp
auxc
kfiejas
vyj
ioxf

v
z
z
z

s
ob
r
p
p

luenpwhqmixfdycbjzo
nhqpcjkfdlibewzoyxum
ypcowmbjxehdquklzfin
ibhocfeulzkdjpwnmqxy
bglmdjynwoiuqxtapzchrvfe

p
p

w
w
w

xfziauswmvlcyphejbr
waikrhpxyelfbuzjgcs
izlpysmfcvhxbjewua
kechslajfnpdzuiwmyxb
citspjxauolqwyehfzb

wfheyikgasxdrtbuv
moadrubycxlkqgnf

k
k
k
k

cxefwranqjugbdvhmztolk
wloerzghqubjtkvmcf
zuwtbjerghlfmvockq
lwqoktrvuecmhzfbjg
gkcwovqfelzutribmhj

veqilrtfyougsh
ftgeryquhlos
vrthgulyesfqpo
fgyqcesrotdhlu

lcg
g
g
g

dwisnxaofuhptm
wtfmxhiodasnpu
txipsonhmdfwau
xuhrqtfiaswnodpm

pcjarklxt
taclwxjdyq
nmslcjtavz

qmxck
mxkc
xmtck
kcmx
xijfrwcomnvbk

nkldcwg
wkdulnxjgv
dngwkc
gwdonpqkbm

pwshd
pirbsjx
lwmynstfp

kczlxgrejo
gzcklromxje
vzojblxkegicr

bnomczytil
lcnyotmzib
wcyzbnmotli

ylufxhtgoes
cjxkvb

lqemdrysaivht
zqtvhedriymsxla
stdlhgrevyimaq
vaqthedrlsiym
dyvstihqlajrem

myfpnvcadqkbxiotzlrsgu
bcldgstvqnzxfkiouyrmp
gpxmincbluqdvrtzoyfskj
qnyrszmkbdfcvptxoguli
rgiupovtbcsykdlnzxfqm

ldmk
dmlk
ldkm
dkml
mkld

ej
je
ej
je
ej

qkxgnbc
kpaxn
sxnyfk
xnfak

tyndxmviuse
kqcyublzjg
lojbhcuy

neblxiuvkfzhqato
nhxetzifvuaklqbo
kqonilteuxvbzfha
quixlofzehnbvtdka

fzcihlrpsdjnw
hfsjmvzcrlntpud
enshlxkrzdjcfp

jugohqf
jguqhof

wjcmkpvarxbgeu
rwcbkvmxpgeja
votgrwcxbhmjekza
kjnmgsewacbvrx

jdrwzfkoylhcpi
twyjfplhrkduizo
hznyfioapldtwjrk
drjkwoazhfnielyp

lhspwojdmg
pldwgosht
howgzsldp

cpwdrhijgvslafzbxonu
fponlcwbsvg
cogbpnvlfswe

euyd
eyud
tdxvyehkuimboawj

ryapequ
ceypdrqwbu

hwljoxctrvqmbe
jwxevkbthqclg
blafpsvdtxhecu

mqilcgjhxfoeywpb
itelobympfqxjg
oyexftibpjmglq

xdwmaqpiksb
onijacqwb
lzeqfhrtv

wuoy
owy
owy
oyw
wyo

haroqjtfwklcpv
ynwiramueojpfc

v
v

xtpqcbsjineougwrf
xjkbyrzscfguhtqn
bugjrtdhanmfqxscl

migthyklesbxofcn
ahgujbtknprewmczifl

sivaghdjkozrltucfneqxbmywp
xtenwkripmygzsbuhvdofclj

ivchktemys
itehvpymws
tnrvesymdix

pglbhwceodjquafiksn
qhdlgpoacwknufbjes

bxtzeoikah
lduqfcz
pzcudmwyv
szd

awmjrsxk
ajwxrmks
whrqkamjs

zkmvthagdb
fapxlozdi
caroenzduxsyq

so
p
no
n
abrf

wf
wk
akw

nirkchlegpjdwufzaqy
rgjukynqcipaezlhwd
yuqwdernaljkpizchg

jtvq
qm
q
q

ovarqt
anx

lxzeuicjbmvaq
vixcmagqbjzuel
xlrzuatecivjbmq
qjxvblzemicua
xejizagcqbumvl

fxtnyehakqv
yiugswbovjdrpm

po
p
gdp

vboc
bacg
bcvol
xbecp
bcv

kblpg
bklgp
bpmglk

jqlgxofivabcue
uiagobjlfexq
geulaibojqfx
iquogfabxlje
ouafxljhqtibge

jrupzdlhixcbnkte
inchptudjzxelrk
dhiegazkptvqxmrucnj
