library ieee;
use ieee.std_logic_1164.all;

entity Encaps_MUX_SUM is
  port (M0,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14,M15,N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15: in std_logic_vector(15 downto 0);
        Cin: in std_logic;
        MX_SUM_A, MX_SUM_B: in std_logic_vector(3 downto 0);
        Sum_out: out std_logic_vector(15 downto 0);
        Cout: out std_logic);
end Encaps_MUX_SUM;

architecture ckt of Encaps_MUX_SUM is
  component Sum16Bit is
    port (A16,B16: in std_logic_vector(15 downto 0);
          C16_in: in std_logic;
          S16: out std_logic_vector(15 downto 0);
          C16_out: out std_logic);
  end component;
  component MUX16_1_16BITS is
    port (C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15: in std_logic_vector(15 downto 0);
          E: in std_logic_vector(3 downto 0);
          O: out std_logic_vector(15 downto 0));
  end component;
  
  signal Saida_A, Saida_B: std_logic_vector(15 downto 0);
  signal lixo: std_logic;
  
  begin
    MUXA: MUX16_1_16BITS port map(
      C0 => M0,
      C1 => M1, 
      C2 => M2,
      C3 => M3,
      C4 => M4,
      C5 => M5,
      C6 => M6,
      C7 => M7,
      C8 => M8,
      C9 => M9,
      C10 => M10,
      C11 => M11,
      C12 => M12,
      C13 => M13,
      C14 => M14,
      C15 => M15,
      E => MX_SUM_A,
      O => Saida_A);
    
    MUXB: MUX16_1_16BITS port map(
      C0 => N0,
      C1 => N1, 
      C2 => N2,
      C3 => N3,
      C4 => N4,
      C5 => N5,
      C6 => N6,
      C7 => N7,
      C8 => N8,
      C9 => N9,
      C10 => N10,
      C11 => N11,
      C12 => N12,
      C13 => N13,
      C14 => N14,
      C15 => N15,
      E => MX_SUM_B,
      O => Saida_B);
      
    
    SUM: Sum16Bit port map(
      A16 => Saida_A,
      B16 => Saida_B,
      C16_in => Cin,
      S16 => Sum_out,
      C16_out => lixo);
    
end ckt; 