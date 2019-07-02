library ieee;
use ieee.std_logic_1164.all;

entity Comparador_4Bits is
  port (eA,eB: in std_logic_vector(3 downto 0);
        gt,lt,eq: in std_logic;
        AeqB,AltB,AgtB: out std_logic);
end Comparador_4Bits;

architecture ckt of Comparador_4Bits is
  
  component Comparador is
    port (in_gt, in_eq, in_lt,a,b: in std_logic;
          out_eq,out_lt,out_gt: out std_logic);
 	end component;
  
  signal saida_gt,saida_lt,saida_eq:std_logic_vector(3 downto 0);
  begin
  Comp1:Comparador port map(
        in_gt => gt,
        in_lt => lt,
        in_eq => eq,
        a => eA(3),
        b => eB(3),
        out_eq => saida_eq(3),
        out_gt => saida_gt(3),
        out_lt => saida_lt(3));
  
  Comp2:Comparador port map(
        in_gt => saida_gt(3),
        in_lt => saida_lt(3),
        in_eq => saida_eq(3),
        a => eA(2),
        b => eB(2),
        out_eq => saida_eq(2),
        out_gt => saida_gt(2),
        out_lt => saida_lt(2));
  
  Comp3:Comparador port map(
        in_gt => saida_gt(2),
        in_lt => saida_lt(2),
        in_eq => saida_eq(2),
        a => eA(1),
        b => eB(1),
        out_eq => saida_eq(1),
        out_gt => saida_gt(1),
        out_lt => saida_lt(1));
  
  Comp4:Comparador port map(
        in_gt => saida_gt(1),
        in_lt => saida_lt(1),
        in_eq => saida_eq(1),
        a => eA(0),
        b => eB(0),
        out_eq => saida_eq(0),
        out_gt => saida_gt(0),
        out_lt => saida_lt(0));
        
  AeqB <= saida_eq(0);
  AltB <= saida_lt(0);
  AgtB <= saida_gt(0);
end ckt;
    
 
