lines = DATA.read.split("\n")

lines.inspect

symbols = {
  '(' => ')',
  '[' => ']',
  '{' => '}',
  '<' => '>',
}

invalid_points = {
  ')' => 3,
  ']' => 57,
  '}' => 1197,
  '>' => 25137,
}

completion_points = {
  ')' => 1,
  ']' => 2,
  '}' => 3,
  '>' => 4,
}

check = {}

lines.each_with_index do |line, idx|
  current_stack = []

  begin
    line.split('').each_with_index do |sym, i|
      if symbols.keys.include?(sym)
        current_stack << sym
      else
        if current_stack.last == symbols.invert[sym]
          current_stack.pop
        else
          raise sym
        end
      end
    end
  rescue => e
    check[idx] = { msg: 'error', invalid: e.message, line: line }
  end

  check[idx] ||= { msg: 'incomplete', line: line, missing: current_stack.map { |sym| symbols[sym] }.reverse }
end

# pp check


puts "What is the total syntax error score for those errors?"
score = 0
check.each do |i, result|
  if result[:msg] == 'error'
    score += invalid_points[result[:invalid]]
  end
end
p score
# => 319329


puts "Find the completion string for each incomplete line, score the completion strings, and sort the scores. What is the middle score?"
completion_scores = {}
check.each do |i, result|
  next if result[:msg] == 'error'

  completion_scores["#{i}:#{result[:missing].join}"] = result[:missing].inject(0) do |memo, sym|
    memo * 5 + completion_points[sym]
  end
end

p completion_scores.values.sort[completion_scores.values.size/2]
# => 3515583998

__END__
[{<(<[<<(<{[[<[]{}><()[]>]]<(([]<>)<(){}>)({[]{}}([]()))>}>{{{<(()<>)[[]()]><(<>())[[]<>]>}{({()
<<[{([[{{[[[({()()}[<>[]]){<<>[]>([]<>)}]{[{{}{}}<{}{}>]{{[]<>}{[]{}}}}][{{{(){}}<<>[]>}}]]}{
([<{([<[([({[{[]{}}{{}{}}]}{[{<>{}}{(){}}]})[{[[(){}][(){}]]{<<>[]}{{}[]}}}]])]><({{{[[{{}{}}]<{<>
{{((<([<[<[((<{}>{()()})<[{}[]]{<>{}}>)<({[]{}}([][])){{[]<>}{{}<>}}>]>]><[[[[[<<>()>(()[])](<[][]>{<>{}}
{[[<[[((<[{{<[[]{}](()[])>}{<({}[])[[]<>]>}}{[(<()()><()>)({[]()}[<>()>)]}]((<{[<>[]]{{}()}}>[{<()<>>{[]
({{((<[{{{([{[(){}][<>]}([<>()][[]()])]{<{{}<>}<{}<>>>{{()[]}{()()}}})<<[(<><>)<[]()>][((){}){[]{}}]>>}}
{<(<{[[([[(<[(<>[])]<{()}<()[]>>><{<{}[]><[]>}(<<>{}><()()>)>)]]{((({{<><>}{{}{}}}{<[]()><{}<>>})<[{(
<[{(<{<((<(<{(<>{})}<<[]>(<>{})>>){{(<()[]>[[]<>])}[{[[][]]<<>()>}{[{}()]<(){}>}]}>{(((<<>
(<[{[<((((<[[[{}{}]{{}<>}]({[][]}[(){}])][{(<>[])<[]<>>}<[(){}]>]>)))<({{[<([]<>)<()<>>>[{
{{<<[<({[{([(<[][]>{[][]})<<<>[]>([]())>])[(<<[]<>>[{}()]>{([]{})})]}](<[<(<<>[]>)>{(<[]{}>[<>[]])<<[]()>((
[[[{<{[[[([[<<<>>[{}()]}[({}[])<()<>>]]]{<<<[]{}>[<>[]]><{[]<>}{[]{}}>>{(<{}{}>{<><>})({[]()}{{}<>})}})]<<<[(
(({([<{{{{<<<({}())[()<>]>{[[]()][()[]}}>>}<({({{}<>}[[]{}])(({}{}){()()})}{[(<>{}){<>{}}]{[<>[]]({}<>)}})>}(
{(([{(([<[{(<{[]<>}<()<>>>[([]{}}(<>{})])}({[<<>[]><<>{}>]}<[<()[]>[<>{}]]{<()<>>{(){}}}>)]>([<((<{}()>
({{<{{{{{{({<{<>{}}>(<<>[]>[[][]])})]{[{{{(){}}[()<>]}<[<>][[]{}]>}{[<{}<>>{<>}]{{[]{}}(<>{})
{{(([{([{([<([[]{}]{<>[]})>{(((){})[()()]){{{}<>]<()()>}}])(({{{<>{}}{[]{}}}[((){})[<>]]}<{(()[])[
{<[((<<(([{{<{[][]}>{[()<>]{()[]}}}}]))<<((<[<[][]>[[]()]][({}){[]<>}]>))>>>>))<(<<([<<[{<<><>>[(
[([[(<([(({<([{}][<>[]]){<{}{}><{}[]>}>(<({}[])>(<()()>))}{[[{{}()}{<><>}][{()[]}<()()>]>[{<<><>>{
[{[<{(<[([[[{[{}<>]({}())}(<<>>[[]<>])]{({<>()}{()()}){{[]()>{[]()}}}]]{[[{({}()){[][]}}((<><>))][[
<{(<[<<<{{[{{<{}<>>[[]<>]}[{()<>}[()<>]]}{[{{}[]}{()}]{<[]<>>([][])}}]({[[{}]{()<>}](({}{}))}>}{<[<({}()){()
<(<[<([({[<([<[]{}>{[]<>}]{{[]{}}{{}{}}})<<{()<>}({}{})><<[]()>{()<>]>>>(([{[]()}({}())]([[]()]<{}()>))
{[<<([[<([<<(<[]<>>){<<>()>(<><>)}><<{<><>}[{}[]]>([{}()])>>])>][{({[<<[<>]{<>()}>><<[<>()]{{
<<<[<<{[<<(({<{}<>>{{}<>}}[<[]<>>({}[])]))><{{<[[]()][(){}]><{{}()}(<>)>}[((<>{})(()<>))<[(){}][[][]]>]>>>]}
(([{{[{{<<{{[({}<>)(<>{})](<(){}><{}{}))}}([{({}())<<><>>}{<(){}>}]{{[{}{}]{(){}}}<([]<>){()()}>})
({{([{{({[{<<({}[])(()[])>[{{}()}[{}{}]]><<{()<>}{{}}>>}<[((()<>)([]{}))[{()()}(()<>)]]{[{(){}}{()
<[<{<[{({(([((<>{}){()[]}){{{}{}}{[]<>}}]{{({}<>)<{}[]>}<(()<>}(()[])>}))(<{({<><>}[[]()])<[{}()](
[[{[({{<{{{{[<<>[]]({}{})]<([]{})(<>{})>}{{({}{})[{}{}]}{<<>[]><{}>}}}{<(<<>[]>{{}{}})[(()<
[([(<{{[<[{[<(<>())<[]()>>{{{}}<[][]>}][[{[][]}<{}[]>]({{}()}[[][]])]}{{{<{}{}><{}<>>}{[()[]]<()[]>}}<<{[]{}}
[[(((({<<[<<({{}()}){<()()><<>[]>}>{((<><>)({}())){<[]{}><()[]>}}><[{<{}>}({{}{}}[<>()])]{{({}{})}[<
((<<[{{[[([[<[{}()]((){})>[{()[]}<<>{}>]]([<{}()>][{{}[]}[()]])]{({[()()][[]()]}(((){}){{}{}}))[{(<>())}
{[[<{<{[{{[(<<<>[]>([]())>{(()[])[<>{}]}){<(<>())(<>{})>{<[]<>>[{}[]]}}]({<<<>[]><{}()>>([[][]])}<[<{
[(<[<{<[([[{{{<>[]}[[]{}]>({[][]}[[][]])}{[(<>[])[[]]]({()()}({}[]))}]])<[<<<{<>{}}{[][]}>((()){()<>})>>
({<[<<[{[<({<{{}{}}{<>[]}>{{()}{[]<>}}}[<[{}<>][()[]]>])((<([]())((){})><[(){}]{{}()}>)[{<[]{}>[{}{}]}[
<[[([([(<(<[[(()[])]{[[]<>]({}{})}]>)>[<[{<<<>()>({}{})><([][])<{}{}>>}<([()[]]<(){}>)[([]{})[{}<>]]>]><[{({
[<{([([(<{<<{[()[]][()}}<<{}{}>>><<{[]<>}((){})>[{[]()}]>>}[(({{<>[]}[<>()]}<({}{})[{}[]]>)<[{<>{}}([][])
[<{([((<{({{[<<>()>{[]{}}](<[]()>[{}{}])}})(<{([<>()]{[][]})[{{}()}]}<((()[])(())){([]<>)([]<>)}>>{((({}()){
((<{{{<<[[<[[{[]<>}<{}[]>]<<(){}><<>>>]<<[[][]>[[][]]>{{<><>}{[]{}}}>>{{{{<>[]}{<>{}}}[[[]<>]<{
[<<[{[<({[[{{{{}[]}[<><>]}{<<>[]>[{}[]]}}<<(()[])[<>()]>[[<>{}]]>]]}{<({<([]())(<>())>[[{}[]][<>{}]]}){([
([<{({({{<[({(<><>){(){}}}<{[]{}}{[]())>)({<(){}>[<>[]]})]<[([{}{}]<{}[]>)[[()[]]]]{[{{}<>}]<(()<>)
[([{<{<{(<<(({[]{}}({}()))){{(<>())(<><>)}(([]{})<{}[]>)}><[<[{}{}]({}{})>]{[<[]()>(<>{})]<({}()
((<{[(<<[([<{([]{}){<><>)}[[[][]]({}())]>[[{<>()}[()<>]](({}<>)([]))]][<((()[])<()[]>)[[<>()]]>])<<{[
{[[<{<<[{{(((<{}[]>(()))[<<>()>{[][]}])){<([[]{}]{{}[]})<{{}()}{()()}>}}}[{[[<(){}>{{}()}]
{[{[<<[{[{([(<[]()>(()<>))]<{[{}<>]<{}()>}<{{}{}}[()[]]>>)[{{<{}>(())}<(<>)[<>[]]>}(<{[]<>}[()()]]<{<>{}}
[{{[{{[<{[(<{[()()][<>[]]}<([][])(()<>)>>({{{}()}[()<>]}[<[]{}><[]}]))([<<<><>>({}[])>({()[]}[<>])][([(
[({<[[<{<[(<(<[][]><[]()>){[()()]{()()}}>)[<[<()>(()[])][(<><>)]>((({}())<<>[]>))]]<[{[<<>{}>[{}<>]](<{}{}>((
<{<(<((<<[[<([<><>][()[]])(<<>{}>[<>[]])>]({<<[]>(()<>)>(((){}){<>[]})}{[[[]](<>())]<<(){}><<>[]>>
[<{(<{{<(({(<<[]()>><<()<>>>)<{<{}()><()()}}(<[][]>{{}{}})>}[{[{[][]}[()<>]]{([][])(<>[])}}[{[{}()][
{{(([[[{[{({([()()]([]<>))<[{}{}](<>())>}{{{()<>}{()()}}({()[]}[{}{}])})<([([]{})<()[]>]{<<>()>})>}[[
(((<[{<[{([[{[[]<>]{<>{}}}[[{}<>](<>{})]]<<[(){}][[]{}}>{[[][]]}>][{{[[]{}]([]{})}[([])<<>>]}
<[<[[([[[[{{{([]()){(){}}}<[[]{}](<><>)>}}]]]{([[<[(()())(()[]]][[<>{}]<<>[]>]>(<[<>]<<><>>>({{}{}}([]{
({(([<<[{{[(<({}<>)<[]<>>>(<{}<>>{(){}}))]{(({{}[]})({{}<>}((){}]))[({{}()}[()<>])<({}()){<>()}>]}}}[<
<[<({[[<<([[((<>())[<><>]){[<>[]]<<>>}]]{([<{}[]>{<><>}])})<<[<([]<>)(()<>)>(<{}()>([]<>))]>[
({({{[[<<([[({()[]}[<><>]){(()<>){<><>}}][{{<>[]}(<><>)}{[[]<>]<[]>}]])>([[<(({}[])<()>)(<()>[<>{
<([{(({<[{([<[[]<>]<()<>>><(<>())({})>][[(<>[]){[]{}}]{(<>[])<()[]>}])({[{{}()}{[]()}]}{{[[]{}]({}<>)
[([{({(({{<<<<(){}>[<>[]]>([<>()][<>[]])>[{(()())[()<>]}<{[][]}[<>{}]>]>}<[<([[]()][<>()])((<><>){[]})>
<({[{{[{{[([{({}()){{}{}}}<(()())[[][]]>][<[<>()][{}[]]><<<><>>>])([[({}{})(()<>)]{<<><>>([]<>)}]{{<()[]
<{{<{(([(<<<{{[]()}[[]()]}>{{[{}<>]<()<>>}[{{}{}}[{}[]]]}>>([([<()()>[{}<>]])([<()[]>[<>()]]{([]{})}
{<({<{[{{({[<{{}()}[()()]>{({}<>)}][<<()()>{[][]}>{<<>()><{}{}>}]})}{(<{<[()()]>}<{({}){()()}}(<[]<>><
(({{({{{<[[({((){})[<>[]]}[{<>{}}[[]()]])]{<<(<>){{}()}>[<<>>{{}{}}]>([(()[])][([]())<<>()>])}][<[[
[{[[[{<<<[<{({[]()}({}{}))[{<>}{<>[]}]}>[((<<><>>[[]<>])[[[]<>]<[][]>]){[[{}()][{}<>]]({[]
<<[{({[[[<[[[<[][]>]{{[]()}(()<>)}]{[[(){}}<{}()>][{<>{}}({}{})]}](({([]{})<()()>}[({}())]))>(<{(<(){}>)}
({<([[(<(({{<{{}[]}[[]<>]>}[<(<>[])<{}{}>><[[]<>][[]{}]>]}<[({<>{}}{{}()})(<[]()>(()<>))]([<{}()
((<[{[{[{{<[{[<>{}]}[<[][]><()>]]{{<()[]>}<[(){}]{{}<>}>}>}<(([[[]{}]<[]<>>]{[{}{}]<()[]>})[[{[]{}}{{}
[([(<([<(<<{(<{}{}>{()<>})[([]())[[]]]}[{{[]<>}((){})}<{{}[]}([]())>]><{[[<>()]]<({}())[{}<>]>}{[({}<>)
[{[<([<{<{{[[{{}{}}{<><>}]<[[]()]{[]{}}>][{({}{}){[][]}}<<{}{}>([]()]>]}[<<({}<>){()<>}>({(){}}<{}{}>)><([{}
<{((<{{<{({(([<>{}]{()<>}))(<({}[])(<>())><{{}()}[<>[]]>)}]}(<{{(({}<>)[{}{}])<<<>[]>>}}((<<<
<[<({<({{([{<<<>[]><[]{}>>(<()()>({}[]))}(((()())<{}[]>))][[[<(){}>[()()]][[{}[]]]]])}([(([{[][]}(()())][{()
[({{[<((<{{{<[[][]]({}{})>{(<>[]){[]}}}([{()[]}{[]{}}])]}{[<<[(){}]<[]<>>>{({}<>)([]())}>]
{[{(<({<[[(<<({}<>){[]{}}>(({}{})(<>[]))>({[()[]]<<>{}>}<[[][]]({}())>))(([[<>[]]([]{})][<{}>>){{[[]
{<([[(<<[(<{<<<>{}><<>>>(({}[])<()<>>)}<{<[]{}><()()>}[{(){}}]>>){<<<{{}{}}{()<>}>{{()[]}{()}>><<<<>[
<{[{(<{[<<(<<([]{})(())>[({}[]){{}()}]>)(<{[[]()]}>[{(()<>)(()<>)}{[{}<>]{()()}}])>[(({<<>[]>({}[]}}{([]
{{{([{[([[[{[{(){}}{[]()}][<<>()>]}([[[][]](<><>)])]]]{(<[(<<>[]>[{}<>])(({}[])({}{}))]{<([]{})<[][]>>((
({{[(<<<[({<[{[]<>}<{}<>>]<<()>[(){}]>>[<<<>{}>{{}[]}><({}{})>]})][(<{[(<>())]}(([<><>){[][]})
([[([{[<<{(<{<[]()>[(){}]}[(<><>){()<>}]>){{[<()()><<>[]>](<[][]>{[]<>})}<[{<>()}{()[]}]{{<><>}[<><>]}>}}{<<
<[<([<[(({<{{<(){}><<>[]>}{{<>{}}((){})}}<<[{}]({}[])}{<()()><()<>>}>>[[[{<><>}([][])](({}<>)((){}
<<[<[[<(<{(<{[[][]]{(){}}}<{{}()}<()[]>>><{<{}>}{{<>{}}[()<>]}>)}><{[<{(()[]]<()()>}<{(){}}
([([(<({{(<<{[[]<>]({}())}{{[][]}<()[]>}>>)}})(<{{<({<()[]>([]{})}[{{}<>}[<>()]])><[({<>()}{<>[
<(({{(<(<[{<[{{}[]}[<>{}])(<()<>>({}{}))>[<[<>[]]{{}}>[({}<>)[[]{}]]]}<[[{[]<>}{[]<>}]<(()()){<
{(<(([{([<({[[<>[]]{<>[]}]{{[]<>}{()}}})<[<[[]()][<>{}]>{[<>{}]<()<>>}]<(<[]>[[]()])([<>()](()<>))]>>])
{{[([[<<([(<{{{}[]}<()[]>}({[]{}}[[]{}])>(<{(){}}<(){}>><[[]{}]>))])>{{<<{<[()[]]<[]<>>>}{{(()
{{<[{[<([({<[{[][]}<<>()>]{{[]{}}({}())}]({{[]<>}}(<()<>>(<>[])))}([<[()()][[][]]>((<>{}){()<>})]
{[[{<{<<{((<<<<><>><[][]>>([()<>]<{}[]>)>{((<><>)({}()))([{}{}][<>])})<({({}[])({}())}<[()[]][{}<>]
<({{{(<{({<<(<[]<>>{{}})>[[({}<>)(()())]{[[]{}]({}{})>]>({<<()<>>[<>[]]>((()<>)([]{}))}[[([]<>)<[]<>>]{{{}<>}
{<[{([([{<[{<[<><>]([]())>((<>[])([][]))}]>(({[<[]>[[]<>]]{{{}[]}{[]{}}}}){(<{{}{}}([]<>)>)})}
(<[{{<([<[({<{{}{}}><{{}<>}([]{})>}<<[()()]{{}()}>[[[]()]({}{})]>)[[{<()[]><[]()>}<[<>()][(){}]>]]]<{(<<[]{}>
<{([[<{<([({{[<>{}]({}[])](<[][]>{{}[]})}{{{<>[]}<{}()>}<[{}[]]{{}()}>})([<[[][]]{<>()}>[<<>()>({
<{[{(<<{[<(<{{()<>}{[]()}}[([][])<{}[]>]>[[[{}<>}[()[]]][({}[]){()<>}]]){[<[{}[]][[][]]>(<{}>([][]))][[
{[{<([<<({<<(<<><>><{}[]>)[(<>()){[]{}}]>(<{{}<>}[[]<>]>([{}{}]))>}([{<(()[])[()<>]>{{()()}}}[[<[][
<{(<[{<<[[[({([]{})([]<>)}{([][])([][])})[[<[]{}><<><>>]<[{}<>]({}[])>]]<{[[{}{}]({}[])]<{[]<>}(()<>)>}[({<
(<[{([[[{[<([<{}[]>][(<>[])(()<>)])<[{[][]}([]())]>>][{([(<>())[()[]]])}({({()[]}[{}{}])}{[<[]<>>([]()
<({{[([[<<[(({{}}{{}()})<<()()><<><>>>)<[<{}[]><()<>>][<<>{}]([]{})]>]>>{<((<<[]>(())>{{()<>}}
[[[[<{[[({[{{[()[]]([]())}}<<{{}<>}(<>)>({{}{}}<[][]>)>]<{(<<>()>{(){}})[{()()}<<>>]}([{{}]<{}<>>][[()()](
(([[<(([{<({<<()()>>{<()<>><{}{}>}}{((<>()){()[]})<([]{}){()[]}>})>(<[[<[]()>{[][]>][[[]]<<>
{[<[({<(<<[[((<>())(<>[])){(<>[])(<>[])}][({[]{}}{{}<>})[<(){}>((){})]]]>>[<<{<<()[]>[[][]>>(
{<<(<([<<<((({[][]}{<><>})[{[][]}([]{})])<[<{}{}>({}())][((){})[[]()]]>)<[{(()<>)(()[])}](<[
