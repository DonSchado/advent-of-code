

input = DATA.read.chomp.split("\n")

tree = input.each_with_object({}) do |line, memo|
  if line.include?('->')
    parent, children = line.delete('()0123456789').split('->').map(&:strip)
    children.split(', ').each { |child| memo[child] = parent }
  end
end

# part 1
puts 'What is the name of the bottom program?'
puts (tree.values - tree.keys).uniq.first

# part 2



__END__
dihjv (2158) -> gausx, ncdmp, hozgrub
qhvca (428) -> odttvb, ymehff, ymyzbqc, jtdtmsi, wciuyuh
kuvqhnm (77)
eauol (56)
nwtkz (304) -> eykks, rxivjye
kmyvaog (440) -> jrvona, cdoyc, vgbwb, lbttqhl, qizznfs, bftdz, xqhvz
dcqofo (74)
qnhthgm (63)
fgkok (189) -> vjgjzbc, vjfllmr, drbqty
tvfwp (74)
jtwqgg (28)
igogak (57)
edaidjk (60)
jxhqld (75)
jbhxihl (79)
fbrdpr (28)
yjtudlp (60)
wgbdxsx (98)
ecpuvq (84)
emzlv (5)
isahru (26)
oamyk (69)
xxxcdbv (29)
rogwn (357)
jpovtel (31)
gkvko (24)
aqlfh (87)
cbvzgp (24) -> weotr, pgofcu, czswzal
vaqxfkm (43)
fwraw (64)
rqtlp (13) -> tmoib, pidha, yaqiuq, zprfu, ssjau, duhaz, qzaecfk
qisdg (15)
oryhdxc (12)
lywem (78)
ulrqrc (38)
sszuwps (86)
qanswmb (89)
keubv (101) -> yhfkwn, toqhzbx, rokeyia, vpspcd
lkpdlq (36)
ddvbfi (75)
nsfjyfr (79) -> pavvcsj, thidj, yvjkb, udkcxo, zehou
yorihlo (5983) -> eihhef, iayesbs, nduld, darnez
xfkhu (208) -> izjecb, edqurgi
onnmq (24)
zmbxthx (2453) -> tfjhcnn, uifjku, kgtcv
turomx (35)
pgofcu (82)
yveziks (55)
cbmcpho (20)
cosmq (70)
xvnqny (3179) -> dpmqmbp, pddgbo, mszglrh
juqsjg (47)
zfhup (56)
agvvr (45)
pkdqgo (84)
yupciox (47)
wplhnmi (689) -> qnmiv, esemf, qiftt
qujsvg (58)
bdnqwvw (10384) -> mqyvpvw, kfaib, rpgxh, kjudskk, gknpczm, mtukvee, xwbzev
lfjwzpr (80)
rpdiks (56)
kveyw (87)
eiwvcil (276) -> kmquncz, bsqltzs
lflpbjx (28)
nnoiyn (218) -> qthns, nhpvo
togvh (177) -> qcsal, totymbv, wdrdfsy
fmpkks (88) -> kbseli, tukvj, hygejev
hoocyf (77)
bbhffib (11) -> orrno, uaeuig, yjicxmr, yhmqg
bjaferd (58)
pjsevmq (112) -> sxnfkj, jyaztbk
zsksm (26) -> nghpciz, pboxau, nykhzm, edteba, bbhffib
mngpa (189) -> wevea, cjkpmpb
clqlpi (96) -> jgvmp, ikfnuu, dqfeapy
uppsb (10)
thafg (61)
dgmbzo (157) -> sjitmwi, krmoek
xtcoefd (13)
vnlbdhq (75)
rfowcu (46)
znpcapb (13)
gnrgy (839) -> zuqew, prnpyu, payeaey, mxiqn, qmkod, rgovzj
glmvo (1473) -> slilxt, fikmr
kiwzzsi (26)
lqrleq (114) -> xljwrd, lrymzqx, kszzcjg, ajxjsi
xdvxnd (82) -> alxuwj, ynfamq, oymcuyi, iesan, urqvtwz
oyort (96)
nmzkhig (11) -> jponcak, vyyvfme, amzzkz
cwgspa (10)
fahjx (47)
hckss (31)
eflhrzc (210) -> jnswdp, hrhky
gzgmcg (53)
ctvqg (32)
hmaslr (146) -> bvyiw, qeeyslp
xsxpz (46)
ztdib (46)
xhsokp (60)
gtadjbm (86)
qrrzkla (54)
zsmex (16)
wmiuyq (55)
mqovh (297)
tfejm (26)
hozgrub (96)
plgyftr (130) -> daomuol, lynvr
fjbxbui (57)
rnxpn (84)
jrrcr (22)
dxujggm (73)
gnows (81)
ilziw (54)
drbqty (15)
bgfjxde (292) -> cwgspa, uppsb
omcvezl (74)
cejrzz (88)
zbrant (83)
rxnyoaf (59)
vbobjo (98)
ofydl (110) -> ssmijv, uxytt
uwweklj (20)
iodjrt (60)
wdaxi (67) -> jxhqld, xxtds, udeyv
jivcmug (241)
rgovzj (147) -> cdmqq, iwvgsqj
gsspm (506) -> wakslhh, wjjov, fwjvl
cssxuh (85)
bdbhdz (22)
kjsimg (45)
mfaiso (99)
pzgihig (152) -> lggutbs, qrrzkla
xzrts (87)
alxuwj (241) -> sguelmy, wwibd
socdh (28)
tnezwo (65)
tonetb (74)
budlgt (226) -> edmdyyf, oulbft
wgkylta (318) -> tozgnf, nybvxpl
sddte (99) -> ywgsoss, pjgpn, unzqb
ijlnjse (45)
knkect (83)
nftvm (40) -> hepgwl, xsnvuhk, awuntf
nhpvo (56)
khfehu (76)
slnoou (74)
qkmsfo (220)
wciuyuh (184) -> waand, zutluof
prnpyu (29) -> pkdqgo, gprqd
illog (99)
pxijfx (35)
alcjel (83)
owjae (264) -> jxawhq, mgxmj
xsjmrv (178) -> husfjac, zsmex
kgjnta (24)
bfmatc (6)
whnmg (1178) -> fajwz, fjbxbui
ulsjdhh (44)
todve (10)
mgomqm (35)
okvspp (63)
kgtcv (41) -> mhbvu, wycrhq
vzyknp (26)
agmrdd (49)
ilqgy (57)
lhomu (99)
ixknb (57)
gffatn (656) -> rogwn, ralyx, xhnem
rbgidcj (1416) -> bgczgya, xgbxcgw, shzcz, qonlajs, naxbp
ikamn (24)
qzaecfk (253) -> ctvqg, yunmx
gknpczm (155) -> eiukshg, bomwsw, zsuhred
kulazu (78)
jgvmp (78)
wxhex (24)
tvdihgf (85)
xwbzev (254)
ankqb (83)
zehou (270)
yehoudc (237) -> tdvdbhx, rlzldzq, cchwxl
gvktxip (74)
kwbbdg (9)
fnuem (788) -> sgxaa, wkqbmut, wkqtgn
xljwrd (20)
xsnvuhk (90) -> ibjay, tonetb, uowuztv, hdvwu
pidha (77) -> iodjrt, wltkgyg, nipcsis, yjtudlp
gausx (96)
cbtfaaq (140) -> ochqzjy, oogoc
onurc (93)
oahfm (823) -> gxzkef, zujfczp, tmakc
jujcekp (87)
ochqzjy (32)
wvihi (36) -> rhdngzm, udeckgc, aooskui
eosnpun (42)
vnivx (24)
iziyeah (53)
wrrjvv (138) -> kktnr, nduasyx
rncwlve (45)
ohvsnc (16)
kuwksy (81)
epmklw (24)
bnhmicm (49)
kamhkoi (154) -> bndye, wjxgvh
sqvgekz (156) -> ogelzn, smueqkc
fikmr (87)
nipcsis (60)
fevoc (49)
itihxls (53)
hygejev (63)
xuwzr (289)
zzbpjiq (80)
aakqco (77)
mhtrp (80)
ftwjsi (5)
slilxt (87)
bgqxrj (98)
gpaljor (160) -> kuzskeg, qloih
vmrfkpj (97)
extedk (63)
wlswfp (38)
fphae (82) -> yhjmn, ylkotm, zmfcp
jlxseu (12)
waaszgs (95)
cdoyc (208) -> ikamn, ywfwlug
xqlcwdq (82)
iqsxq (61)
iegfxt (84)
lnbkylg (58)
qcsal (55)
onyvo (98)
hrfldlv (61)
pqccx (49)
zkpvqfo (24)
svpplpy (364) -> znpcapb, ervfo
ksbkavj (145) -> cypwd, rxnlgc
ucuojn (95)
fmszt (23)
sqoqld (5)
ymtwg (89) -> oqhdqg, qwfzkh, qrbhvs, phkvd, ytkgrpj, ylfkshq, drwjl
nxwsaq (59)
skcbz (98)
ygnrm (40)
asfjop (15)
doqmfx (152) -> ahsdq, gnows
jfrda (3994) -> lnpuarm, oahfm, nsfjyfr
kssoys (63)
syqthpz (70) -> zyfrk, nhlvwm, lfjwzpr, zzbpjiq
pxbyvn (98)
goulcd (164) -> wdngppj, vmrfkpj
keeet (281) -> wdpyn, hqyej
pscda (342)
edqurgi (91)
phkvd (37) -> vmbhr, zppzac, euaulyx, cabffwx
cpvefk (15)
jyyeena (51)
naxbp (17) -> ofgvb, ytvmvhy
cabffwx (71)
pvnch (61)
omvoojd (20)
edteba (305) -> qjdbq, yupciox
gkmrz (29)
qwfzkh (321)
eatpn (88)
ptfev (215) -> iemffhw, snzqh
kuzskeg (30)
acvbzia (390)
zbuqlk (52)
icbztci (67)
awebzjn (46)
hxwrnx (7)
yvjkb (9) -> pttqho, jujcekp, sabsqv
qdrqm (182) -> cssxuh, lpfrtfw
pynygd (99)
tthcan (67)
vzlomr (127) -> rztel, fscztrk
hljxim (70)
wputsbp (91) -> zdrfc, iqsxq
qsqxc (69)
jzztae (158) -> wqrxb, yjqyh
qloih (30)
nsmsgmk (93)
awuntf (276) -> kunyye, yveziks
ibjay (74)
ssszfaj (24)
wildi (97)
kunyye (55)
hvporje (17) -> xfuimef, pscda, pklufv, vejgx, togvh
ekcfvm (58)
wkqtgn (96) -> brqztvl, rbjzgxt, jciigs
dqfeapy (78)
gsjkku (24)
uxytt (92)
qnrlrm (57)
gvtcjha (98)
kygnpb (75)
yjqyh (78)
pixawh (64)
xwwdp (53)
yjijem (124) -> jyyeena, frpagb
uihqn (52)
hdvwu (74)
sijptix (87) -> ojatorf, wxlxyq, lkfttr, xfesea, ytatg, keeet, ghycpf
nzylp (26)
zcoqx (164) -> xxykvzq, slnoou
vlrgx (88) -> bmntp, eatpn, yvoyt
hqwqd (97)
ybsouxh (24)
wurmarr (46)
bmejz (97)
rfmtzl (9)
lclhy (36)
qyharq (92)
ixtmdxo (24)
nlrtoa (57)
bnqinhv (440) -> hgwpks, wputsbp, mngpa, dasoy
gndaa (12)
syzkg (1697) -> qzdatks, buekex
wevea (12)
bcefufj (22)
larhlj (152) -> tidour, qfxuh
npvrbd (896) -> fmpkks, vpmnutl, uvsgv
pjgpn (65)
mzjypeq (90) -> ihhmv, jckrdlz, kylpt
lfkfd (97)
wysgri (142) -> gnutx, vbqxz
zqhans (87)
lqsdtq (43)
zutluof (6)
wqxbp (34139) -> bdnqwvw, bdlqru, ysgrizu
mrdoeb (87)
xuprtp (93)
vgbwb (130) -> wesqml, ssinas
zoibb (46) -> ctosb, pskrkrn
qmoxv (42)
bdfns (29)
qqokzne (954) -> jscxo, fhcrsce, jscvn, amheqov, wvihi, wsxkjcu
mxiqn (107) -> kjsimg, agvvr
klyfish (1069) -> xxeoneh, kibotum, hmaslr, zuywf
lzjvenf (21) -> tjfib, jgjgxgb, ibyqrv
yeomv (42)
qdyjn (78)
kdvzyz (6)
ncdmp (96)
hdkeesr (56)
dcbquim (48)
ksjmqsc (529) -> oakpkr, ndsbbnm, fphae, extnd
sczsl (64)
akvfgdi (57)
njldiph (83)
dasoy (155) -> qppyecj, gkmrz
jlhdq (52)
ltwrzdl (16)
fenxwbi (42)
vhnpij (78)
frpagb (51)
hqxulc (5)
tretx (11)
jorvuw (83)
vwyrjd (31)
zpanms (59)
qjdbq (47)
qagqi (83) -> xqlcwdq, ezbdihm
nydgtu (73)
bndye (39)
wlnpbx (83)
vbqxz (85)
levsigy (43)
cdmqq (25)
ekrwiea (91)
rxnlgc (14)
mtflqcm (68)
kylpt (72)
arwyg (238) -> ngsgolg, qephec
gprqd (84)
qawlwzi (45782) -> jfrda, jwebvqn, ujwqlf
qjqqkjo (300) -> vwyrjd, ocddu
azjdyr (89)
xjgoko (622) -> larhlj, lrvaz, memnafg
thidj (116) -> xzllgwq, vcfxh
sguelmy (36)
tjfib (59)
rdnxsro (84)
sdvzbk (262) -> atvztnt, zkpvqfo, gavzpv, rjmjlq
ssvcrjn (26)
rilzcsz (186) -> epmklw, sczuqy
hkosdxh (79)
iodtwit (30)
lvlux (92)
udkcxo (84) -> xuprtp, simsfkz
acatw (69) -> tlpzsi, hakss, naiivve, pphbkn
tflqwyl (51)
zjlckg (9455) -> jvjdgph, sijptix, zmbxthx
adqqjrz (81) -> ebjind, odhurs
yceabkj (46)
tomfuoi (6)
vejgx (272) -> lzvpll, pxijfx
qmpazxn (37)
pskrkrn (90)
eigivg (43)
cvioak (68) -> qnhthgm, wboesxc
dwfxj (76)
kjudskk (206) -> vostn, ixtmdxo
xltuf (66)
rnjyw (55)
uowuztv (74)
zkmhy (220) -> rnjyw, tbswgx
cfxrv (83)
hrbse (124) -> lnwyra, xuzfgha
urqvtwz (81) -> qcayjn, lnbkylg, yfrcx, bjaferd
lzvpll (35)
dngizd (81)
sjitmwi (55)
tqruh (31)
tukvj (63)
mvncpt (21)
hzfarz (51)
ujqoks (20)
wezrgqw (210)
hopsivz (387) -> tufywu, zhmevu
cacfqur (9)
udeckgc (59)
lkimdg (10)
nulkw (61)
porcbbb (227) -> midrlp, cacfqur
lmjpuv (296) -> kxaxt, fahjx
wimpns (22)
oymcuyi (280) -> tretx, njarebf, svezft
qfxuh (20)
fxjkoqn (202) -> fwraw, pixawh
vcfxh (77)
jtdtmsi (90) -> gzgmcg, nrkdwvs
vkuusw (92)
apjkf (22)
ovdogi (165) -> shepkcs, npxgl, wxyrdp
ewbuve (88)
dqxfl (90)
xnmtop (83) -> ckugbl, yeomv, fyktlox
piewts (22)
gcvxpm (64) -> kveyw, kchjfpg, mrdoeb
tufywu (32)
xfesea (243) -> tthcan, wljomq
ysyfwqs (211)
ozdrm (76) -> lclhy, zggsrug, zvhtk, lkpdlq
oqhdqg (201) -> dunqe, fqhdf, ygnrm
gmmxg (29)
rokeyia (27)
gavzpv (24)
mifxlz (171) -> didfetj, rncwlve
cqjoftq (63)
fhcrsce (213)
ssjau (253) -> askmldt, kojat
wdsunq (58)
tcqkzp (208) -> udzokmu, lzlvrqk
eimcci (43)
xwxof (55)
spprj (68) -> jorvuw, cfxrv
ivkvrj (81)
xbabgu (155) -> lypml, zxvhoy
osnyi (50)
cdynw (89)
ldswpyl (30) -> jkjnsj, lpxekhm
rdbcued (24)
zunuwi (208) -> iziyeah, wdafwyi
pzjiiy (20)
xqhvz (192) -> liearc, ohvsnc, ltwrzdl, ypyuum
vtzay (74) -> vonbixj, qawlwzi, wqxbp, tcsrpxb, xlieqz, yghqsa, asexwc
ralyx (357)
rlpvqn (9)
yjngab (1573) -> yiigm, kntzn, rilzcsz, eqoick
vtnex (28)
ctosb (90)
zmicnlj (76)
hbcjzma (149) -> bbmvgyu, rxnyoaf
lmekort (6)
jkjnsj (87)
pyjymxj (59)
pjczjl (20)
wxmwf (29)
othvtfq (49)
atvztnt (24)
ehzatio (57)
ekdczsz (63)
njarebf (11)
qsjhc (59)
ridrtgx (9)
kamrqhv (57)
wgjbas (15)
ldtbli (78)
cniapi (15)
ulssbyo (62)
ashohg (12)
mtkliz (96) -> bxkicdp, pmlzll, ycqghs
extnd (178) -> piewts, rpiyqq, bdbhdz
wvdnc (77)
iyalpvz (13) -> uohcpp, xcyfp, ypbgol
smkeec (87)
ezbdihm (82)
amheqov (177) -> isnebf, rlpvqn, bllths, rfmtzl
bmqggm (108) -> hkamx, extedk
ajnnoo (99) -> ywpmdg, drsvx
wgwucvi (26)
xbwbjfa (46)
omlxdye (56) -> tdstj, gnktgh
esbswlu (246) -> kuvqhnm, aakqco
wljomq (67)
yowef (55) -> umhji, ucpgr, dpimy, nwxad
qzdatks (15)
ncuksjv (84) -> plcqel, mtflqcm
mrssfl (26)
uqjnlv (122) -> rqtgag, awebzjn, wurmarr, osbdc
xxykvzq (74)
ynfamq (187) -> fenxwbi, eosnpun, kybtr
jscxo (99) -> dathq, ixknb
ohpeic (695) -> cbvzgp, mjrxbh, aaibd
bnuozu (107) -> rstvy, kovebn, zwsjm
kxaxt (47)
rztel (62)
xubkl (102) -> bhzgqav, wftxaby
owsebz (26)
glqezpx (245) -> omvoojd, pzjiiy, oiuppwr
ssmijv (92)
mgdjgzf (573) -> fnsxlna, qjqqkjo, pgfhmr, tvtxqpd
rnzzm (246) -> uwweklj, ujqoks, cbmcpho
npxgl (13)
lzlvrqk (42)
xgbxcgw (97) -> ashohg, gndaa
ibffwi (21) -> zfxdqi, yxqmz, dvnvwgj, xnhlg
wzmrtpw (40)
lcggft (139) -> qzuyecq, sslulx
vlwmaxi (46)
fnsxlna (110) -> cqjoftq, kssoys, fwyreea, wkgzwhi
zlwnppb (491) -> uqjnlv, huidcr, rnzzm, mzjypeq, inycp
jyaztbk (61)
ipljy (79)
wdpyn (48)
pgfhmr (50) -> kulazu, lgmdhjw, qdyjn, lywem
vjgjzbc (15)
egtscru (9)
plcqel (68)
wbsul (175) -> ynqji, qcbubp
fajwz (57)
bftdz (24) -> fdpjo, ekcfvm, qujsvg, wdsunq
wkhsng (24)
nhrka (23)
njkscdv (10)
vihoep (161) -> qolkd, itihxls
wesqml (63)
xgsbu (19)
iayesbs (2129) -> zhzwir, zoibb, kyvysg
noutnp (202) -> kdvzyz, tomfuoi, bfmatc, lmekort
whnnb (66) -> yceabkj, vlwmaxi, xsxpz
ucpgr (38)
qzuyecq (34)
nwxad (38)
ljmkw (53) -> imdmnn, hkosdxh
vakhjoj (1289) -> reflh, himyfxm, hrbse
mwzhn (75)
otzqal (667) -> qagqi, vpdlxtj, fiilaqx
kktnr (30)
tmoib (303) -> hxwrnx, ukbfn
bkuqfi (8) -> gvtcjha, pxbyvn, miwvcdi, wgbdxsx
ifroqmy (4870) -> ksjmqsc, ohpeic, djomjuh
ghycpf (199) -> azjdyr, qanswmb
fecze (694) -> jzztae, doqmfx, givqy, zfrgif, budlgt, zunuwi
derxp (22)
siyudl (46)
eqcpltg (79)
sslulx (34)
ibvmb (49) -> njldiph, zerai, ankqb
lbnjp (122) -> ojcaeht, sszuwps
vwzfjcq (241)
ytatg (116) -> mldtcbl, jgsgm, aqlfh
tdvdbhx (19)
bomwsw (33)
aonteu (15)
ndsbbnm (76) -> mxdij, nmqoxw, eauol
rpgxh (140) -> eetdzon, igogak
ynqji (40)
obhlzp (56)
jscvn (169) -> twdnswr, bcefufj
empkyy (61)
peopfnu (17) -> etyhx, rpfhcus, yvyttr
wycrhq (25)
isnebf (9)
naiivve (43)
cchwxl (19)
swtbqxz (266)
hbcto (51)
husfjac (16)
uohcpp (63)
yozose (88)
ylfkshq (193) -> sczsl, ibdyuge
ergcql (46)
ebjind (65)
tohprmh (2242) -> tflqwyl, mdjhnv, tamautu, qxxkyr
bqbmy (49)
urbqmk (52)
zdrfc (61)
wwibd (36)
lawgz (35)
lkfttr (320) -> luzwzm, mqebpw, eodubb
ezxlkm (37)
eihhef (1752) -> adqqjrz, ysyfwqs, ljmkw, synynkd, imrqsxa
nduld (1449) -> lgkhn, cikijr, ijmrhsf, cvioak, lqrleq, ifncxs, bnuozu
cdsjzoz (1888) -> yowef, wdsari, lcggft
djxpma (93)
rstvy (29)
yvyttr (1210) -> qslmjtg, wrmovs, ibvmb, xmfrzwa
vnhsudk (60)
qrshe (43)
flovshu (15)
bwgjpdg (97)
bgczgya (107) -> cvgdzag, qdextxi
zfrgif (168) -> dxujggm, nydgtu
vpdlxtj (151) -> wxhex, gsjkku, wkhsng, ssszfaj
kwztfbl (88)
nduasyx (30)
jnswdp (60)
rbjzgxt (24)
cvgdzag (7)
cbxomli (91)
qmkod (57) -> hlauw, mgomqm, pmzvdb, lawgz
weotr (82)
ifncxs (54) -> fglgibd, hljxim
ogelzn (35)
pkdwpbh (15)
mdjhnv (31) -> njkscdv, hincte
hxxupnf (43) -> cjztdo, uvgvi
imrqsxa (115) -> drwlyvx, ybsouxh, xfmyvg, oibng
gnutx (85)
iloykn (81)
heudq (6)
lggutbs (54)
bllths (9)
edmdyyf (44)
wrmovs (132) -> alcjel, knkect
nfwzt (69)
esemf (99) -> iqeqpuv, seruan
omspdwl (245) -> ggmpihl, emzlv, kjyhry
uillw (1744) -> zfswb, wbsul, dumykdj
ijmrhsf (102) -> ztdib, rfowcu
xgllgu (62) -> illog, mfaiso
ofgvb (52)
fscztrk (62)
iwfjou (31)
egqaydx (814) -> ofydl, sddte, nqpyzt, yehoudc, szpoqm, lbnjp
vvemxld (63) -> xoavai, subauko
jkukq (9)
tmakc (44) -> tqxmke, ipljy
veefoj (99)
cmopifq (234) -> zpanms, nxwsaq
jkzwu (70) -> zhphopf, pcljlai, uillw, qamvl, cdsjzoz, yjngab, vqhriyt
xkrxt (81)
fgltnc (22)
wdrbtqg (8) -> wezrgqw, eubxp, wmmmcdw, eealm, xsjmrv
wspzdb (60)
wzcttac (85)
wqlzmvc (87)
ervfo (13)
bxkicdp (57)
seruan (12)
wqocyox (99)
wdafwyi (53)
drsvx (71)
yntroh (82) -> rvakt, hoocyf, fgrvof, ccjmduk
uaeuig (97)
wspnoa (291) -> hqvtn, iodtwit
bhzgqav (18)
ycpxqjz (55)
szpoqm (98) -> qqedfa, qeovb, agmrdd, othvtfq
zxvhoy (85)
waand (6)
brqztvl (24)
jatwhbu (93)
tbswgx (55)
nghpciz (205) -> lfkfd, hqwqd
oulbft (44)
pcljlai (949) -> fxmiw, gmawv, pzgihig, ipqct, xgllgu, omspdwl
ggmpihl (5)
qonlajs (73) -> smuzxf, trxfjv
twijj (54) -> qrmgjdu, avyif, veefoj
owiryv (54)
yhfkwn (27)
eprlek (42)
xlieqz (18992) -> byytwu, yorihlo, vrpupk
geznv (32) -> tvdihgf, fccyl
smueqkc (35)
wdngppj (97)
vzits (78)
bdavc (79)
luzwzm (19)
lrvaz (96) -> qflimon, dcbquim
bvyiw (46)
esvca (90)
nylrq (400)
tezto (34)
qqedfa (49)
nulkvu (29)
xuzfgha (60)
vsivyn (38)
qzhemjq (91) -> cejrzz, yozose
bmntp (88)
pwotv (26)
vonbixj (42470) -> orssb, ewqui, ifroqmy
eleeg (82)
ylpapdi (15)
dpmqmbp (292) -> cmopifq, vlrgx, qdrqm
ciiqis (295) -> cqxfbv, socdh
lnwyra (60)
vyyvfme (35) -> jqomxi, hwljl, onyvo, bvykqm
jxawhq (47)
kntzn (78) -> vhnpij, tqnucz
fvbopgf (302) -> bnhmicm, pqccx
mgxmj (47)
dodbb (53)
smlvcc (1242) -> lzjvenf, plgyftr, wrrjvv, dlrpc, nevkxz
amzzkz (323) -> kiwzzsi, wgwucvi, mdyce, pwotv
jzmezwj (40)
yjicxmr (97)
ssinas (63)
ojcaeht (86)
tfjhcnn (91)
udeyv (75)
rlxoojp (446) -> cbtfaaq, whnnb, srbtea
ymehff (28) -> iegfxt, rdnxsro
wxyrdp (13)
hbncq (91) -> hwvxsq, dqxfl, hhoxisa, fuorh
drlkvy (190) -> nixbq, fqcxo, itggp, egtscru
scmwcz (20)
lpxekhm (87)
nevkxz (138) -> flovshu, iivqj, clikxp, wgjbas
mqyvpvw (254)
tdstj (88)
lyfyg (1272) -> whzdf, qlgbx, pfzcu, swtbqxz
bdejd (93)
tamautu (15) -> jlxseu, oryhdxc, fbedmnf
wdrdfsy (55)
bvtwq (47)
kjyhry (5)
unzqb (65)
jofsg (64) -> mwzhn, oumcdij, vnlbdhq
ouadkun (43)
byytwu (89) -> tohprmh, timjt, ncapjgu, yblxjc, wmhkk, dihjv, yxjeaj
wsxkjcu (97) -> pdkxh, ahklb, bdfns, xxxcdbv
ywthj (79)
ehofuzh (26)
ywpmdg (71)
duhaz (93) -> rpdiks, zfhup, hdkeesr, zsrdtht
mzozh (77) -> hiiqxv, qnrlrm, ehzatio, nlrtoa
hzuprgn (665) -> xnmtop, keubv, yhkrp
ltwvide (890) -> ajnnoo, acatw, qeyzth, jivcmug, aqzbepp, vwzfjcq
hkamx (63)
nrkdwvs (53)
cjkpmpb (12)
ojnmrwc (213) -> xbwbjfa, ergcql
hrhky (60)
xoavai (55)
totymbv (55)
aqzbepp (49) -> peaud, oyort
zsuhred (33)
aooskui (59)
shepkcs (13)
qggwp (87)
tidour (20)
avyif (99)
pdkxh (29)
kybtr (42)
qizznfs (100) -> vykcb, ldtbli
ykxrxbb (19)
liearc (16)
atkpc (43)
oumcdij (75)
knfad (87)
hincte (10)
nfwof (32)
oxwbxc (10)
bgnuk (65)
iivqj (15)
rlzldzq (19)
qolkd (53)
yxhfz (38)
qeeyslp (46)
qrmgjdu (99)
vbtznz (6) -> vovinsx, vkzka, adkvr
etcbg (54) -> eigivg, atkpc, tyzcg, jlhnkk
adkvr (97)
miwvcdi (98)
jwiwydu (667) -> ihgiq, hxxupnf, hlgydhq
kmquncz (57)
vrpupk (9477) -> kktud, egqaydx, fecze
kekabeg (17)
bovla (327) -> arbcqfz, mvncpt, xhypb
omfahxa (99)
gvwkbp (300) -> wxmwf, qiwsut
twgdnl (74)
dumykdj (71) -> lvlux, rebxtnk
zvhtk (36)
pmlzll (57)
fccyl (85)
zfxdqi (76)
fdpjo (58)
lpfrtfw (85)
tcsrpxb (48956) -> peopfnu, rajmc, xvnqny
svezft (11)
vqcjj (22)
nqpyzt (294)
subvci (97)
askmldt (32)
qeyzth (143) -> vlgwzi, bqbmy
zxqrm (232) -> fevoc, kritjfi
umhji (38)
xifubdw (15)
snxbszd (20)
pfzcu (266)
zhphopf (52) -> wspnoa, kaxrm, vmobtbb, ciiqis, threc, ysvmncq, twijj
ysvmncq (173) -> cdynw, kzchhz
paofxz (140) -> hckss, jpovtel
qflimon (48)
vovinsx (97)
qchmzht (79)
wkgzwhi (63)
wxlxyq (272) -> turomx, zpekki, rfbnete
drwlyvx (24)
kfaib (206) -> rdbcued, kgjnta
baovbha (65)
odhurs (65)
rpiyqq (22)
twdnswr (22)
ypbgol (63)
xhpzhpq (292)
ywgsoss (65)
yrepvc (34)
ocddu (31)
zfswb (155) -> osnyi, ofrfo
sxnfkj (61)
tvtxqpd (322) -> lkimdg, yqmse, todve, oxwbxc
qephec (76)
swhlcvm (47)
ahklb (29)
ydibgyz (27)
himyfxm (37) -> qsqxc, retzg, nfwzt
lcfycgg (1529) -> lhomu, omfahxa
zqozw (59)
hwljl (98)
zvlftj (53)
inycp (78) -> dwfxj, rnyyal, ilcoe
lynvr (34)
hhjspt (241) -> jtwqgg, bdjgtz, bynxcni
gkvojlo (87)
xzllgwq (77)
pboxau (399)
oazcn (45)
buekex (15)
odttvb (162) -> kekabeg, momoy
rfedd (74)
ymyzbqc (144) -> vzyknp, mrssfl
ftfvpmy (193) -> klmcwy, xltuf
utqtp (87) -> zqhans, knfad
ktnynk (23)
jlhnkk (43)
jponcak (339) -> ytgxvzv, derxp, cukeme, vqcjj
subauko (55)
bgkst (257) -> pjczjl, scmwcz
uifjku (91)
ujwqlf (46) -> xdvxnd, sbjvkrb, glilvcd, glmvo, eiennk
vjfllmr (15)
nhlvwm (80)
dpslcf (82)
tqnucz (78)
yhmqg (97)
bqqwwcn (1031) -> kamhkoi, omlxdye, ismqdcu
ismqdcu (178) -> lfrwzbb, ydibgyz
rebxtnk (92)
lcpfw (296) -> vrjes, bvtwq
drwjl (265) -> vtnex, qxzjhg
nykhzm (11) -> bmejz, wildi, qoyub, epdfbvu
rvakt (77)
hakss (43)
noqrlh (60)
epdfbvu (97)
iqeqpuv (12)
ywfwlug (24)
weywe (57)
kchjfpg (87)
fbedmnf (12)
uvsgv (237) -> eyotuoe, slhfj
fqcxo (9)
vsfjq (56)
whumv (84)
sczuqy (24)
hqyej (48)
fglidf (9)
yfrcx (58)
ytvmvhy (52)
vykcb (78)
cukeme (22)
pqiqied (93)
cikijr (32) -> xkrxt, zspsh
mtukvee (59) -> baovbha, tnezwo, bgnuk
vlgwzi (49)
wdsari (41) -> wlnpbx, zbrant
shzcz (52) -> ztlsw, ktnynk, fmszt
kaxrm (261) -> oazcn, ijlnjse
eubxp (81) -> vaqxfkm, levsigy, lqsdtq
vmobtbb (237) -> kamrqhv, weywe
zzacgi (90)
oogoc (32)
dlrpc (40) -> jbhxihl, kdjcqk
eealm (88) -> nulkw, pvnch
jciigs (24)
fpezemw (67)
lgkhn (134) -> wzzjnrl, snxbszd, vexft
ldyrkdm (40)
zezecwh (53)
pavvcsj (218) -> ssvcrjn, nzylp
kwelmvo (46) -> siyudl, wxiks
mszglrh (472) -> tcqkzp, xhpzhpq, wdaxi
fmsgmoq (135) -> xgsbu, ykxrxbb
ahsdq (81)
lypml (85)
simsfkz (93)
bdjgtz (28)
aaibd (174) -> vnivx, fcjoefo, gkvko, onnmq
mgihcl (354) -> gwcwh, nhrka
udzokmu (42)
qactli (85)
eqoick (176) -> nulkvu, gmmxg
synynkd (167) -> jrrcr, apjkf
darnez (77) -> syqthpz, lmjpuv, lcpfw, bovla, wgkylta, xfkhu, acvbzia
vrjes (47)
zemwgsa (130) -> isahru, cltdxy, tfejm, obzcog
hlauw (35)
pttqho (87)
zhmevu (32)
mhbvu (25)
autys (32)
qeovb (49)
brhvbt (93)
jrkohk (98)
yiigm (122) -> qqwda, vsfjq
gdfxr (1002) -> jrkohk, bgqxrj
yqmse (10)
bdbzuf (539) -> ztpizq, gbyiobd, vzlomr
toqhzbx (27)
obzcog (26)
whzdf (140) -> vznyiu, eprlek, iovtj
yytai (13)
nwsjspa (18) -> noqrlh, edaidjk
djomjuh (20) -> bgkst, skrnzrc, mqovh, vbtznz, druym
pklufv (152) -> ucuojn, waaszgs
vmbhr (71)
jrvona (88) -> mowgm, whumv
hepgwl (226) -> ufjxj, mhtrp
oakpkr (132) -> obhlzp, qijjq
wopxs (74)
wltkgyg (60)
gnktgh (88)
yhjmn (54)
klmcwy (66)
bbmvgyu (59)
eifws (205) -> bfvol, qmoxv
xinyjeu (44)
bfvol (42)
mowgm (84)
orssb (41) -> lyfyg, ymtwg, ltwvide, zuccp
lnpuarm (918) -> ksbkavj, fmsgmoq, biumgl
bvykqm (98)
xnhlg (76)
mxwdp (81)
jowykql (63)
atnmou (54)
bdlqru (3118) -> gsspm, bdbzuf, whnmg, bnqinhv, hzuprgn, fnuem, nmzkhig
ddcgqm (10) -> smkeec, wqlzmvc, tcifkj, xzrts
gjkplw (85)
gsbypm (52) -> msnnza, drlkvy, etcbg, sqvgekz, noutnp, yjijem
jwebvqn (7762) -> iwudd, fvwwm, vvemxld
eiennk (912) -> porcbbb, bqdtmvh, txoqtpz
mqebpw (19)
ztpizq (65) -> qwwur, xdwcgk, ulssbyo
dunqe (40)
ccjmduk (77)
kzchhz (89)
wkqbmut (34) -> icbztci, fpezemw
txoqtpz (49) -> vbobjo, skcbz
vpmnutl (232) -> cniapi, xifubdw, asfjop
asexwc (93) -> tmclxe, aiuyg, jkzwu, zjlckg
yvoyt (88)
midrlp (9)
qlgbx (98) -> ecpuvq, rnxpn
bvczy (60)
qnmiv (79) -> gxvlomg, wimpns
qthns (56)
kibotum (68) -> gjkplw, wzcttac
nixbq (9)
ckugbl (42)
iveta (147) -> ywthj, oqahna
rnyyal (76)
vostn (24)
fcjoefo (24)
ibyqrv (59)
tcifkj (87)
jgjgxgb (59)
yduyn (40)
jnurmw (860) -> xuwzr, eifws, jofsg
wboesxc (63)
ibdyuge (64)
ypyuum (16)
yxjeaj (1226) -> mzozh, iveta, ojnmrwc, glqezpx
kyvysg (158) -> yrepvc, tezto
clikxp (15)
ojatorf (98) -> nsmsgmk, djxpma, onurc
eetdzon (57)
pqzsukm (40)
fgrvof (77)
iovtj (42)
zsrdtht (56)
wnvzf (37)
czswzal (82)
zmfcp (54)
hgwpks (213)
bqdtmvh (141) -> jlhdq, zbuqlk
qiftt (78) -> pkdwpbh, qisdg, cpvefk
vqhriyt (1903) -> paofxz, iyalpvz, geznv
udptfka (79) -> brhvbt, bdejd, pqiqied, jatwhbu
yxqmz (76)
zerai (83)
kmpjivb (175) -> hrfldlv, empkyy, thafg
kktud (72) -> sdvzbk, ddcgqm, goulcd, kmpjivb, awqjs, owjae, gvwkbp
lrymzqx (20)
fiilaqx (247)
aiuyg (12841) -> xjgoko, gdfxr, nftvm, jwiwydu
kojat (32)
wmmmcdw (36) -> gkvojlo, qggwp
gwcwh (23)
eykks (13)
qwwur (62)
hodlob (312)
iwudd (85) -> ulsjdhh, xinyjeu
wxiks (46)
zuccp (1166) -> zemwgsa, pjsevmq, bmqggm, spprj, fgkok
qppyecj (29)
uvgvi (67)
upmft (70)
ncmenyx (74)
vznyiu (42)
oiuppwr (20)
zujfczp (122) -> yduyn, ldyrkdm
sabsqv (87)
tmclxe (8705) -> rqtlp, kmyvaog, qqokzne, smlvcc
hqvtn (30)
qcayjn (58)
vexft (20)
ihgiq (39) -> oamyk, fhyimvw
qxxkyr (25) -> qmzef, xtcoefd
ycqghs (57)
rajmc (1933) -> rlxoojp, vtgfsqt, wdrbtqg, leytj, wplhnmi
iesan (151) -> owiryv, ilziw, atnmou
qslmjtg (283) -> hqxulc, ftwjsi, sqoqld
rxivjye (13)
qqwda (56)
hhoxisa (90)
yblxjc (2420) -> viqnxm, yytai
rhdngzm (59)
tlpzsi (43)
glilvcd (423) -> bzsupo, ptynfu, ldswpyl, pwaypt, ovdogi, vomul
ptynfu (110) -> swhlcvm, juqsjg
qrbhvs (285) -> ridrtgx, kwbbdg, fglidf, jkukq
hlgydhq (15) -> mxwdp, pwwtnz
ilcoe (76)
imdmnn (79)
gxvlomg (22)
djsyo (43)
bzsupo (32) -> gtadjbm, hmsbly
rjmjlq (24)
yhkrp (165) -> fgltnc, kfqykbd
kszzcjg (20)
gxzkef (116) -> qrshe, djsyo
jvjdgph (1373) -> hopsivz, hbncq, udptfka
wjxgvh (39)
ysgrizu (73) -> jnurmw, hvporje, syzkg, lcfycgg, bqqwwcn, gffatn, npvrbd
jqomxi (98)
vpspcd (27)
rpfhcus (452) -> svpplpy, arwyg, nlzfsx, yntroh, eiwvcil
eodubb (19)
givqy (18) -> tvfwp, rfedd, wopxs, omcvezl
kafnt (15)
ytgxvzv (22)
eyotuoe (20)
zyfrk (80)
bynxcni (28)
kfqykbd (22)
pphbkn (43)
biumgl (97) -> ulrqrc, wlswfp
viqnxm (13)
hwvxsq (90)
pwaypt (102) -> hzfarz, hbcto
lbttqhl (130) -> ekdczsz, jowykql
hmsbly (86)
ewqui (3753) -> gsbypm, enurd, otzqal, qhvca
krmoek (55)
mldtcbl (87)
sezloa (63)
zggsrug (36)
daomuol (34)
nlzfsx (240) -> kygnpb, ddvbfi
cltdxy (26)
oqahna (79)
orrno (97)
fhyimvw (69)
tqxmke (79)
mdyce (26)
zprfu (317)
ytkgrpj (265) -> lflpbjx, fbrdpr
iwvgsqj (25)
yghqsa (56478) -> vakhjoj, klyfish, rbgidcj, zsksm, mgdjgzf, gnrgy, zlwnppb
nedixbk (6)
kbseli (63)
zppzac (71)
sgxaa (64) -> urbqmk, uihqn
pddgbo (13) -> hbcjzma, vihoep, mtkliz, qzhemjq, dgmbzo
memnafg (15) -> zqozw, pyjymxj, qsjhc
mxdij (56)
qxzjhg (28)
xhnem (93) -> wrnejq, ewbuve, kwztfbl
oibng (24)
fxmiw (248) -> heudq, nedixbk
qamvl (949) -> wysgri, wfuwg, bgfjxde, zcoqx, hodlob
cuwpd (77)
itggp (9)
fvwwm (121) -> ehofuzh, owsebz
qijjq (56)
bsqltzs (57)
trxfjv (24)
zuqew (135) -> iwfjou, tqruh
wfuwg (57) -> yscbbtq, qactli, znxntbo
srbtea (204)
cqxfbv (28)
ufjxj (80)
wmhkk (2150) -> gvktxip, ncmenyx, dcqofo, twgdnl
ipqct (108) -> khfehu, zmicnlj
fwjvl (82) -> zzacgi, esvca
didfetj (45)
pmzvdb (35)
izjecb (91)
ztlsw (23)
lgmdhjw (78)
momoy (17)
payeaey (197)
etyhx (92) -> nwtkz, zkmhy, fxjkoqn, zxqrm, eflhrzc, clqlpi, nnoiyn
xcyfp (63)
xxtds (75)
gmawv (104) -> vzits, gvlbzp
qmzef (13)
skrnzrc (103) -> bwgjpdg, subvci
wrnejq (88)
ajxjsi (20)
tyzcg (43)
zuywf (118) -> pqzsukm, wzmrtpw, jzmezwj
huidcr (66) -> vnhsudk, wspzdb, bvczy, xhsokp
vtgfsqt (275) -> ptfev, mifxlz, utqtp
wftxaby (18)
snzqh (23)
ylkotm (54)
smuzxf (24)
wqrxb (78)
nmqoxw (56)
lfrwzbb (27)
hiiqxv (57)
wakslhh (156) -> xwwdp, dodbb
xdwcgk (62)
jgsgm (87)
fuorh (90)
reflh (180) -> nfwof, autys
mjrxbh (194) -> vsivyn, yxhfz
xfmyvg (24)
vomul (6) -> wqocyox, pynygd
qoyub (97)
tozgnf (36)
pwwtnz (81)
sbjvkrb (22) -> gcvxpm, ftfvpmy, xbabgu, ibffwi, hhjspt
druym (60) -> eqcpltg, qchmzht, bdavc
fyktlox (42)
kritjfi (49)
xmfrzwa (187) -> ezxlkm, wnvzf, qmpazxn
dvnvwgj (76)
euaulyx (71)
rqtgag (46)
threc (211) -> cosmq, upmft
dathq (57)
jckrdlz (72)
osbdc (46)
leytj (506) -> ngppbum, kwelmvo, nwsjspa, xubkl
fglgibd (70)
yscbbtq (85)
cjztdo (67)
slhfj (20)
enurd (528) -> gpaljor, ncuksjv, ozdrm, qkmsfo
yunmx (32)
awqjs (204) -> cuwpd, wvdnc
arbcqfz (21)
qdextxi (7)
rfbnete (35)
wzzjnrl (20)
xxeoneh (54) -> vkuusw, qyharq
kovebn (29)
kdjcqk (79)
zpekki (35)
zwsjm (29)
ofrfo (50)
fqhdf (40)
iemffhw (23)
timjt (2360) -> ouadkun, eimcci
nybvxpl (36)
ukbfn (7)
ngsgolg (76)
peaud (96)
ldyke (294) -> zezecwh, zvlftj
qcbubp (40)
gbyiobd (87) -> dpslcf, eleeg
wjjov (97) -> wmiuyq, xwxof, ycpxqjz
xhypb (21)
ncapjgu (46) -> esbswlu, bkuqfi, nylrq, fvbopgf, mgihcl, ldyke
ngppbum (12) -> okvspp, sezloa
dpimy (38)
fwyreea (63)
vkzka (97)
zhzwir (112) -> akvfgdi, ilqgy
znxntbo (85)
xfuimef (18) -> kuwksy, ivkvrj, dngizd, iloykn
msnnza (44) -> cbxomli, ekrwiea
retzg (69)
qiwsut (29)
eiukshg (33)
ikfnuu (78)
zspsh (81)
gvlbzp (78)
yaqiuq (272) -> aonteu, kafnt, ylpapdi
cypwd (14)
ihhmv (72)
