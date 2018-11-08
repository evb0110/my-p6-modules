unit module Colorize;

#`( КОММЕНТАРИЙ
Модуль для Perl 6, предназначенный
для раскрашивания вывода.
Содержит две подпрограммы — старая 
colorize и новая color.
Пользоваться надо color, она наиболее
универсальная. Принимает 5 аргументов:
1. $pattern = что красить.
2. $font = жирный, курсив и т.д.
3. $density = обычная или light.
4. $color = цвет.
5. $target = в какой переменной красить.
Переменная $target изменяется (rw), чтобы
впоследствии из основной программы её 
можно было вывести на экран.
В программе вместо ансишного искейпа 
использован юникодный.
)

#############################
#  HERE THE PROGRAMS BEGIN  #
#############################

# $font
our $bold is export = '1';
our $normal is export = '2';
our $italic is export = '3';
our $under is export = '4';

# $density
our $filled is export = '3';
our $light is export = '9';

# $color
our $black is export = '9';
our $red is export = '1';
our $green is export = '2';
our $yellow is export = '3';
our $blue is export = '4';
our $magenta is export = '5';
our $cyan is export = '6';

our $boldred is export = 0x001b.chr ~ qq{[1;31m};
our $boldgreen is export = 0x001b.chr ~ qq{[1;32m};
our $boldblue is export = 0x001b.chr ~ qq{[1;34m};
our $boldmagenta is export = 0x001b.chr ~ qq{[1;35m};
our $boldcyan is export = 0x001b.chr ~ qq{[1;36m};
our $undermagenta is export = 0x001b.chr ~ qq{[4;35m};

our $nocolor is export = 0x001b.chr ~ q{[0m};

sub color( $pattern, 
           $font, 
           $density, 
           $color, 
           $target is rw) is export {
  my $total = '[' ~ $font ~
           ';' ~ $density ~ $color ~ 'm';
  $total = 0x001b.chr ~ $total;

  $target ~~ s:g|<$pattern>|$total$/$nocolor|;
}

###########################
# SUBROUTINE COLORIZE     #
# IS DEPRECATED           #
# BUT WORKS SO FAR        #
###########################

sub colorize( $pattern, $color, $target is rw) is export {
  $target ~~ s:g|<$pattern>|$color$/$nocolor|; 

}


