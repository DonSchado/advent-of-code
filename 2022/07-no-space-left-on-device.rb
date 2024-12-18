terminal_history = DATA.read.split("\n")

CMD_PATTERN = /\A\$\s(?<name>cd|ls)\s?(?<argument>.+)?/

def parse(history, directories = [], total_sizes = Hash.new(0))
  history.each do |line|
    if (command = line.match(CMD_PATTERN)&.named_captures)
      case command['name']
      when 'ls' then next
      when 'cd'
        if command['argument'] == '..'
          directories.pop
        else
          directories << command['argument']
        end
      end
    else
      directories.each_index do |path_size|
        total_sizes[directories[..path_size].join('/')] += line.to_i
      end
    end
  end

  total_sizes
end

file_system = parse(terminal_history)

puts 'Find all of the directories with a total size of at most 100000'
p part_1: file_system.select { |dir, size| size <= 100_000 }.values.sum
# => 1908462

# Find the smallest directory that, if deleted,
# would free up enough space on the filesystem to run the update.
DISK_SPACE  = 70_000_000
UPDATE_SIZE = 30_000_000
AVAILABLE   = DISK_SPACE - file_system['/']

p part_2: file_system.values.sort.find { |size| AVAILABLE + size >= UPDATE_SIZE }
# => 3979145


__END__
$ cd /
$ ls
dir dtcfhsm
dir hblzj
dir jbssdwf
35442 jrfpjdpw.znd
dir ljv
dir nhp
31592 qtwnndbg.rsh
326062 sjc.mvn
235205 wmtvbq
$ cd dtcfhsm
$ ls
206818 czgnjmw
dir drjhjtm
dir hjlmf
dir jllhmmf
187778 jrfpjdpw.znd
49334 lljh.jhb
dir qtwnndbg
dir sshvc
dir tzhbztd
290622 vmwddb
214581 wmtvbq
dir wqcsrw
dir zjbzdrnd
$ cd drjhjtm
$ ls
dir cvrf
dir gddqh
dir qccmn
dir qjgv
dir sjgwv
$ cd cvrf
$ ls
233913 frfvjtt.dhv
30000 ljcmscc.jvh
61418 mcs.blh
227397 swd.mrf
dir tpwvvbh
120888 vsrfw.gvd
$ cd tpwvvbh
$ ls
266824 qtwnndbg
dir sdwjz
dir vrgjhvrd
88616 wmtvbq
dir wqcsrw
$ cd sdwjz
$ ls
269696 jrfpjdpw.znd
$ cd ..
$ cd vrgjhvrd
$ ls
67409 sddmdd.dsb
$ cd ..
$ cd wqcsrw
$ ls
dir ttgwphbc
$ cd ttgwphbc
$ ls
178435 csjzz.vcd
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd gddqh
$ ls
dir cfvpq
318413 jrfpjdpw.znd
dir wwv
$ cd cfvpq
$ ls
dir ljncp
175740 ljv.nqn
$ cd ljncp
$ ls
146594 rhjlds.nfm
$ cd ..
$ cd ..
$ cd wwv
$ ls
dir zqzch
$ cd zqzch
$ ls
dir jllhmmf
$ cd jllhmmf
$ ls
dir pvqhg
$ cd pvqhg
$ ls
76789 ntdtbnr
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd qccmn
$ ls
dir czpnrsfc
123617 jrcgldd.pvd
$ cd czpnrsfc
$ ls
316779 lqtw.vtp
dir tdwmpl
$ cd tdwmpl
$ ls
84395 rvqgwwz.rbq
$ cd ..
$ cd ..
$ cd ..
$ cd qjgv
$ ls
173535 qtwnndbg.clf
73941 wldfq.rjm
327245 zfqsvs.qwh
$ cd ..
$ cd sjgwv
$ ls
307757 mvgmfhh.thn
$ cd ..
$ cd ..
$ cd hjlmf
$ ls
313069 qlmlvvvg
$ cd ..
$ cd jllhmmf
$ ls
180570 chhgrj
dir fqqnjd
dir hmz
dir ljv
dir lrlqc
dir pfvmhz
299487 tnhwncj.nfv
dir wqcsrw
$ cd fqqnjd
$ ls
131810 mcm.pbj
237810 mvgmfhh.thn
199479 qrqpl
281772 vmwddb.qbh
$ cd ..
$ cd hmz
$ ls
319803 lqtw.vtp
111388 mgdwvvqd
38536 mlqsbjr.npn
85619 vmwddb.vhq
$ cd ..
$ cd ljv
$ ls
dir vmwddb
$ cd vmwddb
$ ls
dir bgdchqwj
$ cd bgdchqwj
$ ls
147734 jrfpjdpw.znd
$ cd ..
$ cd ..
$ cd ..
$ cd lrlqc
$ ls
327255 wmtvbq
$ cd ..
$ cd pfvmhz
$ ls
dir bpdv
dir cgnhzrb
dir cpgvb
71305 mmlbp.hnw
207351 rgwgmtr
223983 sgmlt.nrj
$ cd bpdv
$ ls
50169 stvpjws.pbn
$ cd ..
$ cd cgnhzrb
$ ls
328146 fzd.fgm
307323 gnmgw.rsf
311890 tmrdgzmm
$ cd ..
$ cd cpgvb
$ ls
241313 vzgnlqzh.fcb
$ cd ..
$ cd ..
$ cd wqcsrw
$ ls
dir jllhmmf
$ cd jllhmmf
$ ls
dir jllhmmf
$ cd jllhmmf
$ ls
161384 rvqgwwz.rbq
2778 zlbgrzs.jlv
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd qtwnndbg
$ ls
222554 qtwnndbg
20197 rrnmgz.hsj
135325 rvqgwwz.rbq
dir rzbjntjl
81086 tbsj.zns
275538 wqcsrw
$ cd rzbjntjl
$ ls
315148 lqtw.vtp
$ cd ..
$ cd ..
$ cd sshvc
$ ls
37541 mvgmfhh.thn
27276 vwwpbqq
$ cd ..
$ cd tzhbztd
$ ls
dir gcrfzd
dir ltvhvt
dir qtwnndbg
dir rgqwp
dir wqcsrw
$ cd gcrfzd
$ ls
319338 jrfpjdpw.znd
24471 wmtvbq
77828 zcbwwf
210897 zgfncbmh
169336 zvrfwmgm
$ cd ..
$ cd ltvhvt
$ ls
dir qtwnndbg
1644 rqr
114660 sfvv.frz
dir shl
dir vmwddb
dir wqcsrw
$ cd qtwnndbg
$ ls
dir hgfvpn
dir jcgr
dir ljv
dir scrd
dir zwwclfj
$ cd hgfvpn
$ ls
83476 nrpjcnz.psn
$ cd ..
$ cd jcgr
$ ls
dir jhvqhq
dir zhdch
$ cd jhvqhq
$ ls
dir ljv
$ cd ljv
$ ls
213483 hsjbmv
165211 rvqgwwz.rbq
48993 wmtvbq
$ cd ..
$ cd ..
$ cd zhdch
$ ls
126929 zsmpbnml.qbl
$ cd ..
$ cd ..
$ cd ljv
$ ls
60596 jrfpjdpw.znd
$ cd ..
$ cd scrd
$ ls
313679 nmhhp.bvt
199353 wmtvbq
$ cd ..
$ cd zwwclfj
$ ls
dir czqszmf
dir dmv
dir pgjwmnwf
dir whpmfw
$ cd czqszmf
$ ls
181716 jrfpjdpw.znd
$ cd ..
$ cd dmv
$ ls
303356 qtwnndbg.phh
$ cd ..
$ cd pgjwmnwf
$ ls
59757 cbdggnvh.szc
$ cd ..
$ cd whpmfw
$ ls
102901 lqtw.vtp
162907 rvqgwwz.rbq
dir whd
$ cd whd
$ ls
dir rvqnddsb
$ cd rvqnddsb
$ ls
265936 wmtvbq
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd shl
$ ls
270493 llqj.cvz
199257 lvhrltd.cbq
44404 qqhvstd.vjd
$ cd ..
$ cd vmwddb
$ ls
176668 dsmjtpcm.vfr
$ cd ..
$ cd wqcsrw
$ ls
85545 wqcsrw.llm
$ cd ..
$ cd ..
$ cd qtwnndbg
$ ls
dir ljv
dir psqjqb
dir tnvlnmw
44316 wmtvbq
dir wqcsrw
$ cd ljv
$ ls
205777 jrfpjdpw.znd
279684 mvgmfhh.thn
dir ppw
dir rms
dir tsccztf
dir wqcsrw
$ cd ppw
$ ls
139214 ljv
dir vmwddb
$ cd vmwddb
$ ls
141988 fbgbwp.fwl
$ cd ..
$ cd ..
$ cd rms
$ ls
221170 crlhwdqs.rbp
$ cd ..
$ cd tsccztf
$ ls
dir csrc
dir dbtzwqj
dir vqw
$ cd csrc
$ ls
dir jllhmmf
281285 nwbcqwf.lqw
$ cd jllhmmf
$ ls
337404 qtwnndbg.qhb
$ cd ..
$ cd ..
$ cd dbtzwqj
$ ls
89297 clsblqf.sql
75292 jrfpjdpw.znd
242192 mvgmfhh.thn
$ cd ..
$ cd vqw
$ ls
43526 vrgfvcd.tsc
$ cd ..
$ cd ..
$ cd wqcsrw
$ ls
38096 lqtw.vtp
37490 mvgmfhh.thn
$ cd ..
$ cd ..
$ cd psqjqb
$ ls
9842 wqcsrw
$ cd ..
$ cd tnvlnmw
$ ls
dir cvgs
dir npslzj
dir qtwnndbg
dir tsshp
$ cd cvgs
$ ls
48820 jllhmmf.rjr
2036 sprlcwv
$ cd ..
$ cd npslzj
$ ls
dir bbj
227147 slfq.bdf
$ cd bbj
$ ls
77671 bsmgb
$ cd ..
$ cd ..
$ cd qtwnndbg
$ ls
121924 wmtvbq
$ cd ..
$ cd tsshp
$ ls
33269 jllhmmf
$ cd ..
$ cd ..
$ cd wqcsrw
$ ls
dir jllhmmf
$ cd jllhmmf
$ ls
133114 rvqgwwz.rbq
$ cd ..
$ cd ..
$ cd ..
$ cd rgqwp
$ ls
13207 djgldhd
120394 fpjppcp.sbr
296110 fwwqr.gzz
146254 nprjzt.fml
265873 wqcsrw
$ cd ..
$ cd wqcsrw
$ ls
dir bbjgh
157738 mvgmfhh.thn
dir njdnjmz
dir wqm
179080 wtgpwt.sqm
$ cd bbjgh
$ ls
2285 wqcsrw.cvn
$ cd ..
$ cd njdnjmz
$ ls
dir cfd
$ cd cfd
$ ls
95362 vmwddb.rgq
$ cd ..
$ cd ..
$ cd wqm
$ ls
235077 jrfpjdpw.znd
$ cd ..
$ cd ..
$ cd ..
$ cd wqcsrw
$ ls
11821 rvqgwwz.rbq
$ cd ..
$ cd zjbzdrnd
$ ls
273551 ljv.mtt
73077 ljv.rpz
dir sbqsqw
102241 wmtvbq
$ cd sbqsqw
$ ls
308189 drmlmhb.jqt
$ cd ..
$ cd ..
$ cd ..
$ cd hblzj
$ ls
dir cgm
113128 csgchmtn.drj
dir qlg
dir rsgbjpp
dir tpjpnjg
dir vmwddb
$ cd cgm
$ ls
dir dfm
dir fqhzrms
dir ljv
125604 lqtw.vtp
dir vtrs
56731 wmtvbq
$ cd dfm
$ ls
228574 ljv
$ cd ..
$ cd fqhzrms
$ ls
dir qtwnndbg
$ cd qtwnndbg
$ ls
230853 njvmtghw
$ cd ..
$ cd ..
$ cd ljv
$ ls
68290 fbrm.gdc
117256 jllhmmf.dvj
$ cd ..
$ cd vtrs
$ ls
150365 brt.dqc
313762 chhlg.fst
dir dtmjbfm
92651 ljv.sjz
306760 rrwh
276248 rvqgwwz.rbq
$ cd dtmjbfm
$ ls
270715 jllhmmf.vdw
20878 wmtvbq
$ cd ..
$ cd ..
$ cd ..
$ cd qlg
$ ls
dir fgv
131774 jrfpjdpw.znd
dir ldmpnbt
36604 mvgmfhh.thn
dir prhtj
dir vfsj
dir wqcsrw
$ cd fgv
$ ls
222821 wmtvbq
$ cd ..
$ cd ldmpnbt
$ ls
183619 tbfjvng
$ cd ..
$ cd prhtj
$ ls
201210 lpdvzs.ndv
309785 smmfht
$ cd ..
$ cd vfsj
$ ls
dir bzznmpc
123825 cbzvvdm.rvs
dir ghp
dir gwzm
313610 jrfpjdpw.znd
dir ndsfzz
34270 rjq.ttw
dir rsqhz
108776 rvqgwwz.rbq
dir tsmlpnbc
29065 wwqfpv.fgv
dir zmljzwt
$ cd bzznmpc
$ ls
147394 rft.fsn
$ cd ..
$ cd ghp
$ ls
dir bhvgpz
248463 gwwtl
285955 tccqqtbw.bzv
122937 zwqh
$ cd bhvgpz
$ ls
300057 jllhmmf
137933 jrfpjdpw.znd
170731 pstc.hjq
dir tvpw
$ cd tvpw
$ ls
226913 ltjtlcp.nfj
113485 mvgmfhh.thn
$ cd ..
$ cd ..
$ cd ..
$ cd gwzm
$ ls
33023 jrfpjdpw.znd
dir zwztrgr
$ cd zwztrgr
$ ls
310997 mtrfsv.jgn
$ cd ..
$ cd ..
$ cd ndsfzz
$ ls
dir bhfnclp
dir jllhmmf
15445 lqtw.vtp
68225 rvqgwwz.rbq
46093 spvrn
dir vdfmwrq
dir zwzlr
$ cd bhfnclp
$ ls
174231 mvgmfhh.thn
dir qgtrvmf
202378 qtwnndbg.cnp
124762 sctssqpq
$ cd qgtrvmf
$ ls
65851 mvgmfhh.thn
$ cd ..
$ cd ..
$ cd jllhmmf
$ ls
dir jmqltsd
dir mjzcf
281062 sjdmlqzs
dir vmjjtbl
$ cd jmqltsd
$ ls
327426 ddhs.qsp
$ cd ..
$ cd mjzcf
$ ls
229568 cjq.jss
227699 jrfpjdpw.znd
41949 pjzcq
62253 rvqgwwz.rbq
$ cd ..
$ cd vmjjtbl
$ ls
dir sjqpfc
$ cd sjqpfc
$ ls
dir mbpfvsg
dir vfwvtscb
$ cd mbpfvsg
$ ls
128515 lqtw.vtp
$ cd ..
$ cd vfwvtscb
$ ls
dir ljv
$ cd ljv
$ ls
dir nwbfd
$ cd nwbfd
$ ls
297506 mvgmfhh.thn
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd vdfmwrq
$ ls
dir ntm
$ cd ntm
$ ls
36060 vlvdhw.vlj
$ cd ..
$ cd ..
$ cd zwzlr
$ ls
126975 bfnpq.hzt
$ cd ..
$ cd ..
$ cd rsqhz
$ ls
dir cjzh
238925 crgfccz.hlg
dir dsssbm
197221 ftrdjhcn.grz
171860 jvvcpbh
60237 qtwnndbg.rwr
247770 whwf
$ cd cjzh
$ ls
105519 rvqgwwz.rbq
$ cd ..
$ cd dsssbm
$ ls
128213 dqsrbnjd.bwf
dir frmmlzv
318040 wmtvbq
$ cd frmmlzv
$ ls
127732 mvgmfhh.thn
37436 qtwnndbg.zzg
$ cd ..
$ cd ..
$ cd ..
$ cd tsmlpnbc
$ ls
dir bdb
dir ddjd
dir gbdm
dir grm
273561 hzszqjgf.ggp
$ cd bdb
$ ls
100286 qtwnndbg
$ cd ..
$ cd ddjd
$ ls
dir vmwddb
$ cd vmwddb
$ ls
261837 wqcsrw.mzq
$ cd ..
$ cd ..
$ cd gbdm
$ ls
233279 wmtvbq
$ cd ..
$ cd grm
$ ls
dir cghd
$ cd cghd
$ ls
8883 ncjc.vsj
$ cd ..
$ cd ..
$ cd ..
$ cd zmljzwt
$ ls
274821 lqtw.vtp
dir ltpmzrtf
dir qtwnndbg
dir shfjtm
$ cd ltpmzrtf
$ ls
222040 vmwddb.fcz
$ cd ..
$ cd qtwnndbg
$ ls
245288 lhbjpggt.rfr
dir ltgqs
dir nqngjr
161396 rmlm.psv
130067 vmwddb.ssz
$ cd ltgqs
$ ls
45032 vmwddb.zwl
$ cd ..
$ cd nqngjr
$ ls
296145 fbt
$ cd ..
$ cd ..
$ cd shfjtm
$ ls
dir dqv
dir jhgdb
dir jllhmmf
dir sczqst
dir zngqfcw
$ cd dqv
$ ls
327447 jllhmmf.ndg
$ cd ..
$ cd jhgdb
$ ls
138120 bdbjjfs.rtn
dir nfd
dir qwng
dir zwdbl
$ cd nfd
$ ls
dir tdslfhgq
$ cd tdslfhgq
$ ls
dir jnfrd
45044 jrfpjdpw.znd
133120 sdjzcfhh.dmm
$ cd jnfrd
$ ls
314151 wmtvbq
161805 zzctqr
$ cd ..
$ cd ..
$ cd ..
$ cd qwng
$ ls
202921 zvtlrb.sdf
$ cd ..
$ cd zwdbl
$ ls
219865 wmtvbq
$ cd ..
$ cd ..
$ cd jllhmmf
$ ls
258183 rvqgwwz.rbq
$ cd ..
$ cd sczqst
$ ls
37030 jrfpjdpw.znd
$ cd ..
$ cd zngqfcw
$ ls
dir fmwlfgm
254522 rvqgwwz.rbq
$ cd fmwlfgm
$ ls
229979 jgcr.qlt
282169 wwpwcjgv
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd wqcsrw
$ ls
111251 ghjbjfhg.nqs
$ cd ..
$ cd ..
$ cd rsgbjpp
$ ls
dir dchrnhrl
dir lsqztz
dir lwlh
dir slb
$ cd dchrnhrl
$ ls
45452 ctmp.cmv
dir gqznj
206243 mvgmfhh.thn
166028 szzzlft.lst
156182 trtgnc.gcr
75072 zrh
$ cd gqznj
$ ls
251328 ljv.tpg
24996 lqtw.vtp
$ cd ..
$ cd ..
$ cd lsqztz
$ ls
dir cmrqhlf
$ cd cmrqhlf
$ ls
290574 wzbg.fdp
$ cd ..
$ cd ..
$ cd lwlh
$ ls
dir flc
dir pjm
dir vhs
140257 wqcsrw
dir zqwvr
$ cd flc
$ ls
75721 fbhzn
84992 jrfpjdpw.znd
2018 rvqgwwz.rbq
$ cd ..
$ cd pjm
$ ls
dir bzctws
213358 jllhmmf.vlr
243414 jrfpjdpw.znd
dir ljv
dir vjjhgjmp
$ cd bzctws
$ ls
89520 ljv.nbf
$ cd ..
$ cd ljv
$ ls
210757 fnnbm
$ cd ..
$ cd vjjhgjmp
$ ls
dir ljv
dir qvpcmscg
dir rsbdmvjq
219321 wjcwpt.psz
dir wqcsrw
$ cd ljv
$ ls
137884 jrfpjdpw.znd
$ cd ..
$ cd qvpcmscg
$ ls
36087 gwflqqnm.qjb
82032 pmqfdv
242377 qpth
$ cd ..
$ cd rsbdmvjq
$ ls
223158 wmtvbq
72999 zchc.wfg
$ cd ..
$ cd wqcsrw
$ ls
dir ljv
$ cd ljv
$ ls
dir mrw
$ cd mrw
$ ls
271684 tmnldb.rgb
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd vhs
$ ls
dir hsjs
dir jhvqqcls
172468 rvqgwwz.rbq
$ cd hsjs
$ ls
227982 jrfpjdpw.znd
323849 wmtvbq
$ cd ..
$ cd jhvqqcls
$ ls
dir wqcsrw
$ cd wqcsrw
$ ls
145011 twdzdhrb.nsw
$ cd ..
$ cd ..
$ cd ..
$ cd zqwvr
$ ls
333371 rvqgwwz.rbq
144186 vmwddb.htb
$ cd ..
$ cd ..
$ cd slb
$ ls
101405 jrfpjdpw.znd
80571 lqtw.vtp
212763 rfqt.cvz
242678 ssrbmlwn.rgn
204742 tftbz
$ cd ..
$ cd ..
$ cd tpjpnjg
$ ls
37762 wqcsrw.vhz
$ cd ..
$ cd vmwddb
$ ls
dir ctgzpnn
237933 hhv
dir lwvcw
dir wpw
$ cd ctgzpnn
$ ls
dir jbfqtvhl
100662 jhp
117832 lqtw.vtp
225417 mvgmfhh.thn
21553 rvqgwwz.rbq
240333 sbmzdqrc
dir shnnqff
$ cd jbfqtvhl
$ ls
37115 ljv.rws
73007 wqcsrw
$ cd ..
$ cd shnnqff
$ ls
294441 frghtdtd.qwf
dir srbf
dir vmwddb
$ cd srbf
$ ls
dir fqhhcdcm
$ cd fqhhcdcm
$ ls
142423 vmwddb.snc
$ cd ..
$ cd ..
$ cd vmwddb
$ ls
dir jllhmmf
dir ljv
61218 nsmtdl
58661 wqcsrw
$ cd jllhmmf
$ ls
6984 qdjnldqn
231401 sfcwg
$ cd ..
$ cd ljv
$ ls
110331 jfjsgfn.lvq
269960 mvgmfhh.thn
$ cd ..
$ cd ..
$ cd ..
$ cd ..
$ cd lwvcw
$ ls
115763 mvgmfhh.thn
$ cd ..
$ cd wpw
$ ls
187278 lqtw.vtp
$ cd ..
$ cd ..
$ cd ..
$ cd jbssdwf
$ ls
31839 ljcttp
$ cd ..
$ cd ljv
$ ls
270886 jrfpjdpw.znd
$ cd ..
$ cd nhp
$ ls
dir sgffh
$ cd sgffh
$ ls
76321 psbpb.sqj
