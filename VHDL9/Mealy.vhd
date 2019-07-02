entity Mealy is 
  port(U,Y,clock,clear:in bit;
       S: out bit;
       estados: out bit_vector(1 downto 0));
      
end Mealy;

architecture funcionamento of Mealy is
  component JK is 
    port (clk,J,K,P,C: IN BIT;
          q: OUT BIT);
  end component;   
 
 signal out_JK1,out_JK0,logic_JK0,notU: bit; 
  
begin  
  
   notu <= not U;
   
  JK1: JK port map
  (
    clk => clock,
    J => notU,
    K => notU,
    P => '1',
    C => clear,
    q => out_JK1
  );
  
  logic_JK0 <= ((not out_JK1) and (not U) and (not Y)) or (out_JK1 and not U and Y);
 
  
  JK0: JK port map
  (
    clk => clock,
    J => logic_JK0,
    K => logic_JK0,
    P => '1',
    C => clear,
    q => out_JK0
);
  
  S <= U;
  
  estados(1) <= out_JK0;
  estados(0) <= out_JK1;
  
  
end funcionamento;  
       