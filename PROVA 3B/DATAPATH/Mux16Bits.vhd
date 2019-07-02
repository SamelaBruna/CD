library ieee;
use ieee.std_logic_1164.all;

entity MUX16Bits is
  port (I1,I0: in std_logic_vector (15 downto 0);
        SS: in std_logic;
        d: out std_logic_vector(15 downto 0));
end MUX16Bits;

Architecture ckt of MUX16Bits is
  
Begin
  d(0) <= (((not SS) and I0(0)) or (SS and I1(0)));
  d(1) <= (((not SS) and I0(1)) or (SS and I1(1)));
  d(2) <= (((not SS) and I0(2)) or (SS and I1(2)));
  d(3) <= (((not SS) and I0(3)) or (SS and I1(3)));
  d(4) <= (((not SS) and I0(4)) or (SS and I1(4)));
  d(5) <= (((not SS) and I0(5)) or (SS and I1(5)));
  d(6) <= (((not SS) and I0(6)) or (SS and I1(6)));
  d(7) <= (((not SS) and I0(7)) or (SS and I1(7)));
  d(8) <= (((not SS) and I0(8)) or (SS and I1(8)));
  d(9) <= (((not SS) and I0(9)) or (SS and I1(9)));
  d(10) <= (((not SS) and I0(10)) or (SS and I1(10)));
  d(11) <= (((not SS) and I0(11)) or (SS and I1(11)));
  d(12) <= (((not SS) and I0(12)) or (SS and I1(12)));
  d(13) <= (((not SS) and I0(13)) or (SS and I1(13)));
  d(14) <= (((not SS) and I0(14)) or (SS and I1(14)));
  d(15) <= (((not SS) and I0(15)) or (SS and I1(15)));  
end ckt;