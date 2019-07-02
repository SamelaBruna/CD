entity V_Abs is
  port(Ain,Bin: in bit_vector(7 downto 0);
       Absout: out bit_vector(7 downto 0));
end V_Abs;

architecture ckt of V_Abs is
  
component somador8bits is 
  port(As:  in bit_vector(7 downto 0);
       Bs:  in bit_vector(7 downto 0 );
       Ci: in bit;
       Co: out bit;
       Ss:  out bit_vector(7 downto 0));
       
end component;

component comparador is 
  port(A,B: in bit_vector(7 downto 0);
       eq,bt,lt: out bit);
       
end component;
       
  


  

  component Mux2_1_Sinal is
    port (X: in bit_vector(7 downto 0);
          z: in bit;
          Y: out bit_vector(7 downto 0));
  end component;
  
  signal inMuxA,inMuxB,eq_a,lt_a,gt_a,lixo: bit;
  signal outMuxA, outMuxB, sumAB: bit_vector(7 downto 0);
  begin
    ComP: comparador port map(
      A => Ain,
      B => Bin,
      eq => eq_a,
      bt => gt_a,
      lt => lt_a
      );
      
    inMuxA <= lt_a;
    inMuxB <= (eq_a OR gt_a);
    
    MUXA: Mux2_1_Sinal port map(
      X => Ain,
      z => inMuxA,
      Y => outMuxA);
    
    MUXB: Mux2_1_Sinal port map(
      X => Bin,
      z => inMuxB,
      Y => outMuxB);
      
    SUM: somador8bits port map(
      As => outMuxA,
      Bs => outMuxB,
      Ci => '1',
      Co => lixo,
      Ss => sumAB);
    
    Absout <= sumAB;
    
end ckt;