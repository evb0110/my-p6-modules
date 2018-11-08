unit module Semsort;

my @order = 
    <` ʔ>          ,
    <a ā â ă ʕ>    ,
    <b ḇ>          ,
    <c č ç>        ,
    <d ḏ ḍ ḏ̣>      ,
    <e ē ê ĕ ə>    ,
    <g ḡ ġ ǧ>      ,
    <h ḥ ḫ>        ,
    <i ī î ĭ ı>    ,
    <k ḵ ḳ>        ,
    <o ō ô ŏ>      ,
    <p p̄ ṗ>        ,
    <r ṛ>          ,
    <s ṣ ŝ ś š ş>  ,
    <t ṯ ṭ>        ,
    <u ū û ŭ>      ,
    <x ẍ>          ,
    <z ž>          ,
    ;

my $start = "0".ord;
my %fake;

for @order -> @suborder {
    my $anchor = @suborder[0];
    for @suborder.kv -> $k, $char {
        %fake{$char} = 
           $anchor ~ chr($k + $start);
    }
}

sub fake($char) {
    return %fake{$char} // $char;
}

sub semitic($word) {
    return $word.comb».&fake.join;
}

sub Rr {
    return Order::Same 
       if $^a.lc ne $^b.lc
       ;
    return $^a cmp $^b;
}

sub semsort(@words) is export {
    return
      @words.sort(*.lc.&semitic).sort(&Rr);
}
