box_ids = DATA.read.chomp.split("\n")

tally = box_ids.map { |id| id.chars.tally }
two   = tally.count { |chars| chars.any? { |char, count| count == 2 } }
three = tally.count { |chars| chars.any? { |char, count| count == 3 } }

puts 'What is the checksum for your list of box IDs?'
puts two * three
# => 9633

puts 'What letters are common between the two correct box IDs?'
def common(a, b, highlight: false)
  left  = a.chars
  right = b.chars

  common = left.each_with_index.each_with_object('') do |(char, i), memo|
    if char == right[i]
      memo << char
    else
      memo << "\e[31m█\e[0m" if highlight
    end
  end
end

one, two = box_ids.combination(2).max_by { |a, b| common(a, b).size }
puts common(one, two, highlight: true)
# => lujnogabetpmsydyfcovzixaw

__END__
lutrogkbetprmshdyfiqvzixaw
lujnmgkbetprmshdyicqvzivaw
lujnogkbetprmshdyfkqvtpxaw
lujnqgkbetpmmshdywcqvzixaw
lujnogtaetprmshdyffqvzixaw
lujnogkbetprmuldyfcqvqixaw
luunogkbetprlshdyfcqrzixaw
lujnogkketprmshdyhcqvtixaw
lyjnogzbetprmsbdyfcqvzixaw
eujnogkbetprmshdyfrqvzixmw
lujnogcbetprmshdyfvqvziqaw
lujnogkbempruahdyfcqvzixaw
lujlogkbetprmlhdyfyqvzixaw
lrjnogkbetyrmshdofcqvzixaw
lujnogkbetprmlheyfaqvzixaw
lujoohkbetprmshdyfccvzixaw
lijkogkietprmshdyfcqvzixaw
lujnoukbetprmshdyfcqvzmxkw
lujnogkbetprpshdyfcivzixiw
lfjiogkbetprmshdyfwqvzixaw
lujnogkbctprmshdffcqvzicaw
lujnogkbetprashdckcqvzixaw
lwjnogkbetprjshdyfcqvziyaw
lujoogkbetpsmshdyfcnvzixaw
lujnrgkjetprmsvdyfcqvzixaw
luinogkcetprmshdyfccvzixaw
lujnlgkbetprmshdyfcqvziirw
rujnogkbetprmshdyfcqvzmxag
luqnogkbetkrmshdhfcqvzixaw
lujnogkbhxprmshdyfcbvzixaw
lpjnogkbeyprmshdymcqvzixaw
lujnogkbetdymshvyfcqvzixaw
lujnoakbetprmshdlfcnvzixaw
lujnogabetpumsydyfcovzixaw
lpjnogkbetprmshdyfcqvzixzi
gujnogkbevprdshdyfcqvzixaw
lzjnogkbetprmsddyscqvzixaw
lujnolkbmtprmshdyfuqvzixaw
lujnogkbexpenshdyfcqvzixaw
lujnogknetprmshdrfcqvzpxaw
lujnogkbetpfmshayfcqvzwxaw
lujnogkbetmrmshdyfcfvzilaw
lujnogkqetpqdshdyfcqvzixaw
xujnvgkbetprmnhdyfcqvzixaw
lujnogkbetprsshdyfcqviixai
rujnogkbeiprmshdyfcvvzixaw
vujnogkeetprmshdyfcsvzixaw
lujnogkbetcrmshdypcqxzixaw
vuunogkbdtprmshdyfcqvzixaw
nujnogkbetprmsvyyfcqvzixaw
lujnogkbhtprmshdtfpqvzixaw
lujnogkbetzrmphdyfcqvzixan
lujnogkbetprmshdytcqvzixiu
luanogkbeturmshdyfcqviixaw
lujnogkbefprmshdyfcqvhixaf
luvnogkbetprmsfdyfcqvzixhw
lujnockbetprfshdyfcqvzixdw
luenogkbetprmshdyfacvzixaw
lfjnogkbetprmsldyfcxvzixaw
xujnogkbetxrmshdufcqvzixaw
lsjnogkbdtprmswdyfcqvzixaw
lujnogkbetprishdyfcpvgixaw
fujnogkbethrmshdyhcqvzixaw
lujnogabetprmsydyfcovzixaw
lvjnogkbetpvmshzyfcqvzixaw
lujnogkbeturmshdufcqvcixaw
lujnogkietprmshdyzyqvzixaw
lujnogkaatprmshdyfwqvzixaw
lujnogkbetpemshoyfcfvzixaw
lujiogkbetpumshiyfcqvzixaw
lujnvgkbetirmphdyfcqvzixaw
lujnkgkbetprmhhdyfcqvzixmw
lrjnorkbetprmphdyfcqvzixaw
cujnogkietprmshdjfcqvzixaw
lpjnogkbetpryshdyfcqvzixbw
lujrogkbetprmchdzfcqvzixaw
cujnlgkbetprmmhdyfcqvzixaw
rujnogkbotprmshdyfcqczixaw
lucnogknetprmshdyfcqvzixhw
lujnogkbaturmdhdyfcqvzixaw
lujnonkbetpcmshcyfcqvzixaw
lujnogkbelprmshwyfcqvzihaw
luanogkbetprmshdyhcqvzilaw
lljnogkbetwrmshdyfcqxzixaw
lujnogkbetprmshdyfcqejixaz
lujnogkbetbrmshdyfcqizixgw
lujeogkbetprkahdyfcqvzixaw
lujnogkbevprmshssfcqvzixaw
lutnogkbetgrmshdyfcqvmixaw
lujnoppbntprmshdyfcqvzixaw
lujnogkbetprmsmdyftqvdixaw
lujuogubetprmshdyfcqvmixaw
lujnorkbetprmsydyqcqvzixaw
nujnogkbetprmshdyfcqvzifdw
lujnogkbetpryshdygcqvziqaw
ldjiogkbetprmuhdyfcqvzixaw
lujnogkbetpsmghdyfcqvzixag
xujnogkbetprmsrdefcqvzixaw
lujnogkbejprmshiyfcqvzoxaw
lujnogkletlnmshdyfcqvzixaw
aujnogkbetprmwydyfcqvzixaw
lujnogkbetprmsvdyfcrvzixap
lujnogkbeeprmshdyfcqozixmw
lujnogfbethrmshdyfcnvzixaw
lujnogkbetprmshsrflqvzixaw
lujuogkbnrprmshdyfcqvzixaw
lutnogkbetpbmsgdyfcqvzixaw
lujnqgkbetzrmshdyfcxvzixaw
lujnogqbetprmshgxfcqvzixaw
lujnogkbytprmshdyfcqvznxrw
lujnogkbetprmshdyfcqvlidxw
nljnogkbetprmsqdyfcqvzixaw
lujnogkbetprmsidyfcqvfixjw
lujnogkbetprmnhdyfcqvzifaq
lujnogkbetprmwhdylcqvzixlw
lujnogkbstprmshcyffqvzixaw
lujnogkbetprmshdtfcqvzeyaw
lujvzgkbetprmshdyncqvzixaw
bujnogabetprmshdyfcqvzgxaw
lujnogkbptpfmshdyfcrvzixaw
ludnogkbetpsmshdyfcqvbixaw
pgjnogkbttprmshdyfcqvzixaw
lxjnogkbetprmshdyfcqezixyw
lujnogkbutprmshdyfsqvzixjw
lujnpgkbetlrmshdifcqvzixaw
lujnogkbetprmshdygczvzixam
lujnvgkwetirmshdyfcqvzixaw
lujnogkbetprhshdyfcqvvixow
lutnogkbetprmshdyfcrvzixgw
lujnopkbetprmsudyfcqvzqxaw
lujnolkbetprmjhdyftqvzixaw
fujoogkbetprmshdyfcqvziuaw
lqjnogkqetprmshdyfcqmzixaw
lujnogkbetprmgcdyfcqvzibaw
lujnogebebprmshdyzcqvzixaw
lujnogkbetprmshzgfcnvzixaw
luanogkretprmshdsfcqvzixaw
nljnogkbetprmshdyfcqnzixaw
lujnygkbetprmshdyfaqvzixjw
lujnogkbetprmshdlfcqtzixag
zujnogkbevprmshdyfcqvzixao
lujnogkbbtprmshtyfcyvzixaw
lujnogkbetjrmvhdyfcqvzixau
fujnojkbetprmshdyfcqyzixaw
suonogkbetprmshdyfcqvzexaw
lujnogkbetprrshdyfcqvpifaw
lujnogkbjtprmshdyfcqkzixat
lujnogklxtprmshdyfcqyzixaw
lujaogkbetprmshdyfcqvzihat
kujnogkbetprmshlyfcqvjixaw
lujnogkbetormshdyfcqvzbxap
lujnogzuetpemshdyfcqvzixaw
lujnogknetprmshdyfcwvlixaw
lujnopkbetpfmshdyfcqxzixaw
lqjnogkbetprmshdyfcoqzixaw
lujnogkbetprmshdyfcdvzhdaw
lujrogkbetprmshnyfcqvzijaw
luovogkbetprpshdyfcqvzixaw
xujnxgkbeturmshdyfcqvzixaw
lujnogkbetprmshdyfyquzixav
lujnogkbetptmshdyfcqvnitaw
lujnoskbetprmvhdyfcqvziyaw
dujnogkbetprmshdyfcqgzixae
ltjnogkbetprmshdvfcqyzixaw
luznogkbetprmshdyfcqvuixsw
lujnogkbeiprmshdhfcqvzixav
lujtogkbetormkhdyfcqvzixaw
lujnogkbetprmssdyfcqvzilas
lujnlgkbetprmshwyfcnvzixaw
lujnogkbbtprmshdyfcqozfxaw
lzjcogkpetprmshdyfcqvzixaw
lujnogkketprmshdyfcqvzixfg
oujnogkbetprgshdnfcqvzixaw
zujnogkbetpbmshdyfcqvzixiw
lcjnowkbetprmsmdyfcqvzixaw
lujnogkbetprmsedyvcqvzzxaw
lujnzikbetprmshdyfcqvzixlw
lujnogkbetpyqsgdyfcqvzixaw
lujnoukietprmssdyfcqvzixaw
lujnogkbetyrmsydywcqvzixaw
bujnogkdetprmsxdyfcqvzixaw
lujnogkbetprmshdyjcqazixnw
lgjnogktetprmsgdyfcqvzixaw
lujnogkbeaprmahdyfcmvzixaw
lubnoikbetprmshdyfcfvzixaw
eusnogkbotprmshdyfcqvzixaw
lujnogkbgtprmshdbfjqvzixaw
lujnogkketprmshdyfcqvcjxaw
lujnogkbetphmshdsfcqvzgxaw
lujnhgkbdtprmshdyfeqvzixaw
lujnogkbetpamsjdyfcqvlixaw
lujnogkbetprmshlyfccvzxxaw
lujzogkbetprmshdyfgqvzixpw
lujnogkbetprfshdylcqveixaw
lujnigkbetprmshdyfcqvzqxrw
lujnogkbetpqmshdybcvvzixaw
lujnogkbetprmsxdyfvqvzpxaw
lujnogkbetprmfhdyfcqvmoxaw
lujnoskbetprmhfdyfcqvzixaw
lujnogkbetprmsodkfcqvzdxaw
lujnogkbetpzrshdyfcqvzixpw
mujnogkbetprmshdyfcsvzixan
lujnonwbetprmshdyfcqvzixam
lujnogkgetgrmshdyfcxvzixaw
lujnogkbetpimshdyfcqvzixgs
auanogkbetprmshdyfcxvzixaw
lujnogkbenprishnyfcqvzixaw
mujiogkbetpreshdyfcqvzixaw
lujnogkbdipcmshdyfcqvzixaw
kujnogkbetprmshdyucqvlixaw
lujnogsbetprmshdrfcqvrixaw
luynogkbetprhshdyfcqvsixaw
lbjnogebetprmshdyfcqezixaw
lujnogkbetprmnhtyfcqvzixap
lujnogkbetprmszdhfcvvzixaw
lujnogkbetprtshdywcqezixaw
iuznogkbetprmshdyflqvzixaw
nujnogkbetprmkhyyfcqvzixaw
aujnogkbetprmshhyfcqvzijaw
lujzogkbstprmshdyfcyvzixaw
lujmogkbetprmshdtfctvzixaw
ljjnogkbetrrmshdyfcqvzixaq
lujnjgkbetprmshdyfdcvzixaw
lujnogkbettrmshdyzcqvzfxaw
dujnogybetvrmshdyfcqvzixaw
lujnogkbetermshdmfcqvzvxaw
lujnogkbetprmshdjfcdvzixab
lujnogkbetirmshjyfcqvjixaw
lujnogkbeiurmshdyfcqyzixaw
lsjnogkbmtproshdyfcqvzixaw
lujnogkqftprmshdyfcqvziwaw
lujvogkbetprmshdyfcqvoixyw
lujnogkoetprmshdyfpqvcixaw
lujnogkbetprmshdyfcqvmghaw
lujnmgkbetprmshdifcqveixaw
lumlovkbetprmshdyfcqvzixaw
lpjnogkretprmshdyfcqvfixaw
luvnogpbetprmshdyftqvzixaw
lujnogkbeturmshgymcqvzixaw
lujiogkbbrprmshdyfcqvzixaw
yujnogkbutprmshdyfcqvzixab
lujvofubetprmshdyfcqvzixaw
lujwogkbrtprmshdyfcqvnixaw
lusnogkbetprmsydyfcqvzikaw
lujnolkbewprmshdyfyqvzixaw
lujnogkbetprvshdyfcivzikaw
lujnogxbetprmszdyfzqvzixaw
lujnogkvetprmxhdydcqvzixaw
lujnogkbetpimsrdwfcqvzixaw
lujnomboetprmshdyfcqvzixaw