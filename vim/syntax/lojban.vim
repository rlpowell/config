" Vim syntax file
" Language:     lojban
" Maintainer:   Cyril Slobin <slobin@ice.ru>
" Last Change:  2001 Jun 20
" $Id: lojban.vim 2.6 2001/06/19 22:31:39 slobin Exp $

" For more information about lojban language see http://www.lojban.org

" This syntax file doesn't implement a full lojban morphology algorithm,
" but a rough approximation only: some broken words can be recognized as
" well-formed; commas are allowed in cmene only; pauses are highlighted,
" but not otherwise checked; capital letters are treated as lower-case.
" Digits are recognized as cmavo.

" If you do not want to write entire file in lojban, but to embed lojban
" pieces into the text in other language, assign any values to variables
" lojban_in_braces and/or lojban_in_brackets.

" Yes, pattern matching IS awfully slow - any takers to speed it up?

set iskeyword=39,44,48-57,A-Z,a-z

syn clear
syn case ignore

syn cluster lojbanTopLevel contains=lojbanComment,lojbanPause,lojbanUnknown,lojbanBrivla,lojbanGismuError,lojbanCmavo,lojbanCmene,lojbanGismu,lojbanGismuUnofficial

if exists("lojban_in_braces")
    syn region lojbanText start="{" end="}" contains=@lojbanTopLevel
endif

if exists("lojban_in_brackets")
    syn region lojbanText start="\[" end="]" contains=@lojbanTopLevel
endif

if !exists("lojban_in_braces") && !exists("lojban_in_brackets")
    syn region lojbanText start="^" end="$" contains=@lojbanTopLevel
endif

syn match lojbanComment contained "/[^/]*/"

syn match lojbanPause contained "\."

syn match lojbanUnknown contained "\<\k\+\>" contains=lojbanError,lojbanVovelError

syn match lojbanBrivla contained "\<[bcdfgjklmnprstvxz]\{2}['a-z]\{2,}[aeiou]\>" contains=lojbanError,lojbanVovelError
syn match lojbanBrivla contained "\<[bcdfgjklmnprstvxz][aeiou][bcdfgjklmnprstvxz]y\=[bcdfgjklmnprstvxz]['a-z]*[aeiou]\>" contains=lojbanError,lojbanVovelError
syn match lojbanBrivla contained "\<[bcdfgjklmnprstvxz][aeiou]'\=[aeiou][bcdfgjklmnprstvxz]\{2}['a-z]*[aeiou]\>" contains=lojbanError,lojbanVovelError
syn match lojbanBrivla contained "\<[aeiou]\('\=[aeiou]\)\{,2}[bcdfgjklmnprstvxz]\{2}['a-z]*[aeiou]\>" contains=lojbanError,lojbanVovelError

syn match lojbanGismuError contained "\<[bcdfgjklmnprstvxz]\{2}[aeiou][bcdfgjklmnprstvxz][aeiou]\>" contains=lojbanError
syn match lojbanGismuError contained "\<[bcdfgjklmnprstvxz][aeiou][bcdfgjklmnprstvxz]\{2}[aeiou]\>" contains=lojbanError

syn match lojbanCmavo contained "\<[aeiouy]\('\=[aeiouy]\)*\([0-9]\|\([bcdfgjklmnprstvxz]\([aeiou]\|\([aeiouy]\('\=[aeiouy]\)\+\)\)\)\)*\([bcdfgjklmnprstvxz]y\)*\>" contains=lojbanCmavoSimple,lojbanCmavoUnused,lojbanCmavoUnassigned,lojbanCmavoExperimental
syn match lojbanCmavo contained "\<\([0-9]\|\([bcdfgjklmnprstvxz]\([aeiou]\|\([aeiouy]\('\=[aeiouy]\)\+\)\)\)\)\+\([bcdfgjklmnprstvxz]y\)*\>" contains=lojbanCmavoSimple,lojbanCmavoUnused,lojbanCmavoUnassigned,lojbanCmavoExperimental
syn match lojbanCmavo contained "\<\([bcdfgjklmnprstvxz]y\)\+\>" contains=lojbanCmavoSimple

syn match lojbanCmavoSimple contained "[bcdfgjklmnprstvxz][aeiouy]\('\=[aeiouy]\)\=" contains=lojbanDiphtongError,lojbanVovelError
syn match lojbanCmavoSimple contained "[aeiouy]\('\=[aeiouy]\)\=" contains=lojbanVovelError
syn match lojbanCmavoSimple contained "[0-9]"

syn match lojbanCmavoUnused contained "y'\=[aeiou]" contains=lojbanVovelError
syn match lojbanCmavoUnused contained "[aeiou]'\=y" contains=lojbanVovelError
syn match lojbanCmavoUnused contained "[bcdfgjklmnprstvz]y'\=[aeiouy]" contains=lojbanVovelError
syn match lojbanCmavoUnused contained "[bcdfgjklmnprstvz][aeiouy]'\=y" contains=lojbanVovelError
syn match lojbanCmavoUnused contained "yy" contains=lojbanVovelError

syn match lojbanCmavoUnassigned contained "bi'a\|bo'a\|bo'e\|bo'i\|bo'o\|bo'u\|ci'a"
syn match lojbanCmavoUnassigned contained "ja'u\|ne'e\|po'a\|te'i\|zi'a\|zi'i\|zi'u"

syn match lojbanCmavoExperimental contained "x[aeiouy]'\=[aeiouy]" contains=lojbanDiphtongError,lojbanVovelError
syn match lojbanCmavoExperimental contained "[bcdfgjklmnprstvxz]\=[aeiouy]\('\=[aeiouy]\)\{2,}" contains=lojbanDiphtongError,lojbanVovelError

syn match lojbanCmene contained "\<[\,'a-z]*[bcdfgjklmnprstvxz]\>" contains=lojbanError,lojbanCmeneError

syn match lojbanCmeneError contained "\<doi"
syn match lojbanCmeneError contained "\<la[^u]"he=e-1
syn match lojbanCmeneError contained "[aeiouy]doi"hs=s+1
syn match lojbanCmeneError contained "[aeiouy]la[^u]"he=e-1,hs=s+1

syn match lojbanDiphtongError contained "[iu][aeiou]"

syn match lojbanVovelError contained "[aeoy][aeoy]\|[eoy]u\|yi"

syn match lojbanError contained "[bcdfgjklmnprstvxz]'"hs=s+1
syn match lojbanError contained "'[bcdfgjklmnprstvxz]"he=e-1
syn match lojbanError contained "\<[,']\|[,'][,']\|[,']\>"
syn match lojbanError contained "\([bcdfgjklmnprstvxz]\)\1"
syn match lojbanError contained "[bdgjvz][cfkpstx]\|[cfkpstx][bdgjvz]"
syn match lojbanError contained "cs\|sc\|jz\|zj\|cx\|xc\|kx\|xk\|mz"
syn match lojbanError contained "[hqw]"

syn keyword lojbanGismu contained bacru badna badri bajra bakfu bakni bakri baktu balji balni
syn keyword lojbanGismu contained balre balvi bancu bandu banfi bangu banli banro banxa banzu
syn keyword lojbanGismu contained bapli barda bargu barja barna bartu basna basti batci batke
syn keyword lojbanGismu contained bavmi baxso bebna bemro bende bengo benji bersa berti besna
syn keyword lojbanGismu contained betfu betri bevri bidju bifce bikla bilga bilma bilni bindo
syn keyword lojbanGismu contained binra binxo birje birka birti bisli bitmu blabi blaci blanu
syn keyword lojbanGismu contained bliku bloti bolci bongu botpi boxfo boxna bradi bratu brazo
syn keyword lojbanGismu contained bredi bridi brife briju brito broda brode brodi brodo brodu
syn keyword lojbanGismu contained bruna budjo bukpu bumru bunda bunre burcu burna cabna cabra
syn keyword lojbanGismu contained cacra cadzu cafne cakla calku canci cando cange canja canko
syn keyword lojbanGismu contained canlu canpa canre canti carce carmi carna cartu carvi casnu
syn keyword lojbanGismu contained catke catlu catni catra caxno cecla cecmu cedra cenba censa
syn keyword lojbanGismu contained centi cerda cerni certu cevni cfari cfika cfila cfine cfipu
syn keyword lojbanGismu contained ciblu cicna cidja cidni cidro cifnu cigla cikna cikre ciksi
syn keyword lojbanGismu contained cilce cilmo cilre cilta cimde cimni cinba cindu cinfo cinje
syn keyword lojbanGismu contained cinki cinla cinmo cinri cinse cinta cinza cipni cipra cirko
syn keyword lojbanGismu contained cirla ciska cisma ciste citka citno citri citsi civla cizra
syn keyword lojbanGismu contained ckabu ckafi ckaji ckana ckape ckasu ckeji ckiku ckilu ckini
syn keyword lojbanGismu contained ckire ckule ckunu cladu clani claxu clika clira clite cliva
syn keyword lojbanGismu contained clupa cmaci cmalu cmana cmavo cmene cmila cmima cmoni cnano
syn keyword lojbanGismu contained cnebo cnemu cnici cnino cnisa cnita cokcu condi cortu cpacu
syn keyword lojbanGismu contained cpana cpare cpedu cpina cradi crane creka crepu cribe crida
syn keyword lojbanGismu contained crino cripu crisa critu ctaru ctebi cteki ctile ctino ctuca
syn keyword lojbanGismu contained cukla cukta culno cumki cumla cunmi cunso cuntu cupra curmi
syn keyword lojbanGismu contained curnu curve cusku cutci cutne cuxna dacru dacti dadjo dakfu
syn keyword lojbanGismu contained dakli damba damri dandu danfu danlu danmo danre dansu danti
syn keyword lojbanGismu contained daplu dapma dargu darlu darno darsi darxi daski dasni daspo
syn keyword lojbanGismu contained dasri datka datni decti degji dejni dekpu dekto delno dembi
syn keyword lojbanGismu contained denci denmi denpa dertu derxi desku detri dicra dikca diklo
syn keyword lojbanGismu contained dikni dilcu dilnu dimna dinju dinko dirba dirce dirgo dizlo
syn keyword lojbanGismu contained djacu djedi djica djine djuno donri dotco draci drani drata
syn keyword lojbanGismu contained drudi dugri dukse dukti dunda dunja dunku dunli dunra dzena
syn keyword lojbanGismu contained dzipo facki fadni fagri falnu famti fancu fange fanmo fanri
syn keyword lojbanGismu contained fanta fanva fanza fapro farlu farna farvi fasnu fatci fatne
syn keyword lojbanGismu contained fatri febvi femti fendi fengu fenki fenra fenso fepni fepri
syn keyword lojbanGismu contained ferti festi fetsi figre filso finpe finti flalu flani flecu
syn keyword lojbanGismu contained fliba flira foldi fonmo fonxa forca fraso frati fraxu frica
syn keyword lojbanGismu contained friko frili frinu friti frumu fukpi fulta funca fusra fuzme
syn keyword lojbanGismu contained gacri gadri galfi galtu galxe ganlo ganra ganse ganti ganxo
syn keyword lojbanGismu contained ganzu gapci gapru garna gasnu gasta genja gento genxu gerku
syn keyword lojbanGismu contained gerna gidva gigdo ginka girzu gismu glare gleki gletu glico
syn keyword lojbanGismu contained gluta gocti gotro gradu grake grana grasu greku grusi grute
syn keyword lojbanGismu contained gubni gugde gundi gunka gunma gunro gunse gunta gurni guska
syn keyword lojbanGismu contained gusni gusta gutci gutra guzme jabre jadni jakne jalge jalna
syn keyword lojbanGismu contained jalra jamfu jamna janbe janco janli jansu janta jarbu jarco
syn keyword lojbanGismu contained jarki jaspu jatna javni jbama jbari jbena jbera jbini jdari
syn keyword lojbanGismu contained jdice jdika jdima jdini jduli jecta jeftu jegvo jelca jemna
syn keyword lojbanGismu contained jenca jendu jenmi jerna jersi jerxo jesni jetce jetnu jgalu
syn keyword lojbanGismu contained jganu jgari jgena jgina jgira jgita jibni jibri jicla jicmu
syn keyword lojbanGismu contained jijnu jikca jikru jilka jilra jimca jimpe jimte jinci jinga
syn keyword lojbanGismu contained jinku jinme jinru jinsa jinto jinvi jinzi jipci jipno jirna
syn keyword lojbanGismu contained jisra jitfa jitro jivbu jivna jmaji jmifa jmina jmive jordo
syn keyword lojbanGismu contained jorne jubme judri jufra jukni jukpa julne jundi jungo junla
syn keyword lojbanGismu contained junri junta jurme jursa jutsi juxre jvinu kabri kacma kadno
syn keyword lojbanGismu contained kafke kagni kajde kajna kakne kakpa kalci kalri kalsa kalte
syn keyword lojbanGismu contained kamju kamni kampu kanba kancu kandi kanji kanla kanro kansa
syn keyword lojbanGismu contained kantu kanxe karbi karce karda kargu karli karni katna kavbu
syn keyword lojbanGismu contained kecti kelci kelvo kenra kensa kerfa kerlo ketco kevna kicne
syn keyword lojbanGismu contained kijno kilto kinli kisto klaji klaku klama klani klesi klina
syn keyword lojbanGismu contained kliru kliti klupe kluza kobli kojna kolme komcu konju korbi
syn keyword lojbanGismu contained korcu korka kosta kramu krasi krati krefu krici krili krinu
syn keyword lojbanGismu contained krixa kruca kruji kruvi kubli kucli kufra kukte kulnu kumfa
syn keyword lojbanGismu contained kumte kunra kunti kurfa kurji kurki kuspe kusru labno lacpu
syn keyword lojbanGismu contained lacri ladru lafti lakne lakse lalxu lamji lanbi lanci lanka
syn keyword lojbanGismu contained lanli lanme lante lanxe lanzu larcu lasna lastu latmo latna
syn keyword lojbanGismu contained lazni lebna lenjo lenku lerci lerfu libjo lidne lifri lijda
syn keyword lojbanGismu contained limna lindi linji linsi linto lisri liste litce litki litru
syn keyword lojbanGismu contained livga livla logji lojbo loldi lorxu lubno lujvo lumci lunbe
syn keyword lojbanGismu contained lunra lunsa mabla mabru macnu makcu makfa maksi malsi mamta
syn keyword lojbanGismu contained manci manfo manku manri mansa manti mapku mapni mapti marbi
syn keyword lojbanGismu contained marce marde margu marji marna marxa masno masti matci matli
syn keyword lojbanGismu contained matne matra mavji maxri mebri megdo mekso melbi meljo menli
syn keyword lojbanGismu contained mensi mentu merko merli mexno midju mifra mikce mikri milti
syn keyword lojbanGismu contained milxe minde minji minli minra mintu mipri mirli misno misro
syn keyword lojbanGismu contained mitre mixre mlana mlatu mleca mledi mluni mokca moklu molki
syn keyword lojbanGismu contained molro morji morko morna morsi mosra mraji mrilu mruli mucti
syn keyword lojbanGismu contained mudri mukti mulno munje mupli murse murta muslo mutce muvdu
syn keyword lojbanGismu contained muzga nabmi nakni nalci namcu nanba nanca nandu nanla nanmu
syn keyword lojbanGismu contained nanvi narge narju natfe natmi navni naxle nazbi nejni nelci
syn keyword lojbanGismu contained nenri nibli nicte nikle nilce nimre ninmu nirna nitcu nivji
syn keyword lojbanGismu contained nixli nobli notci nukni nupre nurma nutli nuzba pacna pagbu
syn keyword lojbanGismu contained pagre pajni palci palku palne palta pambe panci pandi panje
syn keyword lojbanGismu contained panka panlo panpi panra pante panzi papri parbi pastu patfu
syn keyword lojbanGismu contained patlu patxu pelji pelxu pemci penbi pencu pendo penmi pensi
syn keyword lojbanGismu contained perli pesxu petso pezli picti pijne pikci pikta pilji pilka
syn keyword lojbanGismu contained pilno pimlu pinca pindi pinfu pinji pinka pinsi pinta pinxe
syn keyword lojbanGismu contained pipno pixra plana platu pleji plibu plini plipe plise plita
syn keyword lojbanGismu contained plixa pluja pluka pluta polje polno ponjo ponse porpi porsi
syn keyword lojbanGismu contained porto prali prami prane preja prenu preti prije prina pritu
syn keyword lojbanGismu contained prosa pruce pruni pruxi pulce pulji pulni punji punli purci
syn keyword lojbanGismu contained purdi purmo racli ractu radno rafsi ragve rakso raktu ralci
syn keyword lojbanGismu contained ralju ralte randa rango ranji ranmi ransu ranti ranxi rapli
syn keyword lojbanGismu contained rarna ratcu ratni rebla rectu remna renro renvi respa ricfu
syn keyword lojbanGismu contained rigni rijno rilti rimni rinci rinju rinka rinsa rirci rirni
syn keyword lojbanGismu contained rirxe rismi risna ritli rivbi rokci romge ropno rorci rotsu
syn keyword lojbanGismu contained rozgu ruble rufsu runme runta rupnu rusko rutni sabji sabnu
syn keyword lojbanGismu contained sacki saclu sadjo sakci sakli sakta salci salpo salta samcu
syn keyword lojbanGismu contained sampu sance sanga sanji sanli sanmi sanso santa sarcu sarji
syn keyword lojbanGismu contained sarlu sarxe saske satci satre savru sazri sefta selci selfu
syn keyword lojbanGismu contained semto senci senpi senta senva sepli serti setca sevzi sfani
syn keyword lojbanGismu contained sfasa sfofa sfubu siclu sicni sidbo sidju sigja silka silna
syn keyword lojbanGismu contained simlu simsa simxu since sinma sinso sinxa sipna sirji sirxo
syn keyword lojbanGismu contained sisku sisti sitna sivni skaci skami skapi skari skicu skiji
syn keyword lojbanGismu contained skina skori skoto skuro slabu slaka slami slanu slari slasi
syn keyword lojbanGismu contained sligu slilu sliri slovo sluji sluni smacu smadi smaji smani
syn keyword lojbanGismu contained smoka smuci smuni snada snanu snidu snime snipa snuji snura
syn keyword lojbanGismu contained snuti sobde sodna sodva softo solji solri sombo sonci sorcu
syn keyword lojbanGismu contained sorgu sovda spaji spali spano spati speni spisa spita spofu
syn keyword lojbanGismu contained spoja spuda sputu sraji sraku sralo srana srasu srera srito
syn keyword lojbanGismu contained sruma sruri stace stagi staku stali stani stapa stasu stati
syn keyword lojbanGismu contained steba steci stedu stela stero stici stidi stika stizu stodi
syn keyword lojbanGismu contained stuna stura stuzi sucta sudga sufti suksa sumji sumne sumti
syn keyword lojbanGismu contained sunga sunla surla sutra tabno tabra tadji tadni tagji talsa
syn keyword lojbanGismu contained tamca tamji tamne tanbo tance tanjo tanko tanru tansi tanxe
syn keyword lojbanGismu contained tapla tarbi tarci tarla tarmi tarti taske tatpi tatru tavla
syn keyword lojbanGismu contained taxfu tcaci tcadu tcana tcati tcena tcica tcidu tcika tcila
syn keyword lojbanGismu contained tcima tcini tcita temci tenfa tengu terdi terpa terto tigni
syn keyword lojbanGismu contained tikpa tilju tinbe tinci tinsa tirna tirse tirxu tisna titla
syn keyword lojbanGismu contained tivni tixnu toknu toldi tonga tordu torni traji trano trati
syn keyword lojbanGismu contained trene tricu trina trixe troci tsali tsani tsapi tsiju tsina
syn keyword lojbanGismu contained tubnu tugni tujli tumla tunba tunka tunlo tunta tuple turni
syn keyword lojbanGismu contained tutci tutra vacri vajni valsi vamji vamtu vanbi vanci vanju
syn keyword lojbanGismu contained vasru vasxu vecnu venfu vensa verba vibna vidni vidru vifne
syn keyword lojbanGismu contained vikmi viknu vimcu vindu vinji vipsi virnu viska vitci vitke
syn keyword lojbanGismu contained vitno vlagi vlile vlina vlipa vofli voksa vorme vraga vreji
syn keyword lojbanGismu contained vreta vrici vrude vrusi vukro xabju xadba xadni xagji xagri
syn keyword lojbanGismu contained xajmi xaksu xalbo xalka xalni xamgu xampo xamsi xance xanka
syn keyword lojbanGismu contained xanri xanto xarci xarju xarnu xasli xasne xatra xatsi xazdo
syn keyword lojbanGismu contained xebni xebro xecto xedja xekri xelso xendo xenru xexso xindo
syn keyword lojbanGismu contained xinmo xirma xislu xispo xlali xlura xotli xrabo xrani xriso
syn keyword lojbanGismu contained xruba xruki xrula xruti xukmi xunre xurdo xusra xutla zabna
syn keyword lojbanGismu contained zajba zalvi zanru zarci zargu zasni zasti zbabu zbani zbasu
syn keyword lojbanGismu contained zbepi zdani zdile zekri zenba zepti zetro zgana zgike zifre
syn keyword lojbanGismu contained zinki zirpu zivle zmadu zmiku zukte zumri zungi zunle zunti
syn keyword lojbanGismu contained zutse zvati

syn keyword lojbanGismuUnofficial contained laldo loglo norgo spero talno turko xorvo

if !exists("did_lojban_syntax_inits")
  let did_lojban_syntax_inits = 1
  hi link lojbanComment Normal
  hi link lojbanPause ModeMsg
  hi link lojbanUnknown Special
  hi link lojbanBrivla Identifier
  hi link lojbanGismuError Special
  hi link lojbanCmavoSimple Statement
  hi link lojbanCmavoUnused Special
  hi link lojbanCmavoUnassigned PreProc
  hi link lojbanCmavoExperimental PreProc
  hi link lojbanCmene Constant
  hi link lojbanCmeneError Error
  hi link lojbanDiphtongError Error
  hi link lojbanVovelError Error
  hi link lojbanError Error
  hi link lojbanGismu Type
  hi link lojbanGismuUnofficial PreProc
endif

let b:current_syntax = "lojban"
