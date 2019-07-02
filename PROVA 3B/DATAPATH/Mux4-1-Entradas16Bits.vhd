library ieee;
use ieee.std_logic_1164.all;

entity MUX4_1_16BITS is
  port (C0,C1,C2,C3: in std_logic_vector(15 downto 0);
        E: in std_logic_vector(1 downto 0);
        O: out std_logic_vector(15 downto 0));
end MUX4_1_16BITS;

Architecture ckt of MUX4_1_16BITS is
  component MUX16Bits is
      port (I1,I0: in std_logic_vector (15 downto 0);
            SS: in std_logic;
            d: out std_logic_vector(15 downto 0));
  end component;
  
  signal SaidaMux1,SaidaMux2: std_logic_vector(15 downto 0);
  
  begin
    MUX1: MUX16Bits port map(
      I0 => C0,
      I1 => C1,
      SS => E(0),
      d => SaidaMux1);
    MUX2: MUX16Bits port map(
      I0 => C2,
      I1 => C3,
      SS => E(0),
      d => SaidaMux2);  
    MUX3: MUX16Bits port map(
      I0 => SaidaMux1,
      I1 => SaidaMux2,
      SS => E(1),
      d => O);
end ckt; 