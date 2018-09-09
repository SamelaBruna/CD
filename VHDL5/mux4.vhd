  entity mux4 is 
    port(A_4: in bit_vector(15 downto 0);
       B_4: in bit_vector(15 downto 0);
       C_4: in bit_vector(15 downto 0);
       D_4: in bit_vector(15 downto 0);
       Se_4: in bit_vector(1 downto 0); 
       Sa_4: out bit_vector(15 downto 0));
       
  end mux4;
     
architecture funcionamento of mux4 is 
              
  component mux is 
    port(A: in bit_vector(15 downto 0);
         B: in bit_vector(15 downto 0);
         Se: in bit ; 
         Sa: out bit_vector(15 downto 0));
         
   end component;
   signal sa1_out, sa2_out : bit_vector(15 downto 0);
      begin 
        
        MUX01: mux port map(
          A => A_4,
          B => B_4,
          Se => Se_4(0),
          Sa => sa1_out);
          
        MUX02: mux port map(
          A => C_4,
          B => D_4,
          Se => Se_4(0),
          Sa => sa2_out); 
          
        MUX03: mux port map(
          A => sa1_out,
          B => sa2_out,
          Se => Se_4(1),
          Sa => Sa_4);
          
  end funcionamento;
        
          
        
         
          
       
      
       
