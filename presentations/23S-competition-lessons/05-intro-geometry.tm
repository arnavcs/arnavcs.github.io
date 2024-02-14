<TeXmacs|2.1>

<style|<tuple|generic|number-europe|compact-list|framed-theorems>>

<\body>
  <\hide-preamble>
    \;

    <assign|theorem-sep|<macro|<enunciation-sep>>>
  </hide-preamble>

  <doc-data|<doc-title|Introductory Euclidean
  Geometry>|<doc-author|<author-data|<author-name|Arnav Kumar>>>>

  An understanding of similarity, congruence, and several other definitions
  is assumed.

  <section|Directed Angles>

  Please see Evan Chen's handout on the topic
  (<slink|https://web.evanchen.cc/handouts/Directed-Angles/Directed-Angles.pdf>).
  There is also the idea of directed line segments and lines, but this is
  more similar to vectors and need not be covered.

  <section|Triangles>

  <\theorem>
    <dueto|Sum of Interior Angles in a Triangle>Given a triangle
    <math|\<vartriangle\>A B C>, the sum of the interior angles of the
    triangle always sum to <math|180\<degree\>> or <math|\<pi\>> radians. In
    terms of directed angles, we can say that
    <with|math|<macro|body|<with|mode|math|<arg|body>>>|<math|\<measuredangle\>A
    B C+\<measuredangle\>B C A+\<measuredangle\>C A B=0>>.
  </theorem>

  <\corollary>
    Given a triangle <math|\<vartriangle\>A B C> with <math|D> on the
    extension of <math|A B> past <math|B>, then we have that
    <math|\<leangle\>D B C=\<leangle\>B C A+\<leangle\>C A B>.
  </corollary>

  <\theorem>
    <dueto|Pythagorean Theorem>Triangle <math|A B C> is a right triangle with
    <math|\<leangle\>A B C=90\<degree\>>. Now iff we have <math|A B<rsup|2>+B
    C<rsup|2>=A C<rsup|2>>.
  </theorem>

  <\theorem>
    <dueto|Area of a Triangle>Let <math|A B C > be a triangle. Let <math|h>
    be the length of the perpendicular dropped from <math|A> to <math|B C>.
    Let <math|b> be the length of segment <math|B C>. The area of <math|A B
    C>, sometimes denoted <math|<around*|\||A B C|\|>> is
    <math|<frac|1|2>*b*h>.
  </theorem>

  There are also some well known triangles which might be useful to know the
  dimensions of. The most notable of these is the equilateral triangle. If an
  equilateral triangle has side length 2, then the height is <math|<sqrt|3>>,
  and the area is <math|<sqrt|3>>.

  <section|Scaling, Transformations, and Translations>

  While presented informally here, it may be useful to take a look at units
  to know how much certain values change. For example, if we scale a triangle
  <math|3\<times\>>, the area increases <math|9\<times\>>, because area is
  length <math|\<ast\>> length and the scaling happens in both directions.

  Now we'll get into a very powerful technique in geometry, which is a form
  of manipulation of our diagram. We can choose translate or rotate parts of
  our diagram as we wish to form figures which might be conducive for us.
  There are many examples of this, but here is an example from the
  <with|font-shape|italic|A Taste Of Mathematics> series:

  <\example>
    In quadrilateral <math|A B C D>, we have <math|A D=B C>, and
    <math|\<leangle\>A B D+\<leangle\>B D C=180\<degree\>>. Show that
    <math|\<leangle\>B A D=\<leangle\>B C D>.

    The trick to this problem is to take the triangle <math|B C D>, and
    transform it (while maintaining angles and lengths) so that the corners
    on <math|B> and <math|D> swap positions. Let the position of the last
    vertex be <math|C<rprime|'>>. Now, we see that
    <math|180\<degree\>=\<leangle\>A B D+\<leangle\>B D C=\<leangle\>A B
    D+\<leangle\>D B C<rprime|'>> which means that <math|B> lies on <math|A
    C<rprime|'>>. Additionally, <math|A D=B C=D C<rprime|'>> which means that
    <math|\<vartriangle\>A D C<rprime|'>> is isosceles. Finally, we get
    <math|\<leangle\>B A D=\<leangle\>B C<rprime|'> D=\<leangle\>B C D>.
  </example>

  <section|Exercises>

  <\exercise>
    <dueto|1999 IMC A2>Find the sum of the angles in the following diagram:

    <\padded-center>
      <image|<tuple|<#89504E470D0A1A0A0000000D49484452000000BB000000BF080200000029633A2B000000097048597300000EC400000EC401952B0E1B0000142049444154789CED9D7F4C13F7FFC7DF60A140965E27DD6CB45B2FDBB0B8188A894B41678E4509336496A5647C32E23AB364B86C599DFEC1CCFED07FA4665928FCB1A0CB224B74E19BADA648C24AC0A5B8699971B3604C40CCD666402481ACB49956A0F6BE7FBCB543FAF3DABB7BBFAF7D3FFEBBB677F78A3C7DDFBDDFF77C3DAF8065594020A44D21EA020812832886C00DA2180237886208DC208A2170832886C00DA2180237886208DC208A2170832886C00DA218C49C3E7DFAD5575FE5BAD7D75F7FFDE79F7F0A514F4A886210F3F0E1C3BB77EF86C3E1F477F9F1C71F3FF9E493AEAE2EE1AA4A02510C62689A0E87C3B3B3B369FE7E6C6CCC6C36D7D6D67676760A5A582288621043D33400C0E7F3A5F3E3BB77EF1E387040A3D10C0C0C141515095A582288621093BE6282C1606363230060707050A552095C574264A84E4C8068341A994C965231ABABABCDCDCD3E9FEFCA952B151515A294161FA218C4C864B22D5BB6A4544C5B5BDBC8C8C8B973E76A6B6B45A92B21E4AA841E9AA6932BE6F4E9D3BDBDBDEDEDED870E1D12ABA88410C5A047AD56CFCFCF27FAF6E2C58B5F7CF185C964EAE8E810B3AA4410C5A02789626EDDBA75F0E04183C170FEFCF9C2422CFE58581491E7D0341D0804969696D67D3E3B3BDBD8D8585E5E3E3030505A5A8AA4B6588862D01377821D0C06F7EEDD1B0C06D1CEA563218A414FAC622291C8DEBD7BA7A7A73FFCF0C3AAAA2A5485C58528063DB18A397AF4E8EFBFFF5E5353F3D5575F8D8E8E22AA2B3E4431E8512A9514454515D3D5D5D5DDDD6DB1589C4EA756ABFDECB3CF905617034BC000BD5E6F341A59961D1E1E2E2C2C34994C8F1E3D6259D6E57201001C0E07EA02FF838C31580017F16EDDBAD5DCDCBC7DFBF6E85CBAAEAE4EABD5F6F7F7A32EF03F8862B040AD567BBDDEC6C6468542313838B8762EDDD4D474E9D22584B5AD833C57C202954A150C06575656AE5FBFAED168D67EA5542A63976A1042C618F4442291A1A12100406767276E73E9588862D073F4E8D13FFEF80300B06DDBB6D86F7D3E9F5EAF17BDA88410C520E6CC9933DDDDDDEFBEFB2E48E0AB1A1F1F870B3698401483929191914F3FFDB4BEBEFEDB6FBF8DEBABF2F97C131313757575088A4B04EAE97DFE323D3DAD5028AAAAAA028100CBB25AADD66C36AFFB0DC3301445F9FD7E04F52580CC95D0B0B8B8D8D8D8585C5C3C3838A85028403C5F555757D7952B577A7B7B954A259A2AE3825AB2F9C883070F6A6B6B4B4B4BDD6E77F443B3D9ACD56AA39B274E9C0000300C237E79C9218A4180C9642A2C2CB4DBED6B3F3C71E2844C265B5D5DF5783C4D4D4D0080D88B140E10C5880D1C3CAC56EBBACF7B7A7A00002FBCF0021CFB7B7B7BD33A5CC8EBB4B630068631E8753A036368B079F9AEF869886244E5DCB973008043870EC57EE5703800006FBDF51687E78E218FD5B049677678432CCBB293563DA05A9C21FECA8D07518C78B8DDEEA2A2A2FAFAFA959595D86F3D1E0FE0F6983A3466D1C97596B1C71209395B28A0177A8841F7ECFAE38F3F3E73E60CAAB38B0F6C80A569DA6EB7C76D80E5D44E0B00004BFDA7BFF3551F39525302B77DE35301AAB252CD4BB98941A3985028343E3EFED1471F1D3B760C49012203E7D20080E85C3A9675BEAA943CFCAD7F3440D7D5D04FB6A7C6A7005D5359927DB94941A398D2D25297CBD5DADADAD9D9595F5F1F0C069194210EABABAB070E1CF0F97C030303C91B6053B6BAAD657ECA17006A3A3AA4F8A6A696451862D03D25282E2EBE70E1424747C7CF3FFF6C3018388CC652A3ADAD6D6C6CECECD9B3291B603929A6A4A4048079DF933EA7F9D1215186180C56F0FAFBFBCBCACACACBCBAF5DBB86BA16FE8173E913274EA4F3638BC5425154BA87F6B4EB00D8D460738E8DF559CD0D7A4A8489128BC95CE9E6CD9B9B376F86A30EEA5AF8C46EB703004C26539ABFB7D96C0080B49F22F9C7AC0D5AB99CD23216C7A4A38502725D83D525F423282C14C3B2ECDCDCDC8E1D3B0000C78F1F8F4422A8CBE101B7DB5D5A5A5A5B5BFBE0C1833477E9EBEB0300783C1E410BCB125C14C3B2ECFDFBF78D462300C06834DEBF7F1F753959313333A352A92A2A2A161616D2DF0B760E389D4EE10ACB1E8C14C3B26C2412397EFC380060C78E1D737373A8CBC9904020505555A55028A6A7A739EDE8F57A41FACF071081976220172E5C282E2EDEBC79F3CD9B3751D7C299959595FAFAFAA2A2A2E1E161AEFBAEAEAECA64B2346F935181A3625896BD76ED5A7979795959597F7F3FEA5AB8D1D6D606003877EE5C66BBC7F5556105A68A6159D6EBF5565656161414747474A0AE255DE064A7BDBD3DE323300C83A127662DF82A8665D94020B06FDF3E00406B6BEBF2F232EA725260B7DBD736C066C63A5F158660AD189665C3E1F0E1C3870100BB76ED5A5C5C445D4E42262626B8CEA5E312F555F15518EFE0AE18484F4FCF860D1B689A9E9C9C445D4B1C666666341A8D46A3E134978E4B6F6F2F00C0EBF5F251972048A3FBE4F0E1C3434343FFFCF38FC160B87CF932EA729E020633F31526C5D9F3203AD2500C0060DFBE7DD7AF5FDFB871E39B6FBE898FB1261289343737DFBE7DDB6EB7F3D200AB56AB010049A237D1837A90E3C6E2E2E2AE5DBB0000870F1F0E87C3A8CB612D160B00C066B3F17540BFDFCFEF017947628A6159767979B9B5B51500B06FDF3ED81B860AE8E5B6582CFC1E96A228DE8FC923D2530CA4A3A3A3A0A0A0B2B212D54DE2F0F03034ED6633978E4B34AF0A4FA4AA1816A9B1666262626D032CBF188D46BD5ECFFB61F9423277BEB1188DC6AB57AFCAE5F237DE78E3FBEFBF17EDBCD0B40BC3A4129976B38193130F01A8259B2D221B6BA20DB0131313029D82A3AF4A6C24AF18564463CDA3478FE236C0F20B6C75C3D657950B8A61C532D6B4B7B703E1A7BEDC5BDD442547140311D458031B60DBDADA783FF23A305F92C929C5B082196BA273E9B80DB0BC2397CBB3B14C084AAE298615C05803C3A42A2A2A445B30C4D95795838A617935D62C2C2C545454A8542AAEA6DD6CC0D957959B8A617932D6C40D9312019C7D5539AB184896C61A93C9040010742E1D179C7D5539AE189665474646140A8542A1181919E1B423A706587EC1D95795FB8A615976727292A6E90D1B36F4F4F4A4B90B6C808D1B262502B0D5CDE57221397B72F242312C47634DB401569CB9742C38B7BAE58B62D8B48D35D3D3D31934C0F20BCEAD6E127E76CD9574126BA069170080F60DB03299ACBCBC1C53EF266AC9222091B126DA002BF25C3A2ED8FAAAF251316C82C49A43870E812C1A60F9055B5F559E2A868D31D658AD5680682E1D176E79552292BF8A61D7186B5E7BEDB5828282F4C3A444005B5F551EDDF9C6525656E67038DE7BEFBD1B376E9495957DF9E597A82BFA0F6C5BDDF25A310080B9B9B99F7EFA69E3C68DABABAB7BF6EC816E261C208AC11138975E595971B95C2E976B7979F9F5D75FC7E455C1D82A267FEF631E3D7AB42E4C0AB7C41A3C5BDDF25731B00176DD9326AC126BF05C92C953C5C09948DCFFC1F824D6343434180C068405C4251F15333C3C9C324C0A87C41A3C7D5579A79868036CCA30A98C8D357C81A7AF2ABFE64AB3B3B3D106D8D2D2D2E43F469E5843D374381C9E9D9D15FFD4C9402D59F178F0E0010C66E6D400BBD65823F2BD309EBEAA7C514CB401368360E6A8B146E47B613C7D55F9A298ECC3A460628D98F7C278FAAAF24231304C2AFB065868AC11F35E18C356B7DC570CBF0DB0D058C3C9649E0D18B6BAE5B8628408939A9B9B132DBDB1A5A545A7D3097A0AAEE4B262161616341A8D4AA59A9999E1F7C8A2A53762E8ABCA59C588D0002B427A2386BEAA9C558C086152ACF0E98D18E655E5A6626003ACD56A15E15C82BE1615C3BCAA1C540C0C9312B30156B8F4460CF3AA724D316EB75BCC30A928C2A537E2E6ABCA29C5441B6091A4CF0B94DE889BAF2A771483244C2A16DED31B716B75CB11B7C3EAEAEA8103076667670706062A2A2A1056D2DADACAAFC91CBB0871D492E507D8002B7E985422783499C366CD5028C44B61D9930B8A4118269504BE4CE6B8E555495E31304C0AAB06D828BC98CC71F355F1A318785120481A954A95CEDF5AC6CBC98C46E38B2FBEC8CBA1D227180C9E3D7BB6A4A4E4830F3E282B2B5BF7EDD2D2527777B7D168ACAEAE16A198F1F1F14B972E592C16A55219FBED5F7FFDF5C30F3F0000DE79E79D975E7A89D3912391C8A953A7F6ECD9535757C74BA98988FD378C0F2F638CF804020168DA4D349716F9F29FD26199417A6314AC7C5592544C344C2A8969577C9F40CABF6BC6AF45C5CA572549C5B4B5B581A46152F06E51E4C57568254E7E8B9A99B106AB5637E929065A4692BC1AC4EFF7D334ADD7EBC5B795E8F57AA55299F2BCD058F3F2CB2FA779D1C4AAD54D628AB1DBEDC91B60BD5E6F5D5D1D4551483C255EAF97A2A8EAEAEAE452F0FBFDDBB76F07003CFBECB3E9186BE03DD9BD7BF7782B340BA4A498898989E2E262B95CFECD37DFC4FD81CD66532A95144521ECF171B95C14452995CA93274F26FA019C4F1D3B762C4D638DD3E904D8F8AA24A3989999198D46F3DC73CFC19B479AA6DF7FFFFD93274FF6F7F79F3C79B2A9A90946F4188D46E41E47BFDF6F369B6191757575B1456AB55A68924AD3588395AF4A1A8A89CEA56103ACC3E1601846ABD546D7081886319BCD98FC9B425C2E97D96C661866ED5A06C330369B6DADA6D331D660E5AB928062609854A206584CC6EAE4783C9E24235F3AC61A7C7C5512504CF60DB09220B9B1061F5F15EE8A491226957B24792D2A3EBE2AAC1503C3A4EAEBEB938449E5185EAF77EBD6ADB1C61A7C5ADDF0558C100DB04271CFD5D366A080DCE8E0C1F7B47BF76E994C069E36D6E0D3EA86A9626003AC46A3E1DC001B9A74B41B1903C33006BDCE60EC11EBBED8D5B609E8DAB33E1B5486DD6E5F67ACC1A7D50D47C5441B60398549B12CCBFA5D163DA5333BE0E2A8DFD1A2CFFE6F981EF77A0C406EECCB7A88A1282A7A87BB36BD716C6C0C00E0743AB33D41D660A79868981477D3AEDF697EFAFFB9C7667588348CBBCC54F6434CAC65229ADE78FEFCF9E46E0AD1C04E31EDEDED19CEA5EFF5327239D383E4E18BD766007263DFA4B3BD4147C9E59B0C16670675C047EEEB2E3D51634D6161210E5E66BC14031B60330B930A398C723EEE2432C269A600A5635ADAFB5C9EB15EB30E00AA85FBF0062DEEB19F478D355BB76E153AB12625182926CB30A97B3D0600500E314C8FF7F1A6BFB7410EB46D635C0F936442B4BCBCFCFCF3CF7335D608012E1D6E77EFDE6D6E6EDEB66D9BDD6E2F2A2ACAE00825254A39585A5AE2BDB434981A9F02956FD6D18F37956A650978081E723D0CB4248F8F8FC77E555C5CBC7FFF7EA55299E4B5A8E28085621617171B1B1B8B8B8B070707150A45660751D635D5C827CE9CEEF73D040F977CBF7DF7F991EFA6F8AD3311BEA9A90055594D3FD95E9A9F0F00BA924EBC477CA0F77B747434EEB7344DFFFBEFBF76BBFDEFBFFFDEB973A7DBEDCEACDA6C4138BE41780C93F23A2C8C9692CBE59B740D6DBD1EB156BB42CE160AE86DDEE8B6A385027A6B4619AE0CC3D0341DF7C214F5BA0B9A589312F48A31994C00A70658EE786D7A40B5389FACC5787B0C72CAD897D90D95C7E3A128AAA9A929F6ABB5AD6EC225D6A404B162F06C80E5061C621E0F29F7E01A622673EB27C0FBDFD8A517B85AD3D7D70737854BAC490E4AC5C0065831C3A484C1EB68371AF47A03C33006C668E9CBFE72082D7C4D4D4D6B2F4FA150083CBD522550624D729029C6ED76979696D6D6D68A1C2625156C365BD42F3C3A3A0AA513D757C57B624D72D028261A26B5B0B080A40049E0F57AD79A3E699A56A954717D55498C35BC53C0B2ACC8B3B36030B873E74EBFDFEF76BBD1A6034985D1D1D1F1F1F1A5A5A581818148241277C1C6E7F3EDDFBFFFCE9D3BA74E9D82972AA1105A92EB8836C00A17CC2C1DEEB97ADA8D5A90FEB38DE4BE2A715E8B2AB662606E489206D83C839B4B22A5AF4A84D7A28AAA1818D025EDB934CF707349A4E9AB12F4B5A8E22926DA002BDA1925001C62D2F67AA6DFEA26DC6B5145524C742E9DF20DB0B94FC8EBB4B630068631E8759B2839D0A5FF3C8153AB5B368935491043313333332A954AA3D190B9341BF2580D94CEECF0B22CCBB293563D573B39455149722DD69171624D120457CCBA06D8FC263466D1CAB596B1C71279EAF9429AE8743A4E7955BCBF0A4A58C5A413269547F8FB1AE4C0F0DF43EE49AB1EC85BB875AC649657C5E3ABA084550C0C9312E7958AF81372B43C35310A395AE49C5D1119E755F5F7F73FF3CC33E5E5E5376EDCC860F728023AAABABABACE9E3D6BB158E00A0161DEE70B0035AD7EB2ED9B9A5A5E6BC44A0B9AA6E7E6E6C2E130D7B31B8DC65F7EF9A5BABAFA95575EE1BAEF5A8452CCC8C8C8B163C74C26536767A740A7901C25252500CCFBE61F6FFA4687A6005D5359C2E920344D87C3E1D9D9D90C0AD8B163C7E5CB97E3E6C7A68F208AB975EB567373F3F6EDDBCF9F3F5F588885311407D435353A70E7BBCFBB867E1BFDBFCFFFF77ED7F8325559A94EBDE35A606611CA775B6473498B0B0C93CAA40136F7F18F591BB47239A5652C8E49470B05E4DA06AB8B939D266570B0D0F093191E25140A3536360683C15F7FFD55A3D1F07B70E9A3ACF97CC8F7F993ADA6A50C6C031A8D462693211C63F8544C24123978F0E0EDDBB7878686AAAAAA783C32218A4C26DBB265CBFCFC7CEA9F0A54008FC73A7AF4E8C58B176D365B7D7D3D8F8725AC43AD5623540C6FB7A577EEDCE9EEEEB6582C478E1CE1EB9884B8A8D5EA5CB82AE974BAAB57AFEEDEBD9BAF03121241D374A22E3811E073EA4BE4220E344D070201440DC37874D112388176498628467A10C510B8411443E0067C5B07510C8103085F9B4E142349689A46B58847142349102EFB12C54812B55A9D99AF2A7B8862244936BEAA2C218A91240827D8443192842886C00D84BE2AA21849027D554431040EA05AC4238A912AA816F18862A40AAA453CA218A9A256AB91F8AA8862A40AAA0936518C54218A2170832886C00D54BE2AA2180983644986E7BE6B8298BCFDF6DB19BFC02C6310A4CC13240DB92A11B8411443E006510C811B4431046E10C510B8411443E006510C811B4431046E10C510B8411443E0C6FF035F15BB72CA4C86B70000000049454E44AE426082>|png>|64pt|64pt||>
    </padded-center>
  </exercise>

  <\exercise>
    <dueto|1999 IMC A4>A 60 meter tall building casts a shadow of length 40
    meters. What is the length of the shadow cast by a pole of height 2
    meters?
  </exercise>

  <\exercise>
    <dueto|1999 IMC A7>Three circles of equal radius, <math|r>, are mutually
    tangent to each other and to the triangle of side length <math|1> which
    circumscribes them (and touches each circle twice). Find the value of
    <math|r>.
  </exercise>

  <\exercise>
    <dueto|1999 IMC A10>Right triangle <math|A B C> has legs <math|A C> and
    <math|A B> of length <math|8> and <math|15> respectively. Points <math|E>
    and <math|G> lie on <math|A C> and points <math|D> and <math|F> lie on
    <math|A B> such that the segments <math|C D>, <math|D E>, <math|E F>, and
    <math|F G> split up <math|A B C> into five triangles of equal area. Find
    which of the segments <math|C D>, <math|D E>, <math|E F>, and <math|F G>
    has integral length.
  </exercise>

  <\exercise>
    <dueto|1999 IMC B2>Right triangle <math|A B C> has <math|B C\<perp\>A C>.
    <math|D> lies on <math|B C> such that <math|B C=4*B D> and <math|E> lies
    on <math|A C> such that <math|AC=8*C E>. Find the length of <math|A B> if
    <math|B E> and <math|A D> have lengths 52 and 164 respectively.
  </exercise>

  <\exercise>
    <dueto|2000 IMC A7>Find <math|\<leangle\>B A D> if <math|D> is a point on
    <math|B C> of <math|\<vartriangle\>A B C> such that <math|A C=C D> and
    <math|\<leangle\>C A B=\<leangle\>A B C+45\<degree\>>.
  </exercise>

  <\exercise>
    <dueto|2000 IMC A9><math|P> is a point in rectangle <math|A B C D> such
    that <math|P A=4>, <math|P B=6>, and <math|P D=9>. Find <math|P C>.
  </exercise>

  IMC refers to the Junior High School Division International Mathematics
  Competition.
</body>

<\initial>
  <\collection>
    <associate|item-vsep|<macro|0fn>>
    <associate|ornament-extra-color|pastel yellow>
    <associate|ornament-shape|rounded>
    <associate|page-height|auto>
    <associate|page-medium|paper>
    <associate|page-type|letter>
    <associate|page-width|auto>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|1>>
    <associate|auto-4|<tuple|4|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Directed
      Angles> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Triangles>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Scaling,
      Transformations, and Translations> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Exercises>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>