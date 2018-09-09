entity exp is
  port(A_exp: in bit_vector(4 downto 0);
       B_exp: in bit_vector(1 downto 0);
       S_exp: out bit_vector(15 downto 0));
end exp;

architecture funcionamento of exp is 
   
  
 component mux4 is 
  port(A_4: in bit_vector(15 downto 0);
       B_4: in bit_vector(15 downto 0);
       C_4: in bit_vector(15 downto 0);
       D_4: in bit_vector(15 downto 0);
       Se_4: in bit_vector(1 downto 0); 
       Sa_4: out bit_vector(15 downto 0));
       
  end component;
  
 component mux is 
    port(A: in bit_vector(15 downto 0);
         B: in bit_vector(15 downto 0);
         Se: in bit ; 
         Sa: out bit_vector(15 downto 0));
     
  end component;
  
  component multiplicador is 
  port (A_M: in bit_vector(7 downto 0); 
        B_M: in bit_vector(7 downto 0);
        S_M: out bit_vector(15 downto 0));
  end component;
  
  component somador16bits is 
  port(A:  in bit_vector(15 downto 0);
       B:  in bit_vector(15 downto 0 );
       Ci: in bit;
       Co: out bit;
       S:  out bit_vector(15 downto 0));
       
  end component;
  
  signal A_exp_16, not_A_exp, A_exp_A2, abs_A_exp, pow2_abs_A, pow3_abs_A, not_pow3, pow3_A2, signed_pow3: bit_vector(15 downto 0);

begin
    
    -- expansão do sinal para 16 bits
    A_exp_16(15)<=A_exp(4);
    A_exp_16(14)<=A_exp(4);
    A_exp_16(13)<=A_exp(4);
    A_exp_16(12)<=A_exp(4);
    A_exp_16(11)<=A_exp(4);
    A_exp_16(10)<=A_exp(4);
    A_exp_16(9)<=A_exp(4);
    A_exp_16(8)<=A_exp(4);
    A_exp_16(7)<=A_exp(4);
    A_exp_16(6)<=A_exp(4);
    A_exp_16(5)<=A_exp(4);
    A_exp_16(4 downto 0)<=A_exp;
    
    --negação do sinal    
    not_A_exp<=not A_exp_16;
    
    --complemento A2 do sinal
    Aexp_A2: somador16bits port map(
        A=>not_A_exp,
        B=>"0000000000000001",
        Ci=>'0',
        S=>A_exp_A2);
    
    --modulação de A
    ABS_A: mux port map(
        A=>A_exp_16,
        B=>A_exp_A2,
        Se=>A_exp(4),
        Sa=>abs_A_exp);
        
    POW2: multiplicador port map(
        A_M=>abs_A_exp(7 downto 0),
        B_M=>abs_A_exp(7 downto 0),
        S_M=>pow2_abs_A);

    POW3: multiplicador port map(
        A_M=>pow2_abs_A(7 downto 0), 
        B_M=>abs_A_exp(7 downto 0),
        S_M=>pow3_abs_A);    
    
    not_pow3<=not pow3_abs_A;
    
    POW3_A2_sum: somador16bits port map(
        A=>not_pow3,
        B=>"0000000000000001",
        Ci=>'0',
        S=>pow3_A2);
    

    ABS_POW3: mux port map(
        A=>pow3_abs_A,
        B=>pow3_A2,
        Se=>A_exp(4),
        Sa=>signed_pow3);

    
    MUXDE4: mux4 port map(
      
      A_4 => "0000000000000001",
      B_4 => A_exp_16,
      C_4 => pow2_abs_A,
      D_4 =>signed_pow3,
      Se_4 => B_exp,
      Sa_4=>S_exp);
      
end funcionamento;