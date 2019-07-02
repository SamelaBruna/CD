library ieee;
use ieee.std_logic_1164.all;

entity Encaps_MUX_COMP is
  port (CompM0,CompM1,CompM2,CompM3,CompM4,CompM5,CompM6,CompM7,CompM8,CompM9,CompM10,CompM11,CompM12,CompM13,CompM14,CompM15,CompN0,CompN1,CompN2,CompN3,CompN4,CompN5,CompN6,CompN7,CompN8,CompN9,CompN10,CompN11,CompN12,CompN13,CompN14,CompN15: in std_logic_vector(15 downto 0);
        MX_CMP_A, MX_CMP_B: in std_logic_vector(3 downto 0);
        COMP_LT,COMP_GT,COMP_EQ:out std_logic);
end Encaps_MUX_COMP;

architecture ckt of Encaps_MUX_COMP is
  component Comparador_16Bits is
    port (eA16,eB16: in std_logic_vector(15 downto 0);
          AeqB16,AltB16,AgtB16: out std_logic);
  end component;
  component MUX16_1_16BITS is
    port (C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15: in std_logic_vector(15 downto 0);
          E: in std_logic_vector(3 downto 0);
          O: out std_logic_vector(15 downto 0));
  end component;
  
  signal Saida_A,Saida_B: std_logic_vector( 15 downto 0);
  
  begin
    MUXA: MUX16_1_16BITS port map(
      C0 => CompM0,
      C1 => CompM1, 
      C2 => CompM2,
      C3 => CompM3,
      C4 => CompM4,
      C5 => CompM5,
      C6 => CompM6,
      C7 => CompM7,
      C8 => CompM8,
      C9 => CompM9,
      C10 => CompM10,
      C11 => CompM11,
      C12 => CompM12,
      C13 => CompM13,
      C14 => CompM14,
      C15 => CompM15,
      E => MX_CMP_A,
      O => Saida_A);
    
    MUXB: MUX16_1_16BITS port map(
      C0 => CompN0,
      C1 => CompN1, 
      C2 => CompN2,
      C3 => CompN3,
      C4 => CompN4,
      C5 => CompN5,
      C6 => CompN6,
      C7 => CompN7,
      C8 => CompN8,
      C9 => CompN9,
      C10 => CompN10,
      C11 => CompN11,
      C12 => CompN12,
      C13 => CompN13,
      C14 => CompN14,
      C15 => CompN15,
      E => MX_CMP_B,
      O => Saida_B);
      
    COMP: Comparador_16Bits port map (
      eA16 => Saida_A,
      eB16 => Saida_B,
      AeqB16 => COMP_EQ,
      AltB16 => COMP_LT,
      AgtB16 => COMP_GT);
end ckt;